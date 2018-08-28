package ar.edu.ubp.das.src.sorteo.consumo;

public interface ClienteServicio {

	public String consumir(String url, String funcion, String fechaSorteo);

	public String notificarGanador(String item, String nombre, String apellido, String idCliente, String idSorteo, String idConcesionaria);
	
}
