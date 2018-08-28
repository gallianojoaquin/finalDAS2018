package ar.edu.ubp.das.src.sorteo.main;

import java.util.Date;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class Main {

	public static void main(String []args) {
              
		System.out.println( "###############################################################################");
		System.out.println( "# -> Iniciando aplicación Sorteo - " + new Date().toString());
		System.out.println( "###############################################################################");
		System.out.println( "#");
		
		Sorteo sorteo = new Sorteo();
		
		System.out.println( "#");
		System.out.println( "# -> Consultando si hay algun sorteo pendiente o si es fecha de sorteo  ");
		System.out.println( "#");
		
		DynaActionForm form = sorteo.fechaDeSorteo();
		String strIdSorteo = form.getItem("idSorteo");
		int idSorteo = strIdSorteo != null ? Integer.valueOf(strIdSorteo) : -1; 
		String estado = form.getItem("estado");
		String fechaSorteo = form.getItem("fechaSorteo");
		
		if( idSorteo == -1 ) {
			
			System.out.println( "#");
			System.out.println( "# -> No es fecha de sorteo o no hay sorteo pendiente ");
			System.out.println( "#");
			finSorteo();
		}
		else {
			System.out.println( "#");
			System.out.println( "# -> Sorteo pendiente ");
			System.out.println( "#");
			
			if(estado.equals("pendiente")) {
				sorteo.setEstadoSorteo(idSorteo, "init");
				estado = "init";
			}
		}

		boolean actualizacionOk = true;
		if(estado.equals("init") || estado.equals("actualizar")) {
			System.out.println( "#");
			System.out.println( "# -> Consultando si los datos estan actualizados ");
			System.out.println( "#");
			/*try {
				System.out.println( "# -> Sleep de 30 seg ");
				Thread.sleep(30 * 1000);
			} 
			catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			actualizacionOk = AdminDatosClientes.getInstance().actualizarDatosClientes(idSorteo, fechaSorteo);
		}
		if(!actualizacionOk) {
			
			System.out.println( "#");
			System.out.println( "# -> ¡¡¡Se produjo un error al actualizar los datos de los clientes !!!  ");
			System.out.println( "# -> ¡¡¡No se llevara a cabo el sorteo!!! ");
			System.out.println( "#");

			sorteo.setEstadoSorteo(idSorteo, "actualizar");	
			sorteo.registrarErroneo(idSorteo);
			finSorteo();
		}
		else {
			if(estado.equals("init") || estado.equals("actualizar")) {
				sorteo.setEstadoSorteo(idSorteo, "actualizado");
				estado = "actualizado";
			}
		}

		DynaActionForm ganador = null;
		if( estado.equals("actualizado") || estado.equals("definir_participantes")  ) {	
			/*try {
				System.out.println( "# -> Sleep de 30 seg ");
				Thread.sleep(30 * 1000);
			} 
			catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			if(sorteo.generarTablaParticipantes(idSorteo)) {
				sorteo.setEstadoSorteo(idSorteo, "ejecutar");
				estado = "ejecutar";
			}
			else {
				sorteo.registrarErroneo(idSorteo);
			}
		}	
		
		if(estado.equals("ejecutar")) {
			/*try {
				System.out.println( "# -> Sleep de 30 seg ");
				Thread.sleep(30 * 1000);
			} 
			catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			ganador = sorteo.ejecutarSorteo(idSorteo, estado);	
			if(ganador.getItem("idCliente").equals("") && ganador.getItem("idConcesionaria").equals("") ) {
				sorteo.setEstadoSorteo(idSorteo, "finalizado");
				
				System.out.println( "#");
				System.out.println( "# -> Sorteo VACANTE - No hay clientes aptos ");
				System.out.println( "#");
				finSorteo();
			}
		}
		if( !estado.equals("definir_participantes") && ganador == null) {
			ganador = sorteo.getGanadorSorteo(idSorteo);
		}
		
		if(!estado.equals("notificado") && !estado.equals("falloEnvioMail")) {
			/*try {
				System.out.println( "# -> Sleep de 30 seg ");
				Thread.sleep(30 * 1000);
			} 
			catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			if(!sorteo.notificarConcesionaria(idSorteo, ganador.getItem("nombre"), ganador.getItem("apellido"), ganador.getItem("idCliente"), ganador.getItem("razonSocial"))) {
				
				System.out.println( "#");
				System.out.println( "# -> Error al notificar a las concesionarias ");
				System.out.println( "#");
				sorteo.registrarErroneo(idSorteo);
				finSorteo();
			}
		}
		
		if(!estado.equals("mailEnviado")) {
			/*try {
				System.out.println( "# -> Sleep 30 segundos ");
				Thread.sleep(30 * 1000);
			} 
			catch (InterruptedException e) {
				e.printStackTrace();
			}*/
			if(sorteo.notificarGanador(ganador.getItem("mail"), idSorteo, ganador.getItem("nombre"), ganador.getItem("apellido"))) {
				sorteo.setEstadoSorteo(idSorteo, "mailEnviado");
			}
			else {
				sorteo.setEstadoSorteo(idSorteo, "falloEnvioMail");				
				System.out.println( "#");
				System.out.println( "# -> Error al enviar el mail al cliente ");
				System.out.println( "#");
				sorteo.registrarErroneo(idSorteo);
				finSorteo();
			}
		}
		
		if(sorteo.sorteoExitoso(idSorteo)) {
			sorteo.setEstadoSorteo(idSorteo, "finalizado");
		}
		else {
			System.out.println( "#");
			System.out.println( "# -> Error al marcar el sorteo como finalizado ");
			System.out.println( "#");
		}
		
		finSorteo();
	}
	
	private static void finSorteo() {
		System.out.println( "#");
		System.out.println( "#");
		System.out.println( "###############################################################################");
		System.out.println( "#");
		System.out.println( "# -> Finalizando aplicación Sorteo - " + new Date().toString() + "");
		System.out.println( "#");
		System.out.println( "###############################################################################");
		System.exit(0);
	}
}
