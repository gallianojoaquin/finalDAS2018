package ar.edu.ubp.das.src.sorteo.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ConcesionariaAutorizadaForm extends DynaActionForm {

	private Integer idConcesionaria;
	private String razonSocial;
	private String cuit;
	private String provincia;
	private String localidad;
	private String direccion;
	private String telefono;
	private String urlLogo;
	private String estadoAutorizacion;
	private Integer idServicio;
	private String url;
	private String funcion;
	private Integer puerto;
	private String tecnologia;
	private String claseJava;
	
	public ConcesionariaAutorizadaForm() {
		
	}

	public Integer getIdConcesionaria() {
		return idConcesionaria;
	}

	public void setIdConcesionaria(Integer idConcesionaria) {
		this.idConcesionaria = idConcesionaria;
	}

	public String getRazonSocial() {
		return razonSocial;
	}

	public void setRazonSocial(String razonSocial) {
		this.razonSocial = razonSocial;
	}

	public String getCuit() {
		return cuit;
	}

	public void setCuit(String cuit) {
		this.cuit = cuit;
	}

	public String getProvincia() {
		return provincia;
	}

	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}

	public String getLocalidad() {
		return localidad;
	}

	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}

	public String getDireccion() {
		return direccion;
	}

	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getUrlLogo() {
		return urlLogo;
	}

	public void setUrlLogo(String urlLogo) {
		this.urlLogo = urlLogo;
	}

	public String getEstadoAutorizacion() {
		return estadoAutorizacion;
	}

	public void setEstadoAutorizacion(String estadoAutorizacion) {
		this.estadoAutorizacion = estadoAutorizacion;
	}

	public Integer getIdServicio() {
		return idServicio;
	}

	public void setIdServicio(Integer idServicio) {
		this.idServicio = idServicio;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getFuncion() {
		return funcion;
	}

	public void setFuncion(String funcion) {
		this.funcion = funcion;
	}

	public Integer getPuerto() {
		return puerto;
	}

	public void setPuerto(Integer puerto) {
		this.puerto = puerto;
	}

	public String getTecnologia() {
		return tecnologia;
	}

	public void setTecnologia(String tecnologia) {
		this.tecnologia = tecnologia;
	}

	public String getClaseJava() {
		return claseJava;
	}

	public void setClaseJava(String claseJava) {
		this.claseJava = claseJava;
	}
}
