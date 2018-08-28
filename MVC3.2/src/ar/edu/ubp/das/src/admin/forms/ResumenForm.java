package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ResumenForm extends DynaActionForm {
	
	private String cantidad_clientes;
	private String cant_sorteos_atrasados; 
	private String cant_sorteos_pendientes;
	private String prox_sorteo;
	private String nombre_ganador;
	private String razon_social_concesionaria;
	private String fecha_ganador;
	private String fecha_ult_sorteo;
	private String estado;

	public String getCantidad_clientes() {
		return cantidad_clientes;
	}
	public void setCantidad_clientes(String cantidad_clientes) {
		this.cantidad_clientes = cantidad_clientes;
	}
	public String getCant_sorteos_atrasados() {
		return cant_sorteos_atrasados;
	}
	public void setCant_sorteos_atrasados(String cant_sorteos_atrasados) {
		this.cant_sorteos_atrasados = cant_sorteos_atrasados;
	}
	public String getCant_sorteos_pendientes() {
		return cant_sorteos_pendientes;
	}
	public void setCant_sorteos_pendientes(String cant_sorteos_pendientes) {
		this.cant_sorteos_pendientes = cant_sorteos_pendientes;
	}
	public String getProx_sorteo() {
		return prox_sorteo;
	}
	public void setProx_sorteo(String prox_sorteo) {
		this.prox_sorteo = prox_sorteo;
	}
	public String getNombre_ganador() {
		return nombre_ganador;
	}
	public void setNombre_ganador(String nombre_ganador) {
		this.nombre_ganador = nombre_ganador;
	}
	public String getRazon_social_concesionaria() {
		return razon_social_concesionaria;
	}
	public void setRazon_social_concesionaria(String razon_social_concesionaria) {
		this.razon_social_concesionaria = razon_social_concesionaria;
	}
	public String getFecha_ganador() {
		return fecha_ganador;
	}
	public void setFecha_ganador(String fecha_ganador) {
		this.fecha_ganador = fecha_ganador;
	}
	public String getFecha_ult_sorteo() {
		return fecha_ult_sorteo;
	}
	public void setFecha_ult_sorteo(String fecha_ult_sorteo) {
		this.fecha_ult_sorteo = fecha_ult_sorteo;
	}
	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	
	
	
	
	
}
