package ar.edu.ubp.das.src.admin.forms;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public class ParticipanteSorteoForm extends DynaActionForm{

		private Integer idSorteo;
		private String fechaOriginal;
		private String nombre;
		private String concesionaria;
		
		public ParticipanteSorteoForm() {
			
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

		

		public String getConcesionaria() {
			return concesionaria;
		}

		public void setConcesionaria(String concesionaria) {
			this.concesionaria = concesionaria;
		}

		
		public String getNombre() {
			return nombre;
		}

		public void setNombre(String nombre) {
			this.nombre = nombre;
		}
}
