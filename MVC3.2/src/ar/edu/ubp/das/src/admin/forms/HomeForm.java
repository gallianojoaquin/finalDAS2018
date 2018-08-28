package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class HomeForm extends DynaActionForm {
	
	private String sorteo;
	private String nota;
	private String novedad;
	private String informacion;
	private String aviso;
	private String noticiaPrincipal;
	private String titulo;
	private GanadoresForm ganadores;
	
	public GanadoresForm getGanadores() {
		return ganadores;
	}
	public void setGanadores(GanadoresForm ganadores) {
		this.ganadores = ganadores;
	}
	public String getSorteo() {
		return sorteo;
	}
	public void setSorteo(String sorteo) {
		this.sorteo = sorteo;
	}
	public String getNota() {
		return nota;
	}
	public void setNota(String nota) {
		this.nota = nota;
	}
	public String getNovedad() {
		return novedad;
	}
	public void setNovedad(String novedad) {
		this.novedad = novedad;
	}
	public String getInformacion() {
		return informacion;
	}
	public void setInformacion(String informacion) {
		this.informacion = informacion;
	}
	public String getAviso() {
		return aviso;
	}
	public void setAviso(String aviso) {
		this.aviso = aviso;
	}
	public String getNoticiaPrincipal() {
		return noticiaPrincipal;
	}
	public void setNoticiaPrincipal(String noticiaPrincipal) {
		this.noticiaPrincipal = noticiaPrincipal;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	

}
