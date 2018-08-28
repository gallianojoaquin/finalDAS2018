package ar.edu.ubp.das.src.sorteo.main;

import java.util.Date;

public class ActualizarDatosClientes {
	
	public static void main(String []args) {

		System.out.println( ">> Iniciando actualizaci�n de clientes - " + new Date().toString() );
		
		AdminDatosClientes datosClientes = AdminDatosClientes.getInstance();
		String fechaHoy = "2018-08-10";
		if(datosClientes.actualizarDatosClientes(null, fechaHoy)) {
			System.out.println( "\n>> Actualizacion finalizada con �xito." );
			System.exit(0);
		}
		
		System.out.println( "\n>> Actualizaci�n finalizada con error." );
		
	}
}
