#include "ns3/core-module.h"
#include "ns3/internet-module.h"
#include "ns3/wifi-module.h"
#include "ns3/mobility-module.h"
#include "ns3/traci-applications-module.h"
#include "ns3/network-module.h"
#include "ns3/traci-module.h"
#include "ns3/wave-module.h"
#include "ns3/netanim-module.h"
#include "ns3/mobility-model.h"
#include <iostream>
#include <boost/tokenizer.hpp>
#include <functional>
#include <stdlib.h>
#include <cmath>

/* Programma di test per una simulazione di una rete vanet V2V
 * che va ad usare ns3 e sumo. 
 * La struttura generale del programma è mantenuta simile a quella fornita 
 * dall'esempio di TU Dresden "ns3-sumo-coupling-simple.cc" quindi con la 
 * definizione di due classi, una "TestProject" che è l'applicazione vera
 * e propria, e la classe "TestProjectHelper" che farà da supporto nella 
 * creazione delle istanze della classe detta in precedenza. 
 */

//data structur to print into a file
std::map<double, std::map<int, std::vector<double>>> output;

//vado a creare le due classi che ci servono all'interno del namspace ns3
namespace ns3 {

  NS_LOG_COMPONENT_DEFINE("TestProjectApplication");

  /* Classe TestProject che definisce un apllicazione UDP vera e propria.
   * In questa classe andremmo ad implementare le comunicazioni tra veicoli,
   * settando sia un client che un server su ogni nodo. 
   */
  class TestProject : public Application {
  public:
    /*
     * GetTypeId method: return an identifier and set some information about the class. 
     */
    static TypeId GetTypeId(void) {
      static TypeId tid = TypeId("ns3::ProjectTestNode")
        .SetParent<Application>()
        .SetGroupName("Applications")
        .AddConstructor<TestProject>()
        .AddAttribute("Port", "Port on which we send packets.",
                       UintegerValue(9),
                       MakeUintegerAccessor(&TestProject::m_port),
                       MakeUintegerChecker<uint16_t>())
        .AddAttribute("Interval", "The time to wait between packets",
                       TimeValue(Seconds(0.011)),
                       MakeTimeAccessor(&TestProject::m_interval),
                       MakeTimeChecker())
        .AddAttribute("Window", "The time between each stats calculation",
                       TimeValue(Seconds(1.0)),
                       MakeTimeAccessor(&TestProject::m_window),
                       MakeTimeChecker())
        .AddAttribute("Project1", "Enables the project functionality of the rerouting part",
                       BooleanValue(true),
                       MakeBooleanAccessor(&TestProject::m_project_1),
                       MakeBooleanChecker())
        .AddAttribute("Project2", "Enables the project functionality of the adapt time interval part",
                       BooleanValue(true),
                       MakeBooleanAccessor(&TestProject::m_project_2),
                       MakeBooleanChecker())
        .AddAttribute("PacketSize", "Size of the packets to send.",
                       UintegerValue(500),
                       MakeUintegerAccessor(&TestProject::m_size),
                       MakeUintegerChecker<uint16_t>())    
        .AddAttribute("TimeWindow", "How much back into time we consider the variation of delay and throughput",
                       IntegerValue(1),
                       MakeIntegerAccessor(&TestProject::time_window),
                       MakeIntegerChecker<int>())
        .AddAttribute("Hard", "Hard threshold for the static tree first decision",
                       DoubleValue(1.8),
                       MakeDoubleAccessor(&TestProject::tr_hard),
                       MakeDoubleChecker<double>()) 
        .AddAttribute("Soft", "Soft threshold for the static tree second decision",
                       DoubleValue(1.5),
                       MakeDoubleAccessor(&TestProject::tr_soft),
                       MakeDoubleChecker<double>())
        .AddAttribute("Thr", "Throughput threshold for the static tree third decision",
                       DoubleValue(3.0),
                       MakeDoubleAccessor(&TestProject::tr_thr),
                       MakeDoubleChecker<double>())  
        .AddAttribute("Delay", "Delay threshold for the static tree third decision",
                       DoubleValue(6000.0),
                       MakeDoubleAccessor(&TestProject::tr_del),
                       MakeDoubleChecker<double>()) 
        .AddAttribute("TimeThr", "Time threshold for the throughput (only if the TimeWindow > 1)",
                       DoubleValue(2.0),
                       MakeDoubleAccessor(&TestProject::tr_t_thr),
                       MakeDoubleChecker<double>())
        .AddAttribute("TimeDelay", "Time threshold for the delay (only if the TimeWindow > 1)",
                       DoubleValue(2.0),
                       MakeDoubleAccessor(&TestProject::tr_t_del),
                       MakeDoubleChecker<double>())                
        .AddAttribute("Client", "TraCI client for SUMO",
                       PointerValue(0),
                       MakePointerAccessor(&TestProject::m_sumo_client),
                       MakePointerChecker<TraciClient>())
        .AddTraceSource("Tx", "A new packet is created and is sent", 
                          MakeTraceSourceAccessor(&TestProject::m_txTrace),
                          "ns3::Packet::TracedCallback")
      ;
      return tid;
    }

