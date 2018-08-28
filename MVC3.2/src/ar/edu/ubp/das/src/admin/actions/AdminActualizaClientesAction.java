package ar.edu.ubp.das.src.admin.actions;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import java.lang.reflect.Type;
import ar.edu.ubp.das.general.ClienteServicio;
import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.admin.daos.MSClientesDao;
import ar.edu.ubp.das.src.admin.daos.MSVehiculosDao;
import ar.edu.ubp.das.src.admin.forms.ClienteForm;
import ar.edu.ubp.das.src.admin.forms.CuotaForm;
import ar.edu.ubp.das.src.admin.forms.ServiceResponseForm;
import ar.edu.ubp.das.src.admin.forms.VehiculoForm;

public class AdminActualizaClientesAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
		
		boolean ok = true;
		try {
			Dao dao = DaoFactory.getDao("GetConcesionaria", "admin");
			List<DynaActionForm> concesionarias = dao.select(form);
			if(concesionarias == null) {
				return mapping.getForwardByName("information");
			}
			for(DynaActionForm concesionaria : concesionarias) {
				boolean actualizacionConcesionaria = this.actualizarClientesConcesionaria(concesionaria);
				
				if(!actualizacionConcesionaria) {				
					ok = false;
				}
			}
		}
		catch(Exception e) {
			System.out.println( e.getMessage() );
		}
		
		if(ok) {
			request.setAttribute("ActualizarClientes", "Todas las concesionarias han sido correctamente actualizadas.");
			return mapping.getForwardByName("success");
		}
		
		return mapping.getForwardByName("information");		
	}
	
	private boolean actualizarClientesConcesionaria(DynaActionForm concesionariaActual ) {

		boolean ok = true;
		
		System.out.println("\n -> Concesionaria: " + concesionariaActual.getItem("razon_social"));
		
		try {
			ClienteServicio clienteServicio = ClienteServicio.class.cast(
					Class.forName(
							ClienteServicio.class.getPackage().getName() +
							".Cliente" + concesionariaActual.getItem("sufijo")).newInstance() );
			
			String json = clienteServicio.consumir(concesionariaActual.getItem("url"), "clientes");

			System.out.println( "\n -> Procesando los clientes" );
			
			LinkedList<ClienteForm> clientes = createList( json );

			System.out.println( "\n -> Guardando los datos" );

			int cantidadActualSuscripciones = 0;
			
			Dao suscripciones;
			try {
				DynaActionForm form = new DynaActionForm();
				form.setItem("idConcesionaria", concesionariaActual.getItem("id_concesionaria"));
				
				suscripciones = DaoFactory.getDao( "Suscripciones", "admin" );
				List<DynaActionForm> suscripcionesList = suscripciones.select(form);
				
				cantidadActualSuscripciones = suscripcionesList.size();
			}
			catch (SQLException e) {
				
				System.out.println("\n -> Error al consultar las suscripciones: " + e.getMessage());
				
				logError("Error al consultar adhesiones: " + e.getMessage());
			}
			
			for( ClienteForm cliente : clientes ) {
				
				if( cliente.getIdentificadorGob().equals("NUEVOCOMPRADOR")) {

					cantidadActualSuscripciones++;
					
					String tokenActual = 
							concesionariaActual.getItem("razonSocial") + "-" +
								    String.valueOf(cantidadActualSuscripciones);
					
					cliente.setIdentificadorGob( tokenActual );
					
					//System.out.println("Seteando token de vuelta");
					
					
					//clienteServicio.actualizarToken(concesionariaActual.getItem("url"), "/setearToken", Integer.parseInt(cliente.getDni()), tokenActual );
					
					
					int idAuto = -1;					
					if( cliente.getAuto().getDominio() != null ) {
						
						this.insertarAuto(cliente.getAuto());
						
						idAuto = this.getIdAuto(cliente.getAuto());
					}
					
					String idCliente = this.insertarCliente(concesionariaActual, cliente);
					
					this.insertarAdhesion(concesionariaActual, cliente, cantidadActualSuscripciones, idCliente, idAuto);
					
					this.insertarCuotas( cliente, concesionariaActual, idCliente, cantidadActualSuscripciones );
				}
			}
			
			ok = true;		
			
			DynaActionForm form = new DynaActionForm();
			form.setItem("id_concesionaria", concesionariaActual.getItem("id_concesionaria"));
			
			System.out.println( "\n -> Registrando la actualización de datos");
			
			Dao actualizacionesDao;
			try {
				actualizacionesDao = DaoFactory.getDao( "Actualizaciones", "admin" );
				actualizacionesDao.insert(form);
			}
			catch (SQLException e) {
				System.out.println("\n -> Error al registrar actualización: " + e.getMessage());

				this.logError( "Error al registrar actualización: " + e.getMessage() );
			}
			
			System.out.println("\n -> Proceso efectuado correctamente!!! ");
		}
		catch (Exception e) {
			
			ok = false;
			
			System.out.println(e.getMessage());

			System.out.println( "\n -> Algún error al actualizar los datos de la concesionaria" );
			System.out.println( "\n -> No se llevara a cabo el sorteo" );
			
			this.logError( "[" + concesionariaActual.getItem("razonSocial") + "] " + concesionariaActual.getItem("tecnologia") + ": "+ e.getMessage() );
		}
		
		return ok;
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
			cliente.setIdentificadorGob(resultadosServicio.get(i).getIdentificadorGob());
			cliente.setNombre(resultadosServicio.get(i).getNombre());
			cliente.setApellido(resultadosServicio.get(i).getApellido());
			cliente.setDni(resultadosServicio.get(i).getDni());;
			cliente.setMail(resultadosServicio.get(i).getMail());
			cliente.setProvincia(resultadosServicio.get(i).getProvincia());
			cliente.setLocalidad(resultadosServicio.get(i).getLocalidad());
			cliente.setDireccion(resultadosServicio.get(i).getDireccion());
			
			VehiculoForm vehiculo = new VehiculoForm();
			vehiculo.setMarca(resultadosServicio.get(i).getMarca());
			vehiculo.setModelo(resultadosServicio.get(i).getModelo());
			vehiculo.setVersion(resultadosServicio.get(i).getVersion());
			vehiculo.setDominio(resultadosServicio.get(i).getDominio());
			vehiculo.setNumMotor(resultadosServicio.get(i).getNumMotor());
			vehiculo.setNumChasis(resultadosServicio.get(i).getNumChasis());
			vehiculo.setColor(resultadosServicio.get(i).getColor());
			vehiculo.setAnio(resultadosServicio.get(i).getAnio());
			
			LinkedList<CuotaForm> cuotas = new LinkedList<CuotaForm>();
			
			String token = cliente.getDni();
			
			while(resultadosServicio.size() > i &&
			      resultadosServicio.get(i).getDni().equals(token)) {
				
				CuotaForm cuota = new CuotaForm();
				cuota.setIdCuota(resultadosServicio.get(i).getIdCuota());
				cuota.setFechaVencimiento(resultadosServicio.get(i).getFechaVencimiento());
				cuota.setFechaPago(resultadosServicio.get(i).getFechaPago());
				cuotas.add(cuota);
				
				i++;
			}
			
			cliente.setAuto(vehiculo);
			cliente.setCuotas(cuotas);
			
			clientes.add(cliente);
		}		
		return clientes;
	}
		
	private void insertarCuotas(ClienteForm cliente,DynaActionForm concesionariaActual,String idCliente,int idAdhesion) {

		for(CuotaForm c : cliente.getCuotas()) {

			DynaActionForm form = new DynaActionForm();
			
			form.setItem("idConcesionaria", concesionariaActual.getItem("id_concesionaria"));
			form.setItem("idCliente", idCliente);
			form.setItem("idAdhesion", String.valueOf(idAdhesion));
			form.setItem("idCuota", c.getIdCuota());
			form.setItem("fechaVencimiento", c.getFechaVencimiento());
			form.setItem("fechaPago", c.getFechaPago());
			
			Dao cuotasDao;
			try {
				cuotasDao = DaoFactory.getDao( "Cuotas", "admin" );
				cuotasDao.insert(form);
			}
			catch (SQLException e) {
				
				logError(e.getMessage());
			}
		}
	}

	private void insertarAdhesion(DynaActionForm concesionariaActual,
								  ClienteForm cliente,
								  int cantidadActualAdhesiones,
								  String idCliente,
								  int idAuto){
		
		DynaActionForm form = new DynaActionForm();
		
		form.setItem("identificadorGob",cliente.getIdentificadorGob());
		form.setItem("idConcesionaria", concesionariaActual.getItem("id_concesionaria"));
		form.setItem("idCliente", idCliente);
		form.setItem("idAdhesion", String.valueOf(cantidadActualAdhesiones));
		form.setItem("idAuto", String.valueOf(idAuto));
		
		int cantidadCuotasPagas = 0;
		
		for(CuotaForm c : cliente.getCuotas()) {
			
			if(c.getFechaPago()!=null) {
				cantidadCuotasPagas++;
			}
		}
		
		form.setItem("cantCuotasPagas",String.valueOf(cantidadCuotasPagas));
		
		String alDia = "s";
		
		for( CuotaForm cuota : cliente.getCuotas() ) {
			
			if(cuota.getFechaPago()==null) {
				
				Date fechaHoy = new Date();
				
			    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

	            Date fechaVencimiento = null;
	            
				try {
					fechaVencimiento = formatter.parse(cuota.getFechaVencimiento());
					
					if( fechaVencimiento.before(fechaHoy)) {
						
						alDia = "n";
					}
				}
				catch (ParseException e) {
					
					e.printStackTrace();
				}
				
				break;
			}
		}
		
		form.setItem("alDia",alDia);
		
		Dao adhesionesDao;
		try {
			adhesionesDao = DaoFactory.getDao( "Suscripciones", "admin" );
			adhesionesDao.insert(form);
		}
		catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
	}
	
	private void insertarAuto(VehiculoForm auto) {

		DynaActionForm form = new DynaActionForm();
		
		form.setItem("marca", auto.getMarca());
		form.setItem("modelo", auto.getModelo());
		form.setItem("version", auto.getVersion());
		form.setItem("dominio", auto.getDominio());
		form.setItem("anio", auto.getAnio());
		
		
		MSVehiculosDao vehiculosDao;
		try {
			vehiculosDao = (MSVehiculosDao)DaoFactory.getDao( "Vehiculos", "admin" );
			vehiculosDao.insert(form);
		}
		catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
	}
	
	private String insertarCliente(DynaActionForm concesionariaActual, ClienteForm cliente) {
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idConcesionaria", concesionariaActual.getItem("id_concesionaria"));
		form.setItem("idCliente",
				String.valueOf(
					(this.getMaxIdCliente(
							Integer.parseInt(
									concesionariaActual.getItem("id_concesionaria"))))+1));
		form.setItem("nombre",cliente.getNombre());
		form.setItem("apellido",cliente.getApellido());
		form.setItem("dni",cliente.getDni());
		form.setItem("mail",cliente.getMail());
		form.setItem("provincia",cliente.getProvincia());
		form.setItem("localidad",cliente.getLocalidad());
		form.setItem("direccion",cliente.getDireccion());
		
		Dao clientesDao;
		try {
			clientesDao = DaoFactory.getDao( "Clientes", "admin" );
			clientesDao.insert(form);
		}
		catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
		return form.getItem("idCliente");
	}

	private int getMaxIdCliente(int idConcesionaria) {
		
		MSClientesDao clientesDao;
		try {
			clientesDao = (MSClientesDao)DaoFactory.getDao( "Clientes", "admin" );
			return clientesDao.getMaxIdCliente(idConcesionaria);
		}
		catch (SQLException e) {
			
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
			autosDao = (MSVehiculosDao)DaoFactory.getDao( "Vehiculos", "admin" );
			ret = autosDao.getIdAuto(form);
		}
		catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
		return ret;
	}

	public void logError(String error) {
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("descripcionError", error);
		
		Dao erroresDao;
		try {
			erroresDao = DaoFactory.getDao( "Errores", "admin" );
			erroresDao.insert(form);
		}
		catch (SQLException e) {
			
			System.out.println(e.getMessage());
		}
		
		System.out.println(error);
	}

}
