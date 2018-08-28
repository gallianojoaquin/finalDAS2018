package ar.edu.ubp.das.src.admin.forms;

import java.util.LinkedList;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ClienteForm extends DynaActionForm{
	
	private String idCliente;
	private String nombre;
	private String apellido;
	private String dni;
	private String mail;
	private String provincia;
	private String localidad;
	private String direccion;
	private String marca;
	private String modelo;
	private String version;
	private String dominio;
	private Integer anio;
	private String concesionaria;
	private String aptoSorteo;
	private Integer cantCuotasPagas;
	private String alDia;
	private Integer numeroIdConcesionaria;
	private Integer numeroIdCliente;
	private String identificadorGob;
	
	private VehiculoForm auto;
	private LinkedList<CuotaForm> cuotas;
	public String getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(String idCliente) {
		this.idCliente = idCliente;
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
	public Integer getAnio() {
		return anio;
	}
	public void setAnio(Integer anio) {
		this.anio = anio;
	}
	public String getConcesionaria() {
		return concesionaria;
	}
	public void setConcesionaria(String concesionaria) {
		this.concesionaria = concesionaria;
	}
	public String getAptoSorteo() {
		return aptoSorteo;
	}
	public void setAptoSorteo(String aptoSorteo) {
		this.aptoSorteo = aptoSorteo;
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
	public Integer getNumeroIdConcesionaria() {
		return numeroIdConcesionaria;
	}
	public void setNumeroIdConcesionaria(Integer numeroIdConcesionaria) {
		this.numeroIdConcesionaria = numeroIdConcesionaria;
	}
	public Integer getNumeroIdCliente() {
		return numeroIdCliente;
	}
	public void setNumeroIdCliente(Integer numeroIdCliente) {
		this.numeroIdCliente = numeroIdCliente;
	}
	public String getIdentificadorGob() {
		return identificadorGob;
	}
	public void setIdentificadorGob(String identificadorGob) {
		this.identificadorGob = identificadorGob;
	}
	public VehiculoForm getAuto() {
		return auto;
	}
	public void setAuto(VehiculoForm auto) {
		this.auto = auto;
	}
	public LinkedList<CuotaForm> getCuotas() {
		return cuotas;
	}
	public void setCuotas(LinkedList<CuotaForm> cuotas) {
		this.cuotas = cuotas;
	}	
	
	
}
