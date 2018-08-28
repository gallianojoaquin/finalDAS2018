package ar.edu.ubp.das.src.sorteo.consumo;

import org.apache.cxf.endpoint.Client;
import org.apache.cxf.jaxws.endpoint.dynamic.JaxWsDynamicClientFactory;

import ar.edu.ubp.das.src.sorteo.utils.BundleManager;

public class ClienteAxis2 implements ClienteServicio {

	@Override
	public String consumir(String url, String funcion, String fechaSorteo) {	
		System.out.println("#\t -- Consumiendo WS Axis2 ");
		
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();
		
		Client client = dcf.createClient(url);
		 
		Object[] res = null;
		try {
			res = client.invoke(funcion, BundleManager.getBundle().getString("identifyParameterValue"), fechaSorteo);
		}
		catch (Exception e) {
			
			System.out.println( e.getMessage() );
			e.printStackTrace();
		}
		
		return (String)res[0];
	}
	
	@Override
	public String notificarGanador(String url, String nombre, String apellido, String idCliente, String idSorteo, String idConcesionaria) {
		System.out.println("#\t -- Axis2 ");
		
		JaxWsDynamicClientFactory dcf = JaxWsDynamicClientFactory.newInstance();

		Client client = dcf.createClient(url);
		 
		Object[] res = null;
		try {
			res = client.invoke("ganador", nombre, apellido, idCliente, idSorteo, idConcesionaria);
		}
		catch (Exception e) {
			
			System.out.println( e.getMessage() );
			e.printStackTrace();
		}

		return (String)res[0];
	}
}
