package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class SorteoForm extends DynaActionForm{

		private Integer idSorteo;
		private String fechaOriginal;
		private String fechaEjecucion;
		private String fechaFinEjecucion;
		private String estado;
		private Integer intentosFallidos;
		private String concesionaria;
		private String ganador;
		private Integer dni;
		private String mail;
		private String provincia;
		
		public SorteoForm() {
			
		}

		public Integer getIdSorteo() {
			return idSorteo;
		}

		public void setIdSorteo(Integer idSorteo) {
			this.idSorteo = idSorteo;
		}

		public String getFechaOriginal() {
			return fechaOriginal;
		}

		public void setFechaOriginal(String fechaOriginal) {
			this.fechaOriginal = fechaOriginal;
		}

		public String getFechaEjecucion() {
			return fechaEjecucion;
		}

		public void setFechaEjecucion(String fechaEjecucion) {
			this.fechaEjecucion = fechaEjecucion;
		}

		public String getEstado() {
			return estado;
		}

		public void setEstado(String estado) {
			this.estado = estado;
		}

		public Integer getIntentosFallidos() {
			return intentosFallidos;
		}

		public void setIntentosFallidos(Integer intentosFallidos) {
			this.intentosFallidos = intentosFallidos;
		}

		public String getConcesionaria() {
			return concesionaria;
		}

		public void setConcesionaria(String concesionaria) {
			this.concesionaria = concesionaria;
		}

		public String getGanador() {
			return ganador;
		}

		public void setGanador(String ganador) {
			this.ganador = ganador;
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

		public String getFechaFinEjecucion() {
			return fechaFinEjecucion;
		}

		public void setFechaFinEjecucion(String fechaFinEjecucion) {
			this.fechaFinEjecucion = fechaFinEjecucion;
		}
}
