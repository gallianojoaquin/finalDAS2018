package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSGetConcesionariaDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();

    	form.setItem("id_concesionaria", String.valueOf(result.getInt("id_concesionaria")));
    	form.setItem("razon_social", result.getString("razon_social"));
    	form.setItem("cuit", result.getString("cuit"));
    	form.setItem("provincia", result.getString("provincia"));
    	form.setItem("localidad", result.getString("localidad"));
    	form.setItem("direccion", result.getString("direccion"));
    	form.setItem("telefono", result.getString("telefono"));
    	form.setItem("urlLogo", result.getString("url_logo"));
    	form.setItem("estado_autorizacion", result.getString("estado_autorizacion"));
    	form.setItem("id_servicio", String.valueOf(result.getInt("id_servicio")));
    	form.setItem("url", result.getString("url_servicio"));
    	form.setItem("funcion", result.getString("funcion"));
    	form.setItem("puerto", String.valueOf(result.getInt("puerto_servicio")));
    	form.setItem("tecnologia", result.getString("tecnologia"));
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
	public List<DynaActionForm> selectConcesionarias(String procedure, DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DynaActionForm> getDetallePlan(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object getNoticiaPal(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNoticiaPal(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getTitulo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateTitulo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getProxSorteo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateProxSorteo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getAvisos(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateAvisos(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getInformacion(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateInfo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public Object getNovedad(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateNovedad(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

}