    /*
     * Contructor 
     */
    TestProject() {
      NS_LOG_FUNCTION(this);
      m_sendEvent = EventId();
      m_port = 0;
      m_socket = 0;
      m_socket_2 = 0;
      m_sumo_client = nullptr;
    }

    /*
     * Destructor
     */
    ~TestProject() {
      NS_LOG_FUNCTION(this);
      m_socket = 0;
      m_socket_2 = 0;
    }

    /*
     * StopApplicationNow is a function the stop the application on the vehicle.
     * The function simply call the StopApplication function that is private.
     */
    void StopApplicationNow() {
      NS_LOG_FUNCTION(this);
      StopApplication();
    }

  private:
    /*
     * Start application routine method. 
     * This method creates the sockets and records the callback to send and recive packets.
     */
    void StartApplication(void) {
      NS_LOG_FUNCTION(this);

      //Retrive vehicle information
      my_id = m_sumo_client->GetVehicleId(this->GetNode());
      my_road_id = m_sumo_client->vehicle.getRoadID(my_id);
      my_velocity = m_sumo_client->vehicle.getSpeed(my_id);
      my_packet_freq =(int)(1.0/m_interval.GetSeconds());

      //Set time window
      if(time_window > 1){
        t_thr = new double[time_window];
        t_del = new double[time_window];
        for(int i = 0; i < time_window; ++i){
          t_del[i] = t_thr[i] = 0;
        }
      }

      //Set current value of interval and window
      current_interval = m_interval;

      //Recv
      TypeId tid = TypeId::LookupByName("ns3::UdpSocketFactory");
      m_socket = Socket::CreateSocket(GetNode(), tid);
      InetSocketAddress local = InetSocketAddress(Ipv4Address::GetAny(), m_port);
      m_socket->Bind(local);
      m_socket->SetRecvCallback(MakeCallback(&TestProject::HandleRead, this));

      //Send
      TypeId tid_2 = TypeId::LookupByName("ns3::UdpSocketFactory");
      m_socket_2 = Socket::CreateSocket(GetNode(), tid_2);
      Ptr<Ipv4> ipv4 = this->GetNode()->GetObject<Ipv4>();
      Ipv4InterfaceAddress iaddr = ipv4->GetAddress(1, 0);
      Ipv4Address ipAddr = iaddr.GetBroadcast();
      InetSocketAddress remote = InetSocketAddress(ipAddr, m_port);
      m_socket_2->SetAllowBroadcast(true);
      m_socket_2->Connect(remote);

      //Randomization of 5 seconds to start transmit to avoid the blow up of the transmiton channel
      double r =((double) rand() /(RAND_MAX)) * 5;
      ScheduleTransmit(Seconds(r));
      ScheduleStats(m_window);
    }

    /*
     * StopApplication method, is used to stop the application on the node.
     */ 
    void StopApplication(void) {
      NS_LOG_FUNCTION(this);

      if(m_socket != 0){
        m_socket->Close();
        m_socket->SetRecvCallback(MakeNullCallback<void, Ptr<Socket> >());
      }

      if(m_socket_2 != 0){
        m_socket_2->Close();
        m_socket_2->SetRecvCallback(MakeNullCallback<void, Ptr<Socket> >());
      }

      Simulator::Cancel(m_sendEvent);
      Simulator::Cancel(m_statEvent);
    }

    /*
     * ScheduleTransmit method, that schedule the trasmission of a packet each dt time.
     */
    void ScheduleTransmit(Time dt) {
      NS_LOG_FUNCTION(this << dt);
      m_sendEvent = Simulator::Schedule(dt, &TestProject::Send, this);
    }
    
    /*
     * ScheduleStats method, that schedule the calculation of the stats each dt time.
     */
    void ScheduleStats(Time dt) {
      NS_LOG_FUNCTION(this << dt);
      m_statEvent = Simulator::Schedule(dt, &TestProject::CalcStats, this);
    }

    /*
     * Send method that send a paket 
     */
    void Send(void) {
      NS_LOG_FUNCTION(this << m_socket);

      std::ostringstream msg; 
      msg << my_id << "*"; //id
      msg << my_road_id << "*"; //road id
      msg << std::to_string(Simulator::Now().GetMicroSeconds()) << "*"; //time stamp
      msg << std::to_string(my_packet_freq) << "*"; //Packet frequency
      msg << std::to_string(is_stuck) << "*";   //traffic info

      //Padding
      for(int i = msg.str().length(); i < m_size; ++i) msg << "0";        
      msg << "\0";
      //Send
      Ptr<Packet> packet = Create<Packet>((uint8_t*) msg.str().c_str(), msg.str().length());
      m_socket_2->Send(packet);
/*      
      NS_LOG_INFO("Packet sent at time " << Simulator::Now().GetSeconds()
                  << "[veh:" << my_id << "]" 
                  << "[roadid:" << my_road_id << "]"
                  << "[p_f:" << my_packet_freq << "]"
                  << "[flag:" << std::to_string(is_stuck) << "]");
*/
      ScheduleTransmit(current_interval);
    }    

    void CalcStats(void) {
      //Update vehicle data
      std::string previous_road_id = my_road_id;
      try{
        my_velocity = m_sumo_client->vehicle.getSpeed(my_id);
        my_road_id = m_sumo_client->vehicle.getRoadID(my_id);
      } catch(libsumo::TraCIException &e) {
        std::cerr << *e.what() << std::endl;
        return;
      }

      //compute the string to print the map
      std::string s = "";
      for(auto it = id_v.cbegin(); it != id_v.cend(); ++it)
        s = s + it->first + ":" + std::to_string(it->second) + " - ";

      //Computation thr local and global
      thr =((sizepack*8.0)/m_window.GetSeconds())/(1024*1024); //Global thr
      thr_local =((sizepack_local*8.0)/m_window.GetSeconds())/(1024*1024); //Local thr
      double thr_x_car;
      if(npack != 0) thr_x_car =((min_sizepack * min_rate * 8.0)/m_window.GetSeconds())/(1024*1024);
      else thr_x_car = 0;

      //Compute number of local connection
      size_t cl = 0;
      auto it = info2.find(my_road_id);
      if(it != info2.end())
        cl = it->second.size();

      //compute sum for the packet loss
      double pl = 0;
      int sum = 0;
      std::string s2 = "";
      for(auto it = info1.cbegin(); it != info1.cend(); ++it) {
        sum +=(std::get<1>(it->second) + 1) * m_window.GetSeconds();
        s2 = s2 + it->first + ": " + std::get<0>(it->second) + "," + std::to_string(std::get<1>(it->second)) + " - ";
      }
      if(sum == 0) pl = -1;
      else pl = 1 -(npack / sum);
      //NS_LOG_INFO("ID: " << my_id << " - Info1: " << s2);

      //Compute the rateV(velocity of the vehicle / max vehicle of the road)
      double street_vel = m_sumo_client->lane.getMaxSpeed(m_sumo_client->vehicle.getLaneID(my_id));
      double rateV = my_velocity/street_vel;
      if(rateV >= 1) rateV = 1.0;

      bool rerouting = false; //boolean for rerouting procedure

      std::vector<double> countstuck; //Vector counting the stucked vehicle in each road
      
      if(npack != 0){ //Only if the vehicle recived at least one packet
        //Compute mean delay local and global
        mean_delay =(double)(delay / npack); //Global
        if(npack_local != 0)
          mean_delay_local =(double)(delay_local / npack_local); //Local

        //Update the time dependancies variables
        if(time_window > 1){
          if(time_i < time_window){
            t_del[time_i] = mean_delay_local;
            t_thr[time_i] = thr_local;
            ++time_i;
          } else {
            for(int i = 1; i < time_window; ++i){
              t_del[i - 1] = t_del[i];
              t_thr[i - 1] = t_thr[i];
            }
            t_del[time_window - 1] = mean_delay_local;
            t_thr[time_window - 1] = thr_local;
          }
        }

        //Print info
        // NS_LOG_INFO("ID: " << my_id << " - Thr: " << thr << " - Thr_L: " << thr_local << " THrxcar: " << thr_x_car << " Mbps - PL: " << pl  
        //             << " RateV: " << rateV << " - M_D: " << mean_delay << " us - M_D_L: " << mean_delay_local << " us - minD: " << min_delay
        //             << " us - N_p: " << npack << "\nID: " << my_id << " - Conn: " << id_v.size() << " - ConnL: " << cl << " - " << s);

        //Project part
        if(m_project_1) {
          //Decision tree to decide if the vehicle is stucked based on the parameters computed before
          /*if(cl >= 4) {
            if(thr_local >= 1.5*thr_x_car) {
              if(mean_delay_local >= 1.5*min_delay){
                NS_LOG_INFO("ID: " << my_id << " INGORGO1 ****** interval: " << current_interval.GetSeconds());
                is_stuck = 1;
              }
              else if(rateV <= 0.15){
                NS_LOG_INFO("ID: " << my_id << " INGORGO2 ****** interval: " << current_interval.GetSeconds());
                is_stuck = 0;
              }
              else {
                NS_LOG_INFO("ID: " << my_id << " OK0 ****** interval: " << current_interval.GetSeconds());
                is_stuck = 0;
              }
            } else {
              NS_LOG_INFO("ID: " << my_id << " OK1 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 0;
            }
          } else {
            //Here we can put time correlation analysis
            if(time_window > 1){
              std::string t = "ID: " + my_id + " Time Correlation:\n";
              for(int i = 0; i < time_window; ++i){
                t = t + "\ti:" + std::to_string(i) + " thr: " + std::to_string(t_thr[i]) + " del: " + std::to_string(t_del[i]) + "\n"; 
              }
              NS_LOG_INFO(t);
            } else {
              NS_LOG_INFO("ID: " << my_id << " OK2 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 0;
            }
          }*/

          if(cl >= 4) {
            if(thr_local >= tr_hard*thr_x_car && mean_delay_local >= tr_hard*min_delay) {
              NS_LOG_INFO("ID: " << my_id << " INGORGO1 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 1;
            } else if((thr_local >= tr_soft*thr_x_car || mean_delay_local >= tr_soft*min_delay) && rateV <= 0.10){
              NS_LOG_INFO("ID: " << my_id << " INGORGO2 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 1;
            } else if(thr >= tr_thr || mean_delay >= tr_del){
              NS_LOG_INFO("ID: " << my_id << " INGORGO3 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 1;
            } else {
              NS_LOG_INFO("ID: " << my_id << " OK0 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 0;
            }
          } else {
            //Here we can put time correlation analysis
            if(time_window > 1 && time_i == time_window){
              std::string t = "ID: " + my_id + " Time Correlation:\n";
              for(int i = 0; i < time_window; ++i){
                t = t + "\ti:" + std::to_string(i) + " thr: " + std::to_string(t_thr[i]) + " del: " + std::to_string(t_del[i]) + "\n"; 
              }
              NS_LOG_INFO(t);
              //Compute the variation between the two half windows
              double mean_t_thr_1 = 0;
              double mean_t_del_1 = 0;
              int index_1 = floor(time_window / 2);
              for(int i = 0; i < index_1; ++i){
                mean_t_thr_1 += t_thr[i];
                mean_t_del_1 += t_del[i];
              }
              mean_t_del_1 /= index_1;
              if(mean_t_del_1 == 0.0) //to avoid that a single value compromise the computation
                mean_t_del_1 = min_delay; 
              mean_t_thr_1 /= index_1;
              if(mean_t_thr_1 == 0.0) //to avoid that a single value compromise the computation
                mean_t_thr_1 = thr_x_car; 
              double mean_t_thr_2 = 0;
              double mean_t_del_2 = 0;
              for(int i = index_1; i < time_window; ++i){
                mean_t_thr_2 += t_thr[i];
                mean_t_del_2 += t_del[i];
              }
              mean_t_del_2 /= (time_window - index_1);
              mean_t_thr_2 /= (time_window - index_1);
              if((mean_t_thr_2 > tr_t_thr * mean_t_thr_1) || (mean_t_del_2 > tr_t_del * mean_t_del_1)){
                NS_LOG_INFO("ID: " << my_id << " INGORGO4 ****** interval: " << current_interval.GetSeconds());
                is_stuck = 1;
              } else {
                NS_LOG_INFO("ID: " << my_id << " OK2 ****** interval: " << current_interval.GetSeconds());
                is_stuck = 0;
              }
            } else {
              NS_LOG_INFO("ID: " << my_id << " OK1 ****** interval: " << current_interval.GetSeconds());
              is_stuck = 0;
            }
          }


          //Compute the number of stuck vehicle for each road 
          std::string s3 = "";
          for(auto it = info2.cbegin(); it != info2.cend(); ++it) {
            s3 = s3 + it->first + ": ";
            int count = 0;
            std::unordered_map<std::string, int> m = it->second;
            for(auto it2 = m.cbegin(); it2 != m.cend(); ++it2){
              s3 = s3 + it2->first + "," + std::to_string(it2->second) + " - ";
              count += it2->second;
            }
            countstuck.push_back((double)(count + is_stuck)/(it->second.size() + 1));
            s3 = s3 + " countstuck: " + std::to_string((double)count/it->second.size()) + " - ";      
          }
          //NS_LOG_INFO("ID: " << my_id << " - Info2: " << s3);

          //Set the stucked flag based on the messages of the other vehicles
          //And extract the list of blocked roads
          //And set the flag for the rerouting
          std::vector<std::string> v;
          int i = 0;
          for(auto it = info2.cbegin(); it != info2.cend(); ++it){
            if(countstuck.at(i) > 0.5){
              v.push_back(it->first);
              rerouting = true;
              if(my_road_id.compare(it->first) == 0){
                is_stuck = 1;
                rerouting = false;
                NS_LOG_INFO("Veicolo: " << my_id << " INGORGO CAUSA ALTRI - rerouting = FALSE");
              }
            }
            ++i;          
          }

          //Compute an alternative road if is possible
          if(rerouting){
            //reset the flag because we re-use it
            rerouting = false;
            //get the current route 
            std::vector<std::string> old_route = m_sumo_client->vehicle.getRoute(my_id);
            //array of old travel time
            double old_travel_time[v.size()];
            for(size_t i = 0; i < v.size(); ++i){
              old_travel_time[i] = m_sumo_client->edge.getTraveltime(v.at(i));
              NS_LOG_INFO(v.at(i) << " travel time: " << old_travel_time[i]);
              //in teoria non serve risettare il travel time perche il petodo lo fa in automatico dopo gli 0.5 secondi settati.
              m_sumo_client->edge.adaptTraveltime(v.at(i), old_travel_time[i]*100, 0.0, 0.5);
              //check if the vehicle have to take the blocked routes from the current point 
              int index = m_sumo_client->vehicle.getRouteIndex(my_id) + 1;
              if((!rerouting) && std::find(old_route.begin() + index, old_route.end(), v.at(i)) != old_route.end())
                rerouting = true;
            }
            if(rerouting){        
              //Rerouting procedure, capire cosa fa il bool a true o false
              m_sumo_client->vehicle.rerouteTraveltime(my_id, true);
              NS_LOG_INFO(my_id << " Rerouting!!!");
              std::vector<std::string> new_route = m_sumo_client->vehicle.getRoute(my_id);
              for(size_t i = 0; i < std::min(old_route.size(), new_route.size()); ++i){
                NS_LOG_INFO("Old: " << old_route.at(i) << " New: " << new_route.at(i));
              }
            }
          }
        } //end if m_project_1
        if(m_project_2){
          if((is_stuck || pl >= 0.85) && current_interval.GetSeconds() < 0.05){
            current_interval = Seconds(current_interval.GetSeconds() * 2);
            my_packet_freq =(int)(1.0/current_interval.GetSeconds());
            //NS_LOG_INFO("ID: " << my_id << " Interval: " << current_interval.GetSeconds());
          } else if(pl <= 0.15 && pl >= 0 && current_interval.GetSeconds() > 0.007){
            current_interval = Seconds(current_interval.GetSeconds() / 2);
            my_packet_freq =(int)(1.0/current_interval.GetSeconds());
            //NS_LOG_INFO("ID: " << my_id << " Interval: " << current_interval.GetSeconds());
          }
        } //end if m_project_2  
      } //end if npack != 0

      //Save data into output data structure
      double t =(double) Simulator::Now().GetSeconds();
      t =(floor((t*2) + 0.5) / 2);
      int id = std::stoi(my_id.substr(3, my_id.size()));
      std::vector<double> vec;
      vec.push_back((double) thr);
      vec.push_back((double) thr_local);
      vec.push_back((double) thr_x_car);
      vec.push_back((double) mean_delay);
      vec.push_back((double) mean_delay_local);
      vec.push_back((double) min_delay);
      vec.push_back((double) id_v.size());
      vec.push_back((double) cl);
      vec.push_back((double) rateV);
      vec.push_back((double) npack);
      vec.push_back((double) pl);
      vec.push_back((double) is_stuck);
      vec.push_back((double) current_interval.GetSeconds());
      if(rerouting)
        vec.push_back((double) 1);
      else
        vec.push_back((double) 0);
      output[t][id] = vec;

      //clean the variables
      npack = 0;
      sizepack = 0;
      mean_delay = 0;
      delay = 0;
      npack_local = 0;
      sizepack_local = 0;
      mean_delay_local = 0;
      delay_local = 0;
      min_rate = 1000;
      min_sizepack = 6000;
      min_delay = 999999;
      id_v.clear();
      info1.clear();
      info2.clear();

      ScheduleStats(m_window);
    }

    /*
     * HandleRead method used to manage the incoming packets.
     */
    void HandleRead(Ptr<Socket> socket) {
      NS_LOG_FUNCTION(this << socket);

      //boost separetor to tokenize the string/payload of the udp packet
      boost::char_separator<char> sep("*");
      //vector containing al the string of the udp packet payload 
      std::vector<std::string> payload;

      Ptr<Packet> packet;
      packet = m_socket->Recv();
      ++npack;
      sizepack += packet->GetSize();
      uint8_t *buffer = new uint8_t[packet->GetSize()];
      packet->CopyData(buffer, packet->GetSize());
      std::string s = std::string((char*) buffer);
      //tokenization 
      boost::tokenizer<boost::char_separator<char>> tokens(s, sep);
      for(const auto& t : tokens)
          payload.push_back(t);

      int64_t d =(Simulator::Now().GetMicroSeconds() - std::stoll(payload.at(2)));
      delay += d;
      
/*
      NS_LOG_INFO("Packet received by " << my_id << " - "
          << "[s:" << payload.at(0) << "]"
          << "[s_road_id:" << payload.at(1) << "]"
          << "[timestamp:" << payload.at(2) << "]"
          << "[p_f:" << payload.at(3) << "]"
          << "[flag:" << payload.at(4) << "]");
*/

      //Now take the local information(from the vehicle on the same road id)
      if(my_road_id.compare(payload.at(1)) == 0){
        ++npack_local;
        sizepack_local += packet->GetSize();
        delay_local += d;
      }

      //Now take the min information
      if(min_sizepack > packet->GetSize())
        min_sizepack = packet->GetSize();
      if(min_rate > std::stoi(payload.at(3)))
        min_rate = std::stoi(payload.at(3));
      if(min_delay > d)
        min_delay = d;

      //Update info of the network(ns3)
      auto f = id_v.find(payload.at(0));
      if(f != id_v.end())
        f->second = f->second + 1;
      else 
        id_v.insert({payload.at(0), 1});

      //Update info of vehicle(info1)
      auto it1 = info1.find(payload.at(0));
      if(it1 != info1.end())
        it1->second = std::make_tuple(payload.at(1), std::stoi(payload.at(3)));
      else 
        info1.insert({payload.at(0), std::make_tuple(payload.at(1), std::stoi(payload.at(3)))});

      //Update info of vehicle(info2)
      auto it2 = info2.find(payload.at(1));
      if(it2 != info2.end()){
        auto it3 = it2->second.find(payload.at(0));
        if(it3 != it2->second.end())
          it3->second = std::stoi(payload.at(4));
        else
          it2->second.insert({payload.at(0), std::stoi(payload.at(4))});
      }
      else{ 
        std::unordered_map<std::string, int> m;
        m.insert({payload.at(0), std::stoi(payload.at(4))});        
        info2.insert({payload.at(1), m});
      }
    }

    bool m_project_1 = true;        //Enables rerouting functionality
    bool m_project_2 = true;        //Enables frequency adaptivity functionality

    uint16_t m_port;                //Port 

    Time m_interval;                //Packet inter-send time
    Time current_interval;          //Current packet interval
    Time m_window;                  //Time to collect stats
    uint16_t m_size;                //Size of each packet

    Ptr<Socket> m_socket;           //Socket recv
    Ptr<Socket> m_socket_2;         //Socket send

    EventId m_sendEvent;            //Event to send the next packet
    EventId m_statEvent;            //Event to compute the stats

    Ptr<TraciClient> m_sumo_client; //Sumo client

    /// Callbacks for tracing the packet Tx events
    TracedCallback<Ptr<const Packet> > m_txTrace;

    //Stats variables
    double npack = 0;               //Total number of packet recived(global)
    uint32_t sizepack = 0;          //Size of the packets(global)
    double npack_local = 0;         //Total number of packet recived(local/same road_id)
    uint32_t sizepack_local = 0;    //Size of the packets(local/same road_id)
    double thr = 0;                 //Throughput global
    double thr_local = 0;           //Throughput local
    int64_t delay = 0;              //Sum of all delay
    int64_t mean_delay = 0;         //Mead delay
    int64_t delay_local = 0;        //Sum of all delay local
    int64_t mean_delay_local = 0;   //Mead delay local
    uint32_t min_sizepack = 6000;   //Min size pack
    int min_rate = 1000;            //Min rate
    int64_t min_delay = 999999;     //Min delay
    //Map keeping vehicle ID and the number of packets recived for each vehicle
    std::unordered_map<std::string, int> id_v;

    //Vehicle status variables
    std::string my_road_id;
    std::string my_id;
    double my_velocity;          
    int my_packet_freq;
    uint8_t is_stuck = 0;

    //Other vehicles status varibles
    //Info1: vehicle ID: <road ID, frequency>
    std::unordered_map<std::string, std::tuple<std::string, int>> info1;
    //Info2: road ID: vehicle ID: is_stack
    std::unordered_map<std::string, std::unordered_map<std::string, int>> info2;
    //Time correlation variables 
    int time_window;                  //Size of the two time windows
    double *t_thr;                    //Thr time window
    double *t_del;                    //Delay time window
    int time_i = 0;                   //Counter for the two time windows

    //Thresholds 
    double tr_hard;
    double tr_soft;
    double tr_thr;
    double tr_del;
    double tr_t_thr;
    double tr_t_del;
  };

  /*
   * Helper class for ProjectTest.
   * La classe è esattamente uguale al prototipo fornito da TU Dresden quindi non l'abbbaimo modificata.
   */
  class TestProjectHelper {
  public:
    TestProjectHelper(uint16_t port_send, Time interval, Time window, bool project_1, bool project_2, uint16_t packet_size, int t_w,
                      double hard, double soft, double thr, double del, double t_thr, double t_del) {
      m_factory.SetTypeId(TestProject::GetTypeId());
      SetAttribute("Port", UintegerValue(port_send));
      SetAttribute("Interval", TimeValue(interval));
      SetAttribute("Window", TimeValue(window));
      SetAttribute("Project1", BooleanValue(project_1));
      SetAttribute("Project2", BooleanValue(project_2));
      SetAttribute("PacketSize", UintegerValue(packet_size));
      SetAttribute("TimeWindow", IntegerValue(t_w));
      SetAttribute("Hard", DoubleValue(hard));
      SetAttribute("Soft", DoubleValue(soft));
      SetAttribute("Thr", DoubleValue(thr));
      SetAttribute("Delay", DoubleValue(del));
      SetAttribute("TimeThr", DoubleValue(t_thr));
      SetAttribute("TimeDelay", DoubleValue(t_del));
    }

    /**
     * Record an attribute to be set in each Application after it is is created.
     *
     * \param name the name of the attribute to set
     * \param value the value of the attribute to set
     */
    void SetAttribute(std::string name, const AttributeValue &value) {
      m_factory.Set(name, value);
    }

    /**
     * Create a TestProject application on the specified Node.
     *
     * \param node The node on which to create the Application.  The node is
     *             specified by a Ptr<Node>.
     *
     * \returns An ApplicationContainer holding the Application created,
     */
    ApplicationContainer Install(Ptr<Node> node) const {
      return ApplicationContainer(InstallPriv(node));
    }

    /**
     * Create a TestProject application on specified node
     *
     * \param nodeName The node on which to create the application.  The node
     *                 is specified by a node name previously registered with
     *                 the Object Name Service.
     *
     * \returns An ApplicationContainer holding the Application created.
     */
    ApplicationContainer Install(std::string nodeName) const {
      Ptr<Node> node = Names::Find<Node>(nodeName);
      return ApplicationContainer(InstallPriv(node));
    }

    /**
     * \param c The nodes on which to create the Applications.  The nodes
     *          are specified by a NodeContainer.
     *
     * Create one TestProject application on each of the Nodes in the
     * NodeContainer.
     *
     * \returns The applications created, one Application per Node in the 
     *          NodeContainer.
     */
    ApplicationContainer Install(NodeContainer c) const {
      ApplicationContainer apps;
      for(NodeContainer::Iterator i = c.Begin(); i != c.End(); ++i){
          apps.Add(InstallPriv(*i));
      }
      return apps;
    }

  private:
    /**
     * Install an ns3::TestProject on the node configured with all the
     * attributes set with SetAttribute.
     *
     * \param node The node on which an TestProject will be installed.
     * \returns Ptr to the application installed.
     */
    Ptr<Application> InstallPriv(Ptr<Node> node) const {
      Ptr<Application> app = m_factory.Create<TestProject>();
      node->AddApplication(app);

      return app;
    }

    ObjectFactory m_factory; //Object factory.
  };

  NS_OBJECT_ENSURE_REGISTERED(TestProject);

} // namespace ns3

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("ns3-project-test");

int main(int argc, char *argv[]) {
  //Opzioni di log in
  bool verbose = true;
  int port = 9;
  Time interval(0.011);
  Time window(1.0);
  double p_rate = 1.0;
  bool project_1 = true;
  bool project_2 = true;
  uint16_t p_size = 500;
  std::string file;
  int n_v = 10;
  int t_window = 1;
  double hard = 1.8, soft = 1.5, thr = 3.0, del = 6000.0, t_thr = 1.8, t_del = 1.8;

  CommandLine cmd;
  cmd.AddValue("Port", "Port on which we send packets.", port);
  cmd.AddValue("Interval", "The time to wait between packets", interval);
  cmd.AddValue("Window", "The time between each stats calculation", window);
  cmd.AddValue("PenetrationRate", "Portion of vehicles equipped with wifi", p_rate);
  cmd.AddValue("Project1", "Enables the project functionality of the rerouting part", project_1);
  cmd.AddValue("Project2", "Enables the project functionality of the adapt time interval part", project_2);
  cmd.AddValue("PacketSize", "Size of the packets to send.", p_size);
  cmd.AddValue("Filename", "File name where the output is saved", file);
  cmd.AddValue("MaxVehicles", "Max number of vehicles generated by sumo", n_v);
  cmd.AddValue("TimeWindow", "How much back into time we consider the variation of delay and throughput", t_window);
  cmd.AddValue("Hard", "Hard threshold for the static tree first decision", hard);
  cmd.AddValue("Soft", "Soft threshold for the static tree second decision", soft);
  cmd.AddValue("Thr", "Throughput threshold for the static tree third decision", thr);
  cmd.AddValue("Delay", "Delay threshold for the static tree third decision", del);
  cmd.AddValue("TimeThr", "Time threshold for the throughput (only if the TimeWindow > 1)", t_thr);
  cmd.AddValue("TimeDelay", "Time threshold for the delay (only if the TimeWindow > 1)", t_del);
  cmd.Parse(argc, argv);
  if(verbose) {
    LogComponentEnable("TraciClient", LOG_LEVEL_INFO);
    LogComponentEnable("TestProjectApplication", LOG_LEVEL_INFO);
  }

  // Creazione di un pool di nodi perchè devono essere creati in precedenza per sumo
  ns3::Time simulationTime(ns3::Seconds(90.0));
  NodeContainer nodePool;
  nodePool.Create(1000);
  uint32_t nodeCounter(0);
  NetDeviceContainer netDevices;

  YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default();
  YansWifiChannelHelper wifiChannel = YansWifiChannelHelper::Default();
  wifiChannel.AddPropagationLoss("ns3::NakagamiPropagationLossModel");
  wifiChannel.AddPropagationLoss("ns3::RandomPropagationLossModel");
  wifiPhy.Set("TxPowerStart", DoubleValue(21.5));
  wifiPhy.Set("TxPowerEnd", DoubleValue(21.5));
  wifiPhy.SetChannel(wifiChannel.Create());
  wifiPhy.SetPcapDataLinkType(WifiPhyHelper::DLT_IEEE802_11);
  NqosWaveMacHelper wifi80211pMac = NqosWaveMacHelper::Default();
  Wifi80211pHelper wifi80211p = Wifi80211pHelper::Default();
  wifi80211p.SetStandard(WIFI_PHY_STANDARD_80211_10MHZ);
  netDevices = wifi80211p.Install(wifiPhy, wifi80211pMac, nodePool);

  // Creazione stack di internet
  InternetStackHelper stack;
  stack.Install(nodePool);

  // Assegnazione ip
  Ipv4AddressHelper address;
  address.SetBase("10.0.0.0", "255.0.0.0");
  Ipv4InterfaceContainer ipv4Interfaces;
  ipv4Interfaces = address.Assign(netDevices);

  // Settaggio della mobilità del pool di nodi! 
  // Vanno messi all'esterno dell mappa in modo tale da non disturbare durante la simulazione dei nodi creati
  // Messi in un cerchio in posizione(-100, -100) di raggio 25. 
  MobilityHelper mobility;
  Ptr<UniformDiscPositionAllocator> positionAlloc = CreateObject<UniformDiscPositionAllocator>();
  positionAlloc->SetX(-100.0);
  positionAlloc->SetY(-100.0);
  positionAlloc->SetRho(25.0);
  mobility.SetPositionAllocator(positionAlloc);
  mobility.SetMobilityModel("ns3::ConstantPositionMobilityModel");
  mobility.Install(nodePool);

  // Setup del client per sumo
  Ptr<TraciClient> sumoClient = CreateObject<TraciClient>();
  sumoClient->SetAttribute("SumoConfigPath", StringValue("maps/oklahoma_city_3/osm.sumocfg"));
  sumoClient->SetAttribute("SumoBinaryPath", StringValue(""));    // use system installation of sumo
  sumoClient->SetAttribute("SynchInterval", TimeValue(Seconds(0.1)));
  sumoClient->SetAttribute("StartTime", TimeValue(Seconds(100.0)));
  sumoClient->SetAttribute("SumoGUI", BooleanValue(true));
  sumoClient->SetAttribute("SumoPort", UintegerValue(3400));
  sumoClient->SetAttribute("PenetrationRate", DoubleValue(p_rate));  // portion of vehicles equipped with wifi
  sumoClient->SetAttribute("SumoLogFile", BooleanValue(true));
  sumoClient->SetAttribute("SumoStepLog", BooleanValue(false));
  sumoClient->SetAttribute("SumoSeed", IntegerValue(10));
  sumoClient->SetAttribute("SumoAdditionalCmdOptions", StringValue("--verbose true --max-num-vehicles " + std::to_string(n_v)));
  sumoClient->SetAttribute("SumoWaitForSocket", TimeValue(Seconds(3.0)));  

  // Creazione dell'helper per la creazione delle unità mobili(veicoli/nodi)
  TestProjectHelper testProjectHelper(port, interval, window, project_1, project_2, p_size, t_window,
                                      hard, soft, thr, del, t_thr, t_del);
  testProjectHelper.SetAttribute("Client",(PointerValue) sumoClient); // pass TraciClient object for accessing sumo in application

  // Creazione di una callback che verrà chiamata quando viene creato un veicolo in sumo! 
  std::function<Ptr<Node>()> setupNewWifiNode = [&]() -> Ptr<Node> {
    if(nodeCounter >= nodePool.GetN())
      NS_FATAL_ERROR("Node Pool empty!: " << nodeCounter << " nodes created.");

    // don't create and install the protocol stack of the node at simulation time -> take from "node pool"
    Ptr<Node> includedNode = nodePool.Get(nodeCounter);
    ++nodeCounter;// increment counter for next node

    // Install Application
    ApplicationContainer testProjectApps = testProjectHelper.Install(includedNode);
    testProjectApps.Start(Seconds(0.0));
    testProjectApps.Stop(simulationTime);

    return includedNode;
  };

  // callback per lo spegnimento di un nodo che ha finito il suo ciclo in sumo
  std::function<void(Ptr<Node>)> shutdownWifiNode = [](Ptr<Node> exNode) {
    // stop all applications
    Ptr<TestProject> testProject = exNode->GetApplication(0)->GetObject<TestProject>();
    if(testProject)
      testProject->StopApplicationNow();

    // set position outside communication range
    Ptr<ConstantPositionMobilityModel> mob = exNode->GetObject<ConstantPositionMobilityModel>();
    mob->SetPosition(Vector(-100.0+(rand()%25),-100.0+(rand()%25),25.0));// rand() for visualization purposes

    // NOTE: further actions could be required for a save shut down!
  };

  // Lanciamo il client per sumo con le due callback fatte in precedenza  
  sumoClient->SumoSetup(setupNewWifiNode, shutdownWifiNode);  

  // inizio simulazione
  //AnimationInterface anim("scratch/project.xml"); // Mandatory
  Simulator::Stop(simulationTime);

  Simulator::Run();
  Simulator::Destroy();

  //Save into a csv file
  std::ofstream fout;
  std::string file_name = "results/" + file + ".csv";
  fout.open(file_name);
  for(auto it = output.cbegin(); it != output.cend(); ++it){
    for(auto it2 = it->second.cbegin(); it2 != it->second.cend(); ++it2){
      fout << it->first << "\t" << it2->first;
      for(size_t i = 0; i < it2->second.size(); ++i){
        fout << "\t" << it2->second.at(i);
      }
      fout << "\n";
    }
  }
  fout.close();

  return 0;
}