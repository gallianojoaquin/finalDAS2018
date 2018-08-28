package ar.edu.ubp.das.src.sorteo.main;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

//import org.apache.commons.lang.time.DateUtils;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;
import ar.edu.ubp.das.src.sorteo.consumo.ClienteServicio;
import ar.edu.ubp.das.src.sorteo.daos.MSActualizacionesDao;
import ar.edu.ubp.das.src.sorteo.daos.MSSorteosDao;

public class Sorteo {

	public Sorteo() {
		
	}
	
	public DynaActionForm fechaDeSorteo() {
		
		Dao sorteosDao;
		DynaActionForm form = new DynaActionForm();
		try {
			sorteosDao = DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			List<DynaActionForm> sorteos = sorteosDao.select(null);
			
			for(DynaActionForm s : sorteos) {
				
				if( !s.getItem("estado").equals("ejecutado") && !s.getItem("estado").equals("finalizado")){

					Date fechaHoy = new Date();
					
				    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd"); 

		            Date fechaOriginal = null;
		            
					try {
						fechaOriginal = formatter.parse(s.getItem("fechaOriginal"));
						
						if( !fechaOriginal.after(fechaHoy) ) {
							form.setItem("idSorteo", s.getItem("idSorteo"));
							form.setItem("estado", s.getItem("estado"));
							form.setItem("fechaSorteo", s.getItem("fechaOriginal"));
						}
					}
					catch (ParseException e) {
						
						e.printStackTrace();
					}
				}
			}
		}
		catch(SQLException e) {
			
			System.out.println( "#");
			System.out.println( "# -> Error al consultar sorteos: " + e.getMessage());
			System.out.println( "#");
			
			AdminDatosClientes.getInstance().logError("Error al consultar sorteos: " + e.getMessage());
		}
		
		return form;
	}
	
	public boolean datosActualizados(int idSorteo) {		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(idSorteo));
		MSActualizacionesDao actualizacionesDao;
		try {
			actualizacionesDao = (MSActualizacionesDao) DaoFactory.getDao( "Actualizaciones", "ar.edu.ubp.das.src.sorteo" );
			return actualizacionesDao.selectActualizaciones(form);			
			
		}
		catch (SQLException e) {
			System.out.println("# -> Error al consultar actualizaciones: " + e.getMessage());	
			AdminDatosClientes.getInstance().logError("Error al consultar actualizaciones: " + e.getMessage());
			
			return false;
			
		}		
	}
	
	public boolean generarTablaParticipantes(int idSorteo) {
		
		System.out.println("#");
		System.out.println("# -> Cargando usuarios habilitados para el sorteo nro: " + idSorteo);
		System.out.println("#");
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(idSorteo));
		
		MSSorteosDao sorteosDao;
		try {
			sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			sorteosDao.procesarClientesParaSorteo(form);
			return true;
		}
		catch (SQLException e) {
			this.setEstadoSorteo(idSorteo, "definir_participantes");
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public void registrarErroneo(int idSorteo) {

		System.out.println("#");
		System.out.println("# -> Registrando error al ejecutar sorteo ");
		System.out.println("#");
		
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(idSorteo));
		
		MSSorteosDao sorteosDao;
		try {
			sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			sorteosDao.setSorteoErroneo(form);
		}
		catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}
	
	public DynaActionForm ejecutarSorteo(int idSorteo, String estado) {
		
		Dao clientesAptosDao;
		try {
			System.out.println("#");
			System.out.println("# -> Consultando la lista de clientes aptos para el sorteo");
			
			clientesAptosDao = DaoFactory.getDao( "ClientesAptos", "ar.edu.ubp.das.src.sorteo" );
			DynaActionForm form1 = new DynaActionForm();
			form1.setItem("idSorteo", String.valueOf(idSorteo));
			List<DynaActionForm> clientesAptos = clientesAptosDao.select(form1);
			DynaActionForm datosGanador = new DynaActionForm();
			if( clientesAptos.size() > 0 ) {
				System.out.println("#");
				System.out.println("# -> Hay " + clientesAptos.size() + " clientes aptos para el sorteo ");
				System.out.println("# -> Sorteando... ");
				
				int indiceGanador = (int) (Math.random() * clientesAptos.size());
				
				datosGanador.setItem("idSorteo", String.valueOf(idSorteo));
				datosGanador.setItem("idConcesionaria", clientesAptos.get(indiceGanador).getItem("idConcesionaria"));
				datosGanador.setItem("idCliente", clientesAptos.get(indiceGanador).getItem("idCliente"));
				datosGanador.setItem("mail", clientesAptos.get(indiceGanador).getItem("mail"));
				datosGanador.setItem("nombre", clientesAptos.get(indiceGanador).getItem("nombre"));
				datosGanador.setItem("apellido", clientesAptos.get(indiceGanador).getItem("apellido"));
				datosGanador.setItem("razonSocial", clientesAptos.get(indiceGanador).getItem("razonSocial"));
				
				System.out.println("# -> El ganador es: " + datosGanador.getItem("nombre") + " " + datosGanador.getItem("apellido") );
				System.out.println("# -> De la concesionaria: " + datosGanador.getItem("razonSocial") );
				System.out.println("#");
			
				MSSorteosDao sorteosDao;
				try {
					sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
					sorteosDao.setGanadorSorteo(datosGanador);
				}
				catch (SQLException e) {
					this.setEstadoSorteo(idSorteo, "ejecutar");
					System.out.println(e.getMessage());
				}
				
			}
			else {
				System.out.println("#");
				System.out.println("# -> No hay clientes aptos para el sorteo");
				System.out.println("# -> Grabando sorteo vacante");
				System.out.println("#");
				
				datosGanador.setItem("idSorteo", String.valueOf(idSorteo));
				datosGanador.setItem("idConcesionaria", "");
				datosGanador.setItem("idCliente", "");
				Dao sorteosDao;
				try {
					sorteosDao = DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
					sorteosDao.update(datosGanador);					
					
				}
				catch (SQLException e) {
					this.setEstadoSorteo(idSorteo, "ejecutar");
					System.out.println("#");
					System.out.println("# -> Error al grabar sorteo vacante" );
					System.out.println("#");
					System.out.println(e.getMessage());
				}								
			}
			return datosGanador;
		}
		catch(SQLException e) {
			this.setEstadoSorteo(idSorteo, "ejecutar");
			System.out.println("#");
			System.out.println("# -> Error al consultar clientes aptos: " + e.getMessage());
			System.out.println("#");
			
			AdminDatosClientes.getInstance().logError("Error al consultar clientes aptos: " + e.getMessage());
			return null;
		}	
	}
	
	public boolean sorteoExitoso(Integer idSorteo) {
		MSSorteosDao sorteosDao;
		try {
			sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			sorteosDao.setFinSorteo(idSorteo);
			return true;
		}
		catch (SQLException e) {
			this.setEstadoSorteo(idSorteo, "ejecutar");
			System.out.println(e.getMessage());
			return false;
		}
	}
	
	public boolean notificarGanador(String toEmailAddr, Integer idSorteo, String nombre, String apellido){
		System.out.println("#");
		System.out.println("# -> Enviando mail a " + toEmailAddr);
		System.out.println("#");
		String subject = "Ganador del sorteo mensual!!!";
		String body = "El ganador del sorteo mensual es: " + apellido + ", " + nombre + ". ¡¡¡Felicitaciones!!!";
		try {
			sendEmail(toEmailAddr, subject, body);
			System.out.println("# -> Email enviado correctamente ");
			System.out.println("#");
			return true;
		} 
		catch (MessagingException e) {
			this.setEstadoSorteo(idSorteo, "mail");
			System.out.println("# -> Error al enviar mail.");
			System.out.println("#");
			e.printStackTrace();			
			return false;
		}
	}
	
	public boolean notificarConcesionaria(Integer idSorteo, String nombre, String apellido, String idCliente, String razonSocialConcesionaria) {
		if(idSorteo==null || nombre==null || apellido==null || idCliente==null || razonSocialConcesionaria==null) {
			this.setEstadoSorteo(idSorteo, "notificar");
			
			System.out.println("#");
			System.out.println("# -> Uno de los parámetros es nulo por lo que se aborta la notificación <- ");
			System.out.println("# -> Parámetros:  " + idSorteo + " - " + nombre + " - " + apellido + " - " + idCliente + " - " + razonSocialConcesionaria);
			System.out.println("#");
			return false;
		}
		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		concesionarias = AdminDatosClientes.getInstance().obtenerConcesionarias();
		boolean notificados = true;
		System.out.println("# -> Notificando el ganador a las concesionarias: " );
		for(DynaActionForm concesionaria : concesionarias) {
			try {						
				ClienteServicio clienteServicio = ClienteServicio.class.cast(Class.forName(ClienteServicio.class.getPackage().getName() + ".Cliente" + concesionaria.getItem("sufijo")).newInstance() );								
				System.out.println("#\t -> " + concesionaria.getItem("razonSocial"));
				String json = clienteServicio.notificarGanador(concesionaria.getItem("urlServicio"), nombre, apellido, idCliente, String.valueOf(idSorteo), razonSocialConcesionaria);	
				System.out.println("#\t -> Estado - " + json );
				if(!json.equals("ok")) {
					notificados = false;
				}
			}
			catch(Exception e) {
				notificados = false;
				System.out.println("# ->Error al notificar concesionaria " + concesionaria.getItem("razonSocial"));
				System.out.println( e.getMessage() );
			}
			System.out.println("#");
		}
		if(notificados) {
			this.setEstadoSorteo(idSorteo, "notificado");
			return true;
		}
		else {
			this.setEstadoSorteo(idSorteo, "notificar");
			return false;
		}
	}
	
	public void sendEmail(String aToEmailAddr,String aSubject, String aBody) throws MessagingException{

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		
		Session session = Session.getInstance(props, new javax.mail.Authenticator() {
		    protected PasswordAuthentication getPasswordAuthentication() {
		        return new PasswordAuthentication("info.picokm@gmail.com", "Picokm123");
		    }
		});
		MimeMessage message = new MimeMessage(session);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(aToEmailAddr));
			message.setSubject(aSubject);
			message.setText(aBody);
			Transport.send(message);		
	}
	
	public void setEstadoSorteo(int idSorteo, String estado) {
		MSSorteosDao sorteosDao;
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(idSorteo));
		form.setItem("estado", estado);
		try {
			sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			sorteosDao.setEstadoSorteo(form);			
		}
		catch(SQLException e) {
			
			System.out.println("#");
			System.out.println("# -> Error al setear estado de sorteo: " + e.getMessage());
			System.out.println("#");
			AdminDatosClientes.getInstance().logError("Error al setear estado de sorteo: " + e.getMessage());
		}
	}
	
	public DynaActionForm getGanadorSorteo(int idSorteo) {
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(idSorteo));
		try {
			MSSorteosDao sorteosDao = (MSSorteosDao)DaoFactory.getDao( "Sorteos", "ar.edu.ubp.das.src.sorteo" );
			return sorteosDao.getGanadorSorteo(form);			
		}
		catch(SQLException e) {
			System.out.println("#");
			System.out.println("# -> Error al consultar sorteos: " + e.getMessage());
			System.out.println("#");
			AdminDatosClientes.getInstance().logError("Error al consultar sorteos: " + e.getMessage());
			return null;
		}
		
		
	}
	
}
