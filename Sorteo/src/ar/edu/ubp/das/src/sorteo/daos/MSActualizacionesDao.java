package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSActualizacionesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();
		form.setItem("idConcesionaria", result.getString("id_concesionaria"));
		form.setItem("razonSocial", result.getString("razon_social"));
		form.setItem("cuit", result.getString("cuit"));
		form.setItem("provincia", result.getString("provincia"));
		form.setItem("localidad", result.getString("localidad"));
		form.setItem("direccion", result.getString("direccion"));
		form.setItem("telefono", result.getString("telefono"));
		form.setItem("estadoAutorizacion", result.getString("estado_autorizacion"));
		form.setItem("urlServicio", result.getString("url_servicio"));
		form.setItem("sufijo", result.getString("sufijo"));
		return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		this.connect();
		
		this.setProcedure("guardar_actualizacion(?,?,?,?)");
		this.setParameter(1, Integer.parseInt(form.getItem("id_actualizacion")));
		this.setParameter(2, Integer.parseInt(form.getItem("id_concesionaria")));
		if(form.getItem("id_sorteo") == "") {
			this.setNull(3, Types.INTEGER);
		}
		else {
			this.setParameter(3, Integer.parseInt(form.getItem("id_sorteo")));
		}
		this.setParameter(4, form.getItem("estado"));
		
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
		this.setProcedure("get_actualizaciones_fallidas(?)");
		this.setParameter(1, Integer.parseInt(form.getItem("idSorteo")));
		List<DynaActionForm> list = this.executeQuery();
		this.disconnect();
		return list;
	}
	
	public boolean selectActualizaciones(DynaActionForm form) throws SQLException {
		
		this.connect();
		this.setProcedure("get_actualizaciones(?)");
		this.setParameter(1, Integer.parseInt(form.getItem("idSorteo")));	
		ResultSet r = this.getStatement().executeQuery();
		int ret = 0;
		if( r.next() ) {
			
			ret = r.getInt("huboActualizaciones");
		}		
		this.disconnect();

		if(ret == 1) {
			return true;
		}
		return false;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		return false;
	}

	public int getMaxIdActualizacion() throws SQLException {
		
		this.connect();
		
		this.setProcedure("get_max_id_actualizacion");		
		
		ResultSet r = this.getStatement().executeQuery();
		
		int ret = 0;
		if( r.next() ) {
			
			ret = r.getInt("id_actualizacion");
		}
		
		this.disconnect();
		
		return ret;
	}
}
