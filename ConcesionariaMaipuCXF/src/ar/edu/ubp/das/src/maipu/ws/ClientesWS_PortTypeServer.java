
package ar.edu.ubp.das.src.maipu.ws;

import javax.xml.ws.Endpoint;

/**
 * This class was generated by Apache CXF 3.1.7
 * 2018-08-10T18:44:11.279-03:00
 * Generated source version: 3.1.7
 * 
 */
 
public class ClientesWS_PortTypeServer{

    protected ClientesWS_PortTypeServer() throws Exception {
        System.out.println("Starting Server");
        Object implementor = new ar.edu.ubp.das.src.maipu.ws.ClientesWS();
        String address = "http://localhost:7071/ConcesionariaMaipuCXF/services";
        Endpoint.publish(address, implementor);
    }
    
    public static void main(String args[]) throws Exception { 
        new ClientesWS_PortTypeServer();
        System.out.println("Server ready MAIPU..."); 
        
        //Thread.sleep(5 * 60 * 1000); 
        //System.out.println("Server exiting");
        //System.exit(0);
    }
}
 
 