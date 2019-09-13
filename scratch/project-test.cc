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

/* Programma di test per una simulazione di una rete vanet V2V
 * che va ad usare ns3 e sumo. 
 * La struttura generale del programma è mantenuta simile a quella fornita 
 * dall'esempio di TU Dresden "ns3-sumo-coupling-simple.cc" quindi con la 
 * definizione di due classi, una "TestProject" che è l'applicazione vera
 * e propria, e la classe "TestProjectHelper" che farà da supporto nella 
 * creazione delle istanze della classe detta in precedenza. 
 */

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
    static TypeId GetTypeId (void) {
      static TypeId tid = TypeId ("ns3::ProjectTestNode")
        .SetParent<Application> ()
        .SetGroupName("Applications")
        .AddConstructor<TestProject> ()
        .AddAttribute ("Port", "Port on which we send packets.",
                       UintegerValue (9),
                       MakeUintegerAccessor (&TestProject::m_port),
                       MakeUintegerChecker<uint16_t> ())
        .AddAttribute ("Interval", "The time to wait between packets",
                       TimeValue (Seconds (0.011)),
                       MakeTimeAccessor (&TestProject::m_interval),
                       MakeTimeChecker ())
        .AddAttribute ("Window", "The time between each stats calculation",
                       TimeValue (Seconds (1.0)),
                       MakeTimeAccessor (&TestProject::m_window),
                       MakeTimeChecker ())
        .AddAttribute ("Project", "Enables the project functionality",
                       BooleanValue (true),
                       MakeBooleanAccessor (&TestProject::m_project),
                       MakeBooleanChecker ())
        .AddAttribute ("PacketSize", "Size of the packets to send.",
                       UintegerValue (500),
                       MakeUintegerAccessor (&TestProject::m_size),
                       MakeUintegerChecker<uint16_t> ())                       
        .AddAttribute ("Client", "TraCI client for SUMO",
                       PointerValue (0),
                       MakePointerAccessor (&TestProject::m_sumo_client),
                       MakePointerChecker<TraciClient> ())
        .AddTraceSource ("Tx", "A new packet is created and is sent", 
                          MakeTraceSourceAccessor (&TestProject::m_txTrace),
                          "ns3::Packet::TracedCallback")
      ;
      return tid;
    }

    /*
     * Contructor 
     */
    TestProject () {
      NS_LOG_FUNCTION(this);
      m_sendEvent = EventId ();
      m_port = 0;
      m_socket = 0;
      m_socket_2 = 0;
      m_sumo_client = nullptr;
    }

    /*
     * Destructor
     */
    ~TestProject () {
      NS_LOG_FUNCTION(this);
      m_socket = 0;
      m_socket_2 = 0;
    }

    /*
     * StopApplicationNow is a function the stop the application on the vehicle.
     * The function simply call the StopApplication function that is private.
     */
    void StopApplicationNow () {
      NS_LOG_FUNCTION(this);
      StopApplication ();
    }

  private:
    /*
     * Start application method. 
     * This method creates the sockets and records the callback to send and recive packets.
     */
    void StartApplication (void) {
      NS_LOG_FUNCTION(this);

      //Retrive vehicle information
      my_id = m_sumo_client->GetVehicleId(this->GetNode());
      my_road_id = m_sumo_client->vehicle.getRoadID(my_id);
      my_velocity = m_sumo_client->vehicle.getSpeed(my_id);
      my_packet_freq = (int) (m_window.GetSeconds()/m_interval.GetSeconds());

      //Recv
      TypeId tid = TypeId::LookupByName ("ns3::UdpSocketFactory");
      m_socket = Socket::CreateSocket (GetNode(), tid);
      InetSocketAddress local = InetSocketAddress (Ipv4Address::GetAny(), m_port);
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

      ScheduleTransmit(Seconds(0.0));
      //Simulator::Schedule (Seconds (10.0), &TestProject::ChangeSpeed, this);
      ScheduleStats(m_window);
    }

    /*
     * StopApplication method, is used to stop the application on the node.
     */ 
    void StopApplication (void) {
      NS_LOG_FUNCTION(this);

      if (m_socket != 0){
        m_socket->Close ();
        m_socket->SetRecvCallback (MakeNullCallback<void, Ptr<Socket> > ());
      }

      if (m_socket_2 != 0){
        m_socket_2->Close ();
        m_socket_2->SetRecvCallback (MakeNullCallback<void, Ptr<Socket> > ());
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
    void Send (void) {
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
      
      Ptr<Packet> packet = Create<Packet>((uint8_t*) msg.str().c_str(), msg.str().length());

      m_socket_2->Send(packet);
      
      NS_LOG_INFO("Packet sent at time " << Simulator::Now().GetSeconds()
                  << "[veh:" << my_id << "]" 
                  << "[roadid:" << my_road_id << "]"
                  << "[p_f:" << my_packet_freq << "]"
                  << "[flag:" << std::to_string(is_stuck) << "]");

      ScheduleTransmit(m_interval);
    }    

    void CalcStats (void) {
      //Update vehicle data
      try{
        my_velocity = m_sumo_client->vehicle.getSpeed(my_id);
        my_road_id = m_sumo_client->vehicle.getRoadID(my_id);
      } catch(libsumo::TraCIException &e) {
        std::cerr << *e.what() << std::endl;
        return;
      }
      
      std::string s = "";
      //compute the string to print the map
      for(auto it = id_v.cbegin(); it != id_v.cend(); ++it) {
        s = s + it->first + ":" + std::to_string(it->second) + " - ";
      }

      thr = ((sizepack*8.0)/m_window.GetSeconds())/(1024*1024);
      if (id_v.size() == 0) thr_car = 0;
      else thr_car = thr/id_v.size();
      if(npack != 0){
        mean_delay = (double) (delay / npack);
        NS_LOG_INFO("ID: " << my_id << " - Thr: " << thr 
                    << " Mbps - Thr/cars: " << thr_car << " Mbps - MeanDelay: " << mean_delay 
                    << " us - N_p: " << npack << " Conn: " << id_v.size() << " - " << s);
  
        s = "";
        for(auto it = info1.cbegin(); it != info1.cend(); ++it) {
          s = s + it->first + ": " + it->second + "- ";
        }
        NS_LOG_INFO("ID: " << my_id << " - Info1: " << s);

        s = "";
        for(auto it = info2.cbegin(); it != info2.cend(); ++it) {
          s = s + it->first + ": ";
          std::vector<std::string> vec = it->second;
          std::sort(vec.begin(), vec.end());
          vec.erase(unique(vec.begin(), vec.end()), vec.end());
          for(size_t i = 0; i < vec.size(); ++i){
            s = s + vec.at(i) + ",";
          }
          s = s + " - ";
        }
        NS_LOG_INFO("ID: " << my_id << " - Info2: " << s);
      }

      npack = 0;
      sizepack = 0;
      mean_delay = 0;
      delay = 0;
      id_v.clear();
      info1.clear();
      info2.clear();

      ScheduleStats(m_window);
    }

    /*
     * HandleRead method used to manage the incoming packets.
     */
    void HandleRead (Ptr<Socket> socket) {
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
      std::string s = std::string ((char*) buffer);
      //tokenization 
      boost::tokenizer<boost::char_separator<char>> tokens(s, sep);
      for (const auto& t : tokens) {
          payload.push_back(t);
      }
    
      delay += (Simulator::Now().GetMicroSeconds() - std::stoll(payload.at(2)));

      NS_LOG_INFO("Packet received by " << my_id << " - "
          << "[s:" << payload.at(0) << "]"
          << "[s_road_id:" << payload.at(1) << "]"
          << "[timestamp:" << payload.at(2) << "]"
          << "[p_f:" << payload.at(3) << "]"
          << "[flag:" << payload.at(4) << "]");

      //Update info of the network(ns3)
      auto f = id_v.find(payload.at(0));
      if (f != id_v.end())
        f->second = f->second + 1;
      else 
        id_v.insert({payload.at(0), 1});

      //Update info of vehicle (info1)
      auto it1 = info1.find(payload.at(0));
      if (it1 != info1.end())
        it1->second = std::string(payload.at(1));
      else 
        info1.insert({payload.at(0), std::string(payload.at(1))});

      //Update info of vehicle (info2)
      auto it2 = info2.find(payload.at(1));
      if (it2 != info2.end())
        it2->second.push_back(payload.at(0));
      else{ 
        std::vector<std::string> v;
        v.push_back(payload.at(0));
        info2.insert({payload.at(1), v});
      }
    }

    bool m_project = true;        //Enables project functionality

    uint16_t m_port;              //Port 

    Time m_interval;              //Packet inter-send time
    Time m_window;                //Time to collect stats
    uint16_t m_size;              //Size of each packet

    Ptr<Socket> m_socket;         //Socket recv
    Ptr<Socket> m_socket_2;       //Socket send

    EventId m_sendEvent;          //Event to send the next packet
    EventId m_statEvent;          //Event to compute the stats

    Ptr<TraciClient> m_sumo_client; //Sumo client

    /// Callbacks for tracing the packet Tx events
    TracedCallback<Ptr<const Packet> > m_txTrace;

    //Stats variables
    double npack = 0;
    uint32_t sizepack = 0;
    double thr = 0;
    double thr_car = 0;
    int64_t delay = 0;
    int64_t mean_delay = 0;
    std::unordered_map<std::string, int> id_v;

    //Vehicle status variables
    std::string my_road_id;
    std::string my_id;
    uint16_t my_velocity;          
    int my_packet_freq;
    uint8_t is_stuck = 0;

    //Other vehicles status varibles
    std::unordered_map<std::string, std::string> info1;
    std::unordered_map<std::string, std::vector<std::string>> info2;
  };

  /*
   * Helper class for ProjectTest.
   * La classe è esattamente uguale al prototipo fornito da TU Dresden quindi non l'abbbaimo modificata.
   */
  class TestProjectHelper {
  public:
    TestProjectHelper (uint16_t port_send, Time interval, Time window, bool project, uint16_t packet_size) {
      m_factory.SetTypeId (TestProject::GetTypeId ());
      SetAttribute("Port", UintegerValue(port_send));
      SetAttribute("Interval", TimeValue(interval));
      SetAttribute("Window", TimeValue(window));
      SetAttribute("Project", BooleanValue(project));
      SetAttribute("PacketSize", UintegerValue(packet_size));
    }

    /**
     * Record an attribute to be set in each Application after it is is created.
     *
     * \param name the name of the attribute to set
     * \param value the value of the attribute to set
     */
    void SetAttribute (std::string name, const AttributeValue &value) {
      m_factory.Set (name, value);
    }

    /**
     * Create a TestProject application on the specified Node.
     *
     * \param node The node on which to create the Application.  The node is
     *             specified by a Ptr<Node>.
     *
     * \returns An ApplicationContainer holding the Application created,
     */
    ApplicationContainer Install (Ptr<Node> node) const {
      return ApplicationContainer (InstallPriv (node));
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
    ApplicationContainer Install (std::string nodeName) const {
      Ptr<Node> node = Names::Find<Node> (nodeName);
      return ApplicationContainer (InstallPriv (node));
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
    ApplicationContainer Install (NodeContainer c) const {
      ApplicationContainer apps;
      for (NodeContainer::Iterator i = c.Begin (); i != c.End (); ++i){
          apps.Add (InstallPriv (*i));
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
    Ptr<Application> InstallPriv (Ptr<Node> node) const {
      Ptr<Application> app = m_factory.Create<TestProject> ();
      node->AddApplication (app);

      return app;
    }

    ObjectFactory m_factory; //Object factory.
  };

  NS_OBJECT_ENSURE_REGISTERED(TestProject);

} // namespace ns3

using namespace ns3;

NS_LOG_COMPONENT_DEFINE("ns3-project-test");

int main (int argc, char *argv[]) {
  //Opzioni di log in
  bool verbose = true;
  int port = 9;
  Time interval(0.011);
  Time window(1.0);
  double p_rate = 1.0;
  bool project = true;
  uint16_t p_size = 500;

  CommandLine cmd;
  cmd.AddValue("Port", "Port on which we send packets.", port);
  cmd.AddValue("Interval", "The time to wait between packets", interval);
  cmd.AddValue("Window", "The time between each stats calculation", window);
  cmd.AddValue("PenetrationRate", "Portion of vehicles equipped with wifi", p_rate);
  cmd.AddValue("Project", "Enables the project functionality", project);
  cmd.AddValue("PacketSize", "Size of the packets to send.", p_size);
  cmd.Parse(argc, argv);
  if (verbose) {
    LogComponentEnable ("TraciClient", LOG_LEVEL_INFO);
    LogComponentEnable ("TestProjectApplication", LOG_LEVEL_INFO);
  }

  // Creazione di un pool di nodi perchè devono essere creati in precedenza per sumo
  ns3::Time simulationTime (ns3::Seconds(5000));
  NodeContainer nodePool;
  nodePool.Create (1000);
  uint32_t nodeCounter (0);
  NetDeviceContainer netDevices;

  YansWifiPhyHelper wifiPhy = YansWifiPhyHelper::Default ();
  YansWifiChannelHelper wifiChannel = YansWifiChannelHelper::Default ();
  wifiChannel.AddPropagationLoss ("ns3::NakagamiPropagationLossModel");
  wifiChannel.AddPropagationLoss ("ns3::RandomPropagationLossModel");
  wifiPhy.Set("TxPowerStart", DoubleValue (21.5));
  wifiPhy.Set("TxPowerEnd", DoubleValue (21.5));
  wifiPhy.SetChannel (wifiChannel.Create ());
  wifiPhy.SetPcapDataLinkType (WifiPhyHelper::DLT_IEEE802_11);
  NqosWaveMacHelper wifi80211pMac = NqosWaveMacHelper::Default ();
  Wifi80211pHelper wifi80211p = Wifi80211pHelper::Default ();
  //wifi80211p.SetRemoteStationManager ("ns3::ConstantRateWifiManager",
  //                                    "DataMode",StringValue ("OfdmRate6MbpsBW10MHz"),
  //                                    "ControlMode",StringValue ("OfdmRate6MbpsBW10MHz"));
  wifi80211p.SetStandard(WIFI_PHY_STANDARD_80211_10MHZ);
  netDevices = wifi80211p.Install(wifiPhy, wifi80211pMac, nodePool);

  // Creazione stack di internet
  InternetStackHelper stack;
  stack.Install (nodePool);

  // Assegnazione ip
  Ipv4AddressHelper address;
  address.SetBase ("10.0.0.0", "255.0.0.0");
  Ipv4InterfaceContainer ipv4Interfaces;
  ipv4Interfaces = address.Assign (netDevices);

  // Settaggio della mobilità del pool di nodi! 
  // Vanno messi all'esterno dell mappa in modo tale da non disturbare durante la simulazione dei nodi creati
  // Messi in un cerchio in posizione (-100, -100) di raggio 25. 
  MobilityHelper mobility;
  Ptr<UniformDiscPositionAllocator> positionAlloc = CreateObject<UniformDiscPositionAllocator> ();
  positionAlloc->SetX (-100.0);
  positionAlloc->SetY (-100.0);
  positionAlloc->SetRho (25.0);
  mobility.SetPositionAllocator (positionAlloc);
  mobility.SetMobilityModel ("ns3::ConstantPositionMobilityModel");
  mobility.Install (nodePool);

  // Setup del client per sumo
  Ptr<TraciClient> sumoClient = CreateObject<TraciClient> ();
  sumoClient->SetAttribute ("SumoConfigPath", StringValue ("maps/test4/osm.sumocfg"));
  sumoClient->SetAttribute ("SumoBinaryPath", StringValue (""));    // use system installation of sumo
  sumoClient->SetAttribute ("SynchInterval", TimeValue (Seconds (0.1)));
  sumoClient->SetAttribute ("StartTime", TimeValue (Seconds (0.0)));
  sumoClient->SetAttribute ("SumoGUI", BooleanValue (true));
  sumoClient->SetAttribute ("SumoPort", UintegerValue (3400));
  sumoClient->SetAttribute ("PenetrationRate", DoubleValue (p_rate));  // portion of vehicles equipped with wifi
  sumoClient->SetAttribute ("SumoLogFile", BooleanValue (true));
  sumoClient->SetAttribute ("SumoStepLog", BooleanValue (false));
  sumoClient->SetAttribute ("SumoSeed", IntegerValue (10));
  sumoClient->SetAttribute ("SumoAdditionalCmdOptions", StringValue ("--verbose true"));
  sumoClient->SetAttribute ("SumoWaitForSocket", TimeValue (Seconds (3.0)));  

  // Creazione dell'helper per la creazione delle unità mobili (veicoli/nodi)
  TestProjectHelper testProjectHelper(port, interval, window, project, p_size
  );
  testProjectHelper.SetAttribute ("Client", (PointerValue) sumoClient); // pass TraciClient object for accessing sumo in application

  // Creazione di una callback che verrà chiamata quando viene creato un veicolo in sumo! 
  std::function<Ptr<Node> ()> setupNewWifiNode = [&] () -> Ptr<Node> {
    if (nodeCounter >= nodePool.GetN())
      NS_FATAL_ERROR("Node Pool empty!: " << nodeCounter << " nodes created.");

    // don't create and install the protocol stack of the node at simulation time -> take from "node pool"
    Ptr<Node> includedNode = nodePool.Get(nodeCounter);
    ++nodeCounter;// increment counter for next node

    // Install Application
    ApplicationContainer testProjectApps = testProjectHelper.Install (includedNode);
    testProjectApps.Start (Seconds (0.0));
    testProjectApps.Stop (simulationTime);

    return includedNode;
  };

  // callback per lo spegnimento di un nodo che ha finito il suo ciclo in sumo
  std::function<void (Ptr<Node>)> shutdownWifiNode = [] (Ptr<Node> exNode) {
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
  sumoClient->SumoSetup (setupNewWifiNode, shutdownWifiNode);  

  // inizio simulazione
  //AnimationInterface anim ("scratch/project.xml"); // Mandatory
  Simulator::Stop (simulationTime);

  Simulator::Run ();
  Simulator::Destroy ();

  return 0;
}