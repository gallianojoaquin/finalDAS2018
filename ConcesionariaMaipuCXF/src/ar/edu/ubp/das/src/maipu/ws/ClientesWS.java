package ar.edu.ubp.das.src.maipu.ws;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebService;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.maipu.daos.MSClientesDao;

@WebService(targetNamespace = "http://ws.maipu.src.das.ubp.edu.ar/", portName = "ClientesWSPort", serviceName = "ClientesWSService")
public class ClientesWS {

	@WebMethod(operationName = "ganador", action = "urn:Ganador")
	public String ganador( @WebParam(name = "arg0") String nombre,@WebParam(name = "arg1") String apellido,@WebParam(name = "arg2") String idCliente, @WebParam(name = "arg3") String idSorteo,@WebParam(name = "arg4") String concesionaria) {
		System.out.println("Params: Nombre->" + nombre + " - Apellido->"+ apellido +" - IdCLiente->" + idCliente + " - Concesionaria->" + concesionaria);
		try {
			MSClientesDao dao = (MSClientesDao)DaoFactory.getDao( "Clientes", "ar.edu.ubp.das.src.maipu" );
			DynaActionForm form = new DynaActionForm();
			form.setItem("idGanador", idCliente);
			form.setItem("idSorteo", idSorteo);
			form.setItem("concesionaria", concesionaria);
			form.setItem("nombre", nombre);
			form.setItem("apellido", apellido);
			dao.insert(form);
			return "ok";	
		} catch (SQLException e) {			
			e.printStackTrace();
			return e.getLocalizedMessage();	
		}
			
	}
	
	@WebMethod(operationName = "clientes", action = "urn:Clientes")
	public String clientes(@WebParam(name = "arg0") String solicitante, @WebParam(name = "arg1") String fechaSorteo) {
		List<DynaActionForm> clientes = new LinkedList<DynaActionForm>();
		try {
			MSClientesDao dao = (MSClientesDao)DaoFactory.getDao( "Clientes", "ar.edu.ubp.das.src.maipu" );
			
			DynaActionForm daf = new DynaActionForm();
			daf.setItem("solicitante", solicitante);
			daf.setItem("fechaSorteo", fechaSorteo);
			
			clientes = dao.select(daf);
			
			LinkedList<Map<String,Object>> clientesForJson = new LinkedList<Map<String,Object>>();
			
			for( DynaActionForm c : clientes ) {
				
				clientesForJson.add(c.getItems());
			}
			
			Gson gson = new GsonBuilder().create();
			return gson.toJson(clientesForJson);
			
		} catch (SQLException e) {

			return "Error al obtener datos";
		}
	}
	
	@WebMethod(operationName = "ping", action = "urn:Ping")
	public String ping() {
		return "pong";
	}
}
