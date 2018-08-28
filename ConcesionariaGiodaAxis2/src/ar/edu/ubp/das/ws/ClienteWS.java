package ar.edu.ubp.das.ws;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.daos.MSClientesDao;

public class ClienteWS {
	
	public String ganador(String nombre, String apellido, String idCliente, String idSorteo, String concesionaria) {
		System.out.println("Params: Nombre->" + nombre + " - Apellido->"+ apellido +" - IdCLiente->" + idCliente + " - Concesionaria->" + concesionaria);
		try {
			MSClientesDao dao = (MSClientesDao)DaoFactory.getDao( "Clientes", "ar.edu.ubp.das.src" );
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
	
	public String clientes(String solicitante, String fechaSorteo) {
		List<DynaActionForm> clientes = new LinkedList<DynaActionForm>();
		try {
			MSClientesDao dao = (MSClientesDao)DaoFactory.getDao( "Clientes", "ar.edu.ubp.das.src" );
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
		} 
		catch (SQLException e) {
			return "Error al obtener datos";
		}
	}
	
	public String ping() {
		return "pong";
	}
	

}
