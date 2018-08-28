package ar.edu.ubp.das.src.admin.forms;

public class CuotaForm {
	 private String idCuota;
	    private String fechaVencimiento;
	    private String fechaPago;
	    
	    public CuotaForm() {
	    	
	    }

		public String getIdCuota() {
			return idCuota;
		}

		public void setIdCuota(String idCuota) {
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
}
