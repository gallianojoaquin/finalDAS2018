package ar.edu.ubp.das.src.sorteo.main;

import java.util.Date;

/**
*
* @author JOAQUÍN GALLIANO
*
*/
public class ActualizarDatosClientes {
	
	public static void main(String []args) {

		System.out.println( ">> Iniciando actualización de clientes - " + new Date().toString() );
		
		AdminDatosClientes datosClientes = AdminDatosClientes.getInstance();
		String fechaHoy = "2018-08-10";
		if(datosClientes.actualizarDatosClientes(null, fechaHoy)) {
			System.out.println( "\n>> Actualizacion finalizada con éxito." );
			System.exit(0);
		}
		
		System.out.println( "\n>> Actualización finalizada con error." );
		
	}
}
