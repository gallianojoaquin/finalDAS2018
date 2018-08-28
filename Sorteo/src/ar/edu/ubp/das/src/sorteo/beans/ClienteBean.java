package ar.edu.ubp.das.src.sorteo.beans;

import java.util.LinkedList;

public class ClienteBean {

	private String identificadorGob;
	private String nombre;
	private String apellido;
	private String dni;
	private String mail;
	private String provincia;
	private String localidad;
	private String direccion;
	
	private AutoBean auto;
	private LinkedList<CuotaBean> cuotas;
	
	public ClienteBean() {
		
	}

	public String getIdentificadorGob() {
		return identificadorGob;
	}

	public void setIdentificadorGob(String identificadorGob) {
		this.identificadorGob = identificadorGob;
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

	public AutoBean getAuto() {
		return auto;
	}

	public void setAuto(AutoBean auto) {
		this.auto = auto;
	}

	public LinkedList<CuotaBean> getCuotas() {
		return cuotas;
	}

	public void setCuotas(LinkedList<CuotaBean> cuotas) {
		this.cuotas = cuotas;
	}
}
