package ar.edu.ubp.das.src.chexa.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ClienteForm extends DynaActionForm {

	private String identificadorGob;
	private String nombre;
	private String apellido;
	private Integer dni;
	private String mail;
	private String provincia;
	private String localidad;
	private String direccion;
	private String marca;
	private String modelo;
	private String version;
	private String dominio;
	private String numMotor;
	private String numChasis;
	private String color;
	private Integer anio;
	private Integer idCuota;
	private String fechaVencimiento;
	private String fechaPago;
	private String idSuscripcion;
	

	public ClienteForm() {
		
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

	public Integer getDni() {
		return dni;
	}

	public void setDni(Integer dni) {
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

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getDominio() {
		return dominio;
	}

	public void setDominio(String dominio) {
		this.dominio = dominio;
	}

	public String getNumMotor() {
		return numMotor;
	}

	public void setNumMotor(String numMotor) {
		this.numMotor = numMotor;
	}

	public String getNumChasis() {
		return numChasis;
	}

	public void setNumChasis(String numChasis) {
		this.numChasis = numChasis;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public Integer getAnio() {
		return anio;
	}

	public void setAnio(Integer anio) {
		this.anio = anio;
	}

	public Integer getIdCuota() {
		return idCuota;
	}

	public void setIdCuota(Integer idCuota) {
		this.idCuota = idCuota;
	}

	public String getFechaVencimiento() {
		return fechaVencimiento;
	}

	public void setFechaVencimiento(String fechaVencimiento) {
		this.fechaVencimiento = fechaVencimiento;
	}

	public String getFechaPago() {
		return fechaPago;
	}

	public void setFechaPago(String fechaPago) {
		this.fechaPago = fechaPago;
	}

	public String getIdSuscripcion() {
		return idSuscripcion;
	}

	public void setIdSuscripcion(String idSuscripcion) {
		this.idSuscripcion = idSuscripcion;
	}
}
