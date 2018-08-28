package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class GanadoresForm extends DynaActionForm {

	private String cliente;
	private String fechaEjecucion;
	private String concesionaria;
	
	public String getCliente() {
		return cliente;
	}
	public void setCliente(String cliente) {
		this.cliente = cliente;
	}
	public String getFechaEjecucion() {
		return fechaEjecucion;
	}
	public void setFechaEjecucion(String fechaEjecucion) {
		this.fechaEjecucion = fechaEjecucion;
	}
	public String getConcesionaria() {
		return concesionaria;
	}
	public void setConcesionaria(String concesionaria) {
		this.concesionaria = concesionaria;
	}
	
	
	
	
	
}
