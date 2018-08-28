package ar.edu.ubp.das.general;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

public class ClienteAxis2 implements ClienteServicio {

	@Override
	public String consumir(String url, String funcion) {
		// TODO Auto-generated method stub
		
		System.out.println("\n\t>> Consumiendo Axis2\n");
		
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		
		Client client = dcf.createClient(url);
		 
		Object[] res = null;
		try {
			res = client.invoke(funcion, BundleManager.getBundle().getString("identifyParameterValue"));
		}
		catch (Exception e) {
			
			// TODO Auto-generated catch block
			System.out.println( e.getMessage() );
			e.printStackTrace();
		}
		
		return (String)res[0];
	}
}
