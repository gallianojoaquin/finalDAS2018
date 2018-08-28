package ar.edu.ubp.das.src.sorteo.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class AdhesionForm extends DynaActionForm {

	private String identificadorGob;
	private Integer idConcesionaria;
	private Integer idCliente;
	private Integer idAdhesion;
	private Integer idAuto;
	private Integer cantCuotasPagas;
	private String alDia;
	
	public AdhesionForm() {
		
	}

	public String getIdentificadorGob() {
		return identificadorGob;
	}

	public void setIdentificadorGob(String identificadorGob) {
		this.identificadorGob = identificadorGob;
	}

	public Integer getIdConcesionaria() {
		return idConcesionaria;
	}

	public void setIdConcesionaria(Integer idConcesionaria) {
		this.idConcesionaria = idConcesionaria;
	}

	public Integer getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Integer idCliente) {
		this.idCliente = idCliente;
	}

	public Integer getIdAdhesion() {
		return idAdhesion;
	}

	public void setIdAdhesion(Integer idAdhesion) {
		this.idAdhesion = idAdhesion;
	}

	public Integer getIdAuto() {
		return idAuto;
	}

	public void setIdAuto(Integer idAuto) {
		this.idAuto = idAuto;
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
}
