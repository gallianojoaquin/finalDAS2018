package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSCuotasDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {

		this.connect();
		
		this.setProcedure("dbo.guardar_cuota(?,?,?,?,?,?)");

		this.setParameter(1,Integer.parseInt(form.getItem("idConcesionaria")));
		this.setParameter(2,Integer.parseInt(form.getItem("dni")));
		this.setParameter(3,Integer.parseInt(form.getItem("idSuscripcion")));
		this.setParameter(4,Integer.parseInt(form.getItem("idCuota")));
		this.setParameter(5,form.getItem("fechaVencimiento"));
		
		if(form.getItem("fechaPago").equals("null")) {
			this.setNull(6, Types.DATE);
		}
		else {
			this.setParameter(6,form.getItem("fechaPago"));
		}
		
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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
