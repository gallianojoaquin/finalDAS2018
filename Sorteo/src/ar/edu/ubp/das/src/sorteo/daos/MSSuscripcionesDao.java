package ar.edu.ubp.das.src.sorteo.daos;

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
		
		this.setProcedure("guardar_suscripcion(?,?,?,?,?,?,?)");
		
		this.setParameter(1, form.getItem("idSuscripcion"));
		this.setParameter(2, form.getItem("identificadorGob"));
		this.setParameter(3, Integer.parseInt(form.getItem("idConcesionaria")));
		this.setParameter(4, Integer.parseInt(form.getItem("dni")));
		
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
	
	public String getIdSuscripcion() throws SQLException {
		this.connect();
		
		this.setProcedure("get_id_suscripcion");	
		
		ResultSet r = this.getStatement().executeQuery();
		
		String ret = "";
		if( r.next() ) {
			
			ret = r.getString("id_suscripcion");
		}
		
		this.disconnect();
		
		return ret;
	}

}
