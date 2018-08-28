package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSSuscripcionesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub

    	DynaActionForm form = new DynaActionForm();
    	
    	form.setItem("identificadorGob", result.getString("identificador_gob"));
    	form.setItem("idConcesionaria", result.getString("id_concesionaria"));
    	form.setItem("idCliente", result.getString("id_cliente"));
    	form.setItem("idAdhesion", result.getString("id_adhesion"));
    	form.setItem("idAuto", result.getString("id_auto"));
    	form.setItem("cantCuotasPagas", result.getString("cant_cuotas_pagas"));
    	form.setItem("alDia", result.getString("al_dia"));
    	
    	return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		this.connect();
		
		this.setProcedure("guardar_adhesion(?,?,?,?,?,?,?)");
		
		this.setParameter(1, form.getItem("identificadorGob"));
		this.setParameter(2, Integer.parseInt(form.getItem("idConcesionaria")));
		this.setParameter(3, Integer.parseInt(form.getItem("idCliente")));
		this.setParameter(4, Integer.parseInt(form.getItem("idAdhesion")));
		
		if(form.getItem("idAuto").equals("-1")){
			this.setNull(5, Types.INTEGER);
		}
		else{
			this.setParameter(5, Integer.parseInt(form.getItem("idAuto")));
		}
		this.setParameter(6, Integer.parseInt(form.getItem("cantCuotasPagas")));
		this.setParameter(7, form.getItem("alDia"));
		
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
		
		this.connect();
		
		this.setProcedure("get_adhesiones(?)");

		this.setParameter(1, form.getItem("idConcesionaria"));
		
		List<DynaActionForm> adhesiones = this.executeQuery();
        
		this.disconnect();
		
		return adhesiones;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
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
