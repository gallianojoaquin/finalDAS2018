package ar.edu.ubp.das.src.sorteo.main;

import java.lang.reflect.Type;
import java.sql.SQLException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.sorteo.daos.MSVehiculosDao;
import ar.edu.ubp.das.src.sorteo.forms.ClienteForm;
//import ar.edu.ubp.das.src.sorteo.forms.CuotaForm;
import ar.edu.ubp.das.src.sorteo.forms.ServiceResponseForm;
import ar.edu.ubp.das.src.sorteo.forms.VehiculoForm;
import ar.edu.ubp.das.src.sorteo.consumo.ClienteServicio;
import ar.edu.ubp.das.src.sorteo.daos.MSActualizacionesDao;
/*import ar.edu.ubp.das.src.sorteo.daos.MSClientesDao;*/
import ar.edu.ubp.das.src.sorteo.daos.MSGetConcesionariaDao;

/**
*
* @author JOAQUÍN GALLIANO
*
*/
public class AdminDatosClientes {
	
	private static AdminDatosClientes instance = null;
	
	protected AdminDatosClientes() {
		
	}
	
	private static synchronized void createInstance() {
		
		 if(instance == null) {			
		    instance = new AdminDatosClientes();
		 }
   }
	
	public static AdminDatosClientes getInstance() {
		
		 createInstance();
		 
		 return instance;
    }
	
	public List<DynaActionForm> obtenerConcesionarias(){
		
		try {
			MSGetConcesionariaDao concesionariasAutorizadasDao = (MSGetConcesionariaDao)DaoFactory.getDao("GetConcesionaria", "ar.edu.ubp.das.src.sorteo" );			
			return concesionariasAutorizadasDao.select(null);
		}
		catch(Exception e){
			System.out.println( e.getMessage() );
			return new ArrayList<DynaActionForm>();
		}
	}	
	
	public List<DynaActionForm> obtenerConcesionariasFallidas(Integer idSorteo){
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", idSorteo.toString());
		
		try {
			MSActualizacionesDao concesionariasDao = (MSActualizacionesDao)DaoFactory.getDao("Actualizaciones", "ar.edu.ubp.das.src.sorteo" );						
			return concesionariasDao.select(form);
		}
		catch(Exception e){
			System.out.println( e.getMessage() );
			return new ArrayList<DynaActionForm>();
		}
	}	
	
	public boolean actualizarDatosClientes(Integer idSorteo, String fechaSorteo){
		
		boolean ok = true;
		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		List<DynaActionForm> concesionariasFallidas = new LinkedList<DynaActionForm>();
		DynaActionForm form = new DynaActionForm();
		boolean huboActualizaciones = false;
		if(idSorteo != null) {
			
			form.setItem("idSorteo", idSorteo.toString());
			MSActualizacionesDao actualizaciones = new MSActualizacionesDao();
			try {
				huboActualizaciones = actualizaciones.selectActualizaciones(form);
			}
			catch(Exception e) {
				huboActualizaciones = false;
			}
		}
		try {			
			if(idSorteo != null && huboActualizaciones) {
				concesionariasFallidas = obtenerConcesionariasFallidas(idSorteo);
			}
			if(huboActualizaciones && concesionariasFallidas.size() > 0) {
				concesionarias = concesionariasFallidas;
			}
			else {
				concesionarias = obtenerConcesionarias();	
			}	
			int idActualizacion = getMaxIdActualizacion();
			for(DynaActionForm concesionaria : concesionarias) {
				boolean actualizacionConcesionaria = this.actualizarClientesConcesionaria(concesionaria, idSorteo, idActualizacion, fechaSorteo);
				
				if(!actualizacionConcesionaria) {				
					ok = false;
				}				
			}
		}
		catch(Exception e) {			
			System.out.println( e.getMessage() );
		}
		
		return ok;		
	}
	
