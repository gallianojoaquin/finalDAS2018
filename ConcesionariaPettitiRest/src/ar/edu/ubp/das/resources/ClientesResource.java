package ar.edu.ubp.das.resources;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.daos.MSClientesDao;

@Path("/pettiti")
@Produces(MediaType.APPLICATION_JSON + ";charset=UTF-8")
public class ClientesResource {

	@POST
	@Path("/ganador") 
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public String ganador(@FormParam("nombre") String nombre, @FormParam("apellido") String apellido, @FormParam("idCliente") String idCliente, @FormParam("idSorteo") String idSorteo, @FormParam("concesionaria") String concesionaria) {
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
	
	@POST
	@Path("/clientes")
	@Consumes(MediaType.APPLICATION_FORM_URLENCODED)
	public Response getClientes(@FormParam("solicitante") String solicitante, @FormParam("fechaSorteo") String fechaSorteo) {

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
			
			return Response.status( Response.Status.OK ).entity( gson.toJson(clientesForJson) ).build();
			
		} catch ( SQLException error ) {

    	    return Response.status( Response.Status.BAD_REQUEST ).entity( "Error al obtener datos" ).build();
		}
	}
	
	@POST
	@Path("/ping")
	public String ping() {
		return "pong";		
	}
	
//	@POST
//	@Path("/ganador")
//	public String ganador(String nombre, String apellido, String idConcesionaria) {
//		return "ok";		
//	}
}


