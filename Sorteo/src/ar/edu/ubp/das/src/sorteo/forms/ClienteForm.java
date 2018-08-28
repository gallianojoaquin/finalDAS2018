package ar.edu.ubp.das.src.sorteo.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ClienteForm extends DynaActionForm{

	private String idSuscripcion;
	private String nombre;
	private String apellido;
	private String dni;
	private String mail;
	private String telefono;
	private String fechaSuscripcion;
	private String direccion;
	private String localidad;
	private String provincia;	
	
	private Integer idConcesionaria;
	private String ultCuotaPaga;
	private Integer cantCuotasPagas;
	private String alDia;
	
	private VehiculoForm auto;
	
	
	public String getIdSuscripcion() {
		return idSuscripcion;
	}
	public void setIdSuscripcion(String idSuscripcion) {
		this.idSuscripcion = idSuscripcion;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellido() {
		return apellido;
	}
	public void setApellido(String apellido) {
		this.apellido = apellido;
	}
	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTelefono() {
		return telefono;
	}
	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}
	public String getFechaSuscripcion() {
		return fechaSuscripcion;
	}
	public void setFechaSuscripcion(String fechaSuscripcion) {
		this.fechaSuscripcion = fechaSuscripcion;
	}
	public String getDireccion() {
		return direccion;
	}
	public void setDireccion(String direccion) {
		this.direccion = direccion;
	}
	public String getLocalidad() {
		return localidad;
	}
	public void setLocalidad(String localidad) {
		this.localidad = localidad;
	}
	public String getProvincia() {
		return provincia;
	}
	public void setProvincia(String provincia) {
		this.provincia = provincia;
	}
	
	public Integer getIdConcesionaria() {
		return idConcesionaria;
	}
	public void setIdConcesionaria(Integer idConcesionaria) {
		this.idConcesionaria = idConcesionaria;
	}
	public String getUltCuotaPaga() {
		return ultCuotaPaga;
	}
	public void setUltCuotaPaga(String ultCuotaPaga) {
		this.ultCuotaPaga = ultCuotaPaga;
	}
	public Integer getCantCuotasPagas() {
		return cantCuotasPagas;
	}
	public void setCantCuotasPagas(Integer cantCuotasPagas) {
		this.cantCuotasPagas = cantCuotasPagas;
	}
	public String getAlDia() {
		return alDia;
	}
	public void setAlDia(String alDia) {
		this.alDia = alDia;
	}
	public VehiculoForm getAuto() {
		return auto;
	}
	public void setAuto(VehiculoForm auto) {
		this.auto = auto;
	}
	
	
}
