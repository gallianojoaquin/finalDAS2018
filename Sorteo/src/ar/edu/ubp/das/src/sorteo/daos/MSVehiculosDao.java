package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSVehiculosDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
this.connect();
		
		this.setProcedure("guardar_auto(?,?,?,?,?)");

		this.setParameter(1,form.getItem("marca"));
		this.setParameter(2,form.getItem("modelo"));
		this.setParameter(3,form.getItem("version"));
		this.setParameter(4,form.getItem("dominio"));
		this.setParameter(5,form.getItem("anio"));
		
		this.getStatement().execute();
		
		this.disconnect();

	}
	
	public int getIdAuto(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

		this.connect();
		
		this.setProcedure("get_id_auto(?,?,?,?,?)");

		this.setParameter(1,form.getItem("marca"));
		this.setParameter(2,form.getItem("modelo"));
		this.setParameter(3,form.getItem("version"));
		this.setParameter(4,form.getItem("dominio"));
		this.setParameter(5,Integer.parseInt(form.getItem("anio")));
		
		int ret = -1;
		 
		ResultSet r = this.getStatement().executeQuery();
		
		if(r.next()){
			
			ret = r.getInt("id_auto");
		}
		
		this.disconnect();
		
		return  ret;
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
