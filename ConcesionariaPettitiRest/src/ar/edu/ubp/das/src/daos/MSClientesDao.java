package ar.edu.ubp.das.src.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSClientesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();
        
    	form.setItem("nombre", result.getString("nombre"));
    	form.setItem("apellido", result.getString("apellido"));
    	form.setItem("dni", String.valueOf(result.getInt("dni")));
    	form.setItem("mail", result.getString("mail"));
    	form.setItem("provincia", result.getString("provincia"));
    	form.setItem("localidad", result.getString("localidad"));
    	form.setItem("direccion", result.getString("direccion"));
    	form.setItem("marca", result.getString("marca"));
    	form.setItem("modelo", result.getString("modelo"));
    	form.setItem("version", result.getString("version"));
    	form.setItem("dominio", result.getString("dominio"));
    	form.setItem("numMotor", result.getString("num_motor"));
    	form.setItem("numChasis", result.getString("num_chasis"));
    	form.setItem("color", result.getString("color"));
    	form.setItem("anio", String.valueOf(result.getInt("año")));    	    	
        form.setItem("cantCuotasPagas", String.valueOf(result.getInt("cant_cuotas_pagas")));
        form.setItem("ultCuotaPaga", result.getString("ult_cuota_paga"));
        form.setItem("alDia", result.getString("al_dia"));
        form.setItem("idSuscripcion", result.getString("id_suscripcion"));
        
        return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		
		this.connect();
		this.setProcedure("set_ganador_sorteo(?,?,?,?,?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idGanador")));
		this.setParameter(2,Integer.parseInt(form.getItem("idSorteo")));
		this.setParameter(3,form.getItem("concesionaria"));
		this.setParameter(4,form.getItem("nombre"));
		this.setParameter(5,form.getItem("apellido"));
		this.getStatement().execute();
		this.disconnect();

	}

	@Override
	public void update(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DynaActionForm> select(DynaActionForm form) throws SQLException {
		this.connect();
		
		this.setProcedure("dbo.get_clientes(?,?)");

		this.setParameter(1, form.getItem("solicitante"));
		this.setParameter(2, form.getItem("fechaSorteo"));
		
        List<DynaActionForm> clientes = this.executeQuery();
        
		this.disconnect();
		
		return clientes;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
