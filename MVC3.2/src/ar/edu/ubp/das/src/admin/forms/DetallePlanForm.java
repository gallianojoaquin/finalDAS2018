package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class DetallePlanForm extends DynaActionForm {
	

	private String nombre;
	private String apellido;
	private String tipoDocumento;
	private String documento;
	private String descripcionPlan;
	private String cuotasPlan;
	private String razonSocialConces;
	private String fechaActualizacion;
	
	
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
	public String getTipoDocumento() {
		return tipoDocumento;
	}
	public void setTipoDocumento(String tipoDocumento) {
		this.tipoDocumento = tipoDocumento;
	}
	public String getDocumento() {
		return documento;
	}
	public void setDocumento(String documento) {
		this.documento = documento;
	}
	public String getDescripcionPlan() {
		return descripcionPlan;
	}
	public void setDescripcionPlan(String descripcionPlan) {
		this.descripcionPlan = descripcionPlan;
	}
	public String getCuotasPlan() {
		return cuotasPlan;
	}
	public void setCuotasPlan(String cuotasPlan) {
		this.cuotasPlan = cuotasPlan;
	}
	public String getRazonSocialConces() {
		return razonSocialConces;
	}
	public void setRazonSocialConces(String razonSocialConces) {
		this.razonSocialConces = razonSocialConces;
	}
	public String getFechaActualizacion() {
		return fechaActualizacion;
	}
	public void setFechaActualizacion(String fechaActualizacion) {
		this.fechaActualizacion = fechaActualizacion;
	}
	
	
}