	boolean actualizarClientesConcesionaria(DynaActionForm concesionariaActual, Integer idSorteo, Integer idActualizacion, String fechaSorteo) {
		boolean procesadoOk;
		System.out.println("#");
		System.out.println("# -> Concesionaria: " + concesionariaActual.getItem("razonSocial"));
		String estadoActualizacion = "SUCCESS";
		try {
			ClienteServicio clienteServicio = ClienteServicio.class.cast(Class.forName(ClienteServicio.class.getPackage().getName() + ".Cliente" + concesionariaActual.getItem("sufijo")).newInstance() );
			String json = clienteServicio.consumir(concesionariaActual.getItem("urlServicio"), "clientes", fechaSorteo);
			procesadoOk = procesarClientes(json, concesionariaActual);				
		}
		catch (Exception e) {
			
			procesadoOk = false;
			estadoActualizacion= "FAILURE";
			
			System.out.println(e.getLocalizedMessage());
			System.out.println("# \t -- Algún error al actualizar los datos de la concesionaria" );
			
			this.logError( "[" + concesionariaActual.getItem("razonSocial") + "] " + concesionariaActual.getItem("tecnologia") + ": "+ e.getMessage() );
		}
		
		System.out.println("# \t -- Registrando la actualización de datos");
		System.out.println("# \t -- Marco la actualizacion en la concesionaria.");
		
		MSActualizacionesDao actualizacionesDao;
		DynaActionForm form = new DynaActionForm();
		form.setItem("id_concesionaria", concesionariaActual.getItem("idConcesionaria"));
		form.setItem("id_sorteo", idSorteo != null ? idSorteo.toString() : String.valueOf(0));
		form.setItem("estado", estadoActualizacion);
		form.setItem("id_actualizacion", String.valueOf(idActualizacion + 1));
		try {
			actualizacionesDao = (MSActualizacionesDao)DaoFactory.getDao( "Actualizaciones", "ar.edu.ubp.das.src.sorteo" );
			actualizacionesDao.insert(form);
			
			System.out.println("#\t -- Actualizacion guardada ");
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error al registrar actualización: " + e.getMessage());

			this.logError( "Error al registrar actualización: " + e.getMessage() );
		}
		
		return procesadoOk;
	}
	
	
	public boolean procesarClientes(String json, DynaActionForm concesionariaActual ) {
		System.out.println( "#\t -- Procesando los clientes" );
		
		LinkedList<ClienteForm> clientes = createList( json );

		System.out.println( "#\t -- Guardando los datos" );
		boolean procesarClientes = true;
		for( ClienteForm cliente : clientes ) {
			
			int idAuto = -1;					
			if( cliente.getAuto().getDominio() != null ) {
				
				if(!this.insertarAuto(cliente.getAuto())) {
					procesarClientes = false;
				}
				
				idAuto = this.getIdAuto(cliente.getAuto());
			}
			
			if(!this.insertarCliente(concesionariaActual, cliente)) {
				return false;
			}
			
			if(!this.insertarSuscripcion(concesionariaActual, cliente, idAuto)) {
				procesarClientes = false;
			}
		}
		
		return procesarClientes;	
	}
	
	public LinkedList<ClienteForm> createList(String jsonList) {
		
		int i = 0;
		LinkedList<ServiceResponseForm> resultadosServicio = new LinkedList<ServiceResponseForm>();		
		Gson gson = new Gson();	
		Type type = new TypeToken<LinkedList<ServiceResponseForm>>(){}.getType();		
		resultadosServicio = gson.fromJson(jsonList, type);		
		LinkedList<ClienteForm> clientes = new LinkedList<ClienteForm>();				
		while( resultadosServicio.size() > i ) {
			
			ClienteForm cliente = new ClienteForm();
			cliente.setIdSuscripcion(resultadosServicio.get(i).getIdSuscripcion());
			cliente.setNombre(resultadosServicio.get(i).getNombre());
			cliente.setApellido(resultadosServicio.get(i).getApellido());
			cliente.setDni(resultadosServicio.get(i).getDni());;
			cliente.setMail(resultadosServicio.get(i).getMail());
			cliente.setTelefono(resultadosServicio.get(i).getTelefono());
			cliente.setFechaSuscripcion(resultadosServicio.get(i).getFechaSuscripcion());
			cliente.setDireccion(resultadosServicio.get(i).getDireccion());
			cliente.setLocalidad(resultadosServicio.get(i).getLocalidad());
			cliente.setProvincia(resultadosServicio.get(i).getProvincia());
			
			cliente.setIdConcesionaria(resultadosServicio.get(i).getIdConcesionaria());
			cliente.setUltCuotaPaga(resultadosServicio.get(i).getUltCuotaPaga());
			cliente.setCantCuotasPagas(resultadosServicio.get(i).getCantCuotasPagas());
			cliente.setAlDia(resultadosServicio.get(i).getAlDia());
			
			VehiculoForm vehiculo = new VehiculoForm();
			vehiculo.setMarca(resultadosServicio.get(i).getMarca());
			vehiculo.setModelo(resultadosServicio.get(i).getModelo());
			vehiculo.setVersion(resultadosServicio.get(i).getVersion());
			vehiculo.setDominio(resultadosServicio.get(i).getDominio());
			vehiculo.setNumMotor(resultadosServicio.get(i).getNumMotor());
			vehiculo.setNumChasis(resultadosServicio.get(i).getNumChasis());
			vehiculo.setColor(resultadosServicio.get(i).getColor());
			vehiculo.setAnio(resultadosServicio.get(i).getAnio());
			
			cliente.setAuto(vehiculo);			
			clientes.add(cliente);
			
			i++;
		}		
		return clientes;
	}
			
