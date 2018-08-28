package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariasForm extends DynaActionForm {
	
	private String cuit;
	private String direccion; 
	private String estado_autorizacion;
	private String estado_actualizacion;
	private String telefono;
	private String id_concesionaria;
	private String razon_social;
	private String id_tecnologia;
	private String url;
	private String id_provincia;
	private String id_localidad;
	private String cantidad;
	private String fecha_actualizacion;
	private String cantidad_clientes;
	
	public String getFecha_actualizacion() {
		return fecha_actualizacion;
	}
	public void setFecha_actualizacion(String fecha_actualizacion) {
		this.fecha_actualizacion = fecha_actualizacion;
	}
	public String getCantidad() {
		return cantidad;
	}
	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	public String getCuit() {
		return cuit;
	}
	public void setCuit(String cuit) {
		this.cuit = cuit;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getEstado_autorizacion() {
		return estado_autorizacion;
	}
	public void setEstado_autorizacion(String estado_autorizacion) {
		this.estado_autorizacion = estado_autorizacion;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getId_concesionaria() {
		return id_concesionaria;
	}
	public void setId_concesionaria(String id_concesionaria) {
		this.id_concesionaria = id_concesionaria;
	}
	public String getRazon_social() {
		return razon_social;
	}
	public void setRazon_social(String razon_social) {
		this.razon_social = razon_social;
	}
	public String getId_tecnologia() {
		return id_tecnologia;
	}
	public void setId_tecnologia(String id_tecnologia) {
		this.id_tecnologia = id_tecnologia;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getId_provincia() {
		return id_provincia;
	}
	public void setId_provincia(String id_provincia) {
		this.id_provincia = id_provincia;
	}
	public String getId_localidad() {
		return id_localidad;
	}
	public void setId_localidad(String id_localidad) {
		this.id_localidad = id_localidad;
	}
	public String getCantidad_clientes() {
		return cantidad_clientes;
	}
	public void setCantidad_clientes(String cantidad_clientes) {
		this.cantidad_clientes = cantidad_clientes;
	}
	public String getEstado_actualizacion() {
		return estado_actualizacion;
	}
	public void setEstado_actualizacion(String estado_actualizacion) {
		this.estado_actualizacion = estado_actualizacion;
	}
	
	
	
}
