package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSGetConcesionariaDao extends DaoImpl {

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
		// TODO Auto-generated method stub

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
		
		this.setProcedure("dbo.get_concesionarias_autorizadas", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

		List<DynaActionForm> concesionarias = this.executeQuery();
        
		this.disconnect();
		
		return concesionarias;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