	private boolean insertarSuscripcion(DynaActionForm concesionariaActual, ClienteForm cliente, int idAuto){
		
		DynaActionForm form = new DynaActionForm();
		
		form.setItem("idConcesionaria", concesionariaActual.getItem("idConcesionaria"));
		form.setItem("dni", cliente.getDni());
		form.setItem("idAuto", String.valueOf(idAuto));
		form.setItem("idSuscripcion", String.valueOf(cliente.getIdSuscripcion()));
		form.setItem("cantCuotasPagas", String.valueOf(cliente.getCantCuotasPagas()));
		
		form.setItem("alDia", cliente.getAlDia());
		
		Dao suscripcionesDao;
		try {
			suscripcionesDao = DaoFactory.getDao( "Suscripciones", "ar.edu.ubp.das.src.sorteo" );
			suscripcionesDao.insert(form);
			return true;
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método insertarSuscripcion");
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	private boolean insertarAuto(VehiculoForm auto) {

		DynaActionForm form = new DynaActionForm();
		
		form.setItem("marca", auto.getMarca());
		form.setItem("modelo", auto.getModelo());
		form.setItem("version", auto.getVersion());
		form.setItem("dominio", auto.getDominio());
		form.setItem("anio", auto.getAnio());
				
		MSVehiculosDao vehiculosDao;
		try {
			vehiculosDao = (MSVehiculosDao)DaoFactory.getDao( "Vehiculos", "ar.edu.ubp.das.src.sorteo" );
			vehiculosDao.insert(form);
			return true;
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método insertarAuto");
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	private boolean insertarCliente(DynaActionForm concesionariaActual, ClienteForm cliente) {
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idConcesionaria", concesionariaActual.getItem("idConcesionaria"));
		form.setItem("idCliente", cliente.getIdSuscripcion());
		form.setItem("nombre",cliente.getNombre());
		form.setItem("apellido",cliente.getApellido());
		form.setItem("dni",cliente.getDni());
		form.setItem("mail",cliente.getMail());
		form.setItem("provincia",cliente.getProvincia());
		form.setItem("localidad",cliente.getLocalidad());
		form.setItem("direccion",cliente.getDireccion());
		
		Dao clientesDao;
		try {
			clientesDao = DaoFactory.getDao( "Clientes", "ar.edu.ubp.das.src.sorteo" );
			clientesDao.insert(form);
			return true;
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método insertarCliente");
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	private int getMaxIdActualizacion() {
		
		MSActualizacionesDao actualizacionesDao;
		try {
			actualizacionesDao = (MSActualizacionesDao)DaoFactory.getDao( "Actualizaciones", "ar.edu.ubp.das.src.sorteo" );
			return actualizacionesDao.getMaxIdActualizacion();
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método getMaxIdCliente");
			System.out.println(e.getMessage());
		}
		return 0;
	}
	
	private int getIdAuto(VehiculoForm auto) {
		
		DynaActionForm form = new DynaActionForm();
		
		form.setItem("marca", auto.getMarca());
		form.setItem("modelo", auto.getModelo());
		form.setItem("version", auto.getVersion());
		form.setItem("dominio", auto.getDominio());
		form.setItem("anio", auto.getAnio());
		
		MSVehiculosDao autosDao;
		int ret = -1;
		try {
			autosDao = (MSVehiculosDao)DaoFactory.getDao( "Vehiculos", "ar.edu.ubp.das.src.sorteo" );
			ret = autosDao.getIdAuto(form);
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método getIdAuto");
			System.out.println(e.getMessage());
		}
		return ret;
	}

	public void logError(String error) {
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("descripcionError", error);
		
		Dao erroresDao;
		try {
			erroresDao = DaoFactory.getDao( "Errores", "ar.edu.ubp.das.src.sorteo" );
			erroresDao.insert(form);
		}
		catch (SQLException e) {
			System.out.println("#\t -- Error en método logError");
			System.out.println(e.getMessage());
		}
		
		System.out.println(error);
	}
}
