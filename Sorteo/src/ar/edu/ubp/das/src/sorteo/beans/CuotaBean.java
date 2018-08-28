package ar.edu.ubp.das.src.sorteo.beans;

public class CuotaBean {

    private String idCuota;
    private String fechaVencimiento;
    private String fechaPago;
    
    public CuotaBean() {
    	
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

