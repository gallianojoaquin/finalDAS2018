
package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.admin.forms.GanadoresForm;
import ar.edu.ubp.das.src.admin.forms.HomeForm;

public class MSHomeDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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

		List<DynaActionForm>  homes = new LinkedList<DynaActionForm>();
		
		HomeForm home;
		
		this.connect();
		
		this.setProcedure("dbo.P_GET_BLOG");
		
		ResultSet result = this.getStatement().executeQuery();
		
		result.next();
		while(result.getRow() > 0) {
			
			home = new HomeForm();
			home.setAviso(result.getString("aviso"));
			home.setInformacion(result.getString("informacion"));
			home.setNota(result.getString("nota"));
			home.setNoticiaPrincipal(result.getString("noticiaPpal"));
			home.setNovedad(result.getString("novedad"));
			home.setSorteo(result.getString("sorteo"));
			home.setTitulo(result.getString("titulo"));
			result.next();
			homes.add(home);
			
		}
		
		this.disconnect();
		
		return homes;
	}

	@Override
	public List<DynaActionForm> selectConcesionarias(String procedure, DynaActionForm form) throws SQLException {
		
		List<DynaActionForm>  ganadores = new LinkedList<DynaActionForm>();
		
		GanadoresForm ganador;
		
		this.connect();
				
		this.setProcedure("dbo.P_GET_GANADORES");
		
		ResultSet result = this.getStatement().executeQuery();
		
		result.next();
		while(result.getRow() > 0) {
			ganador = new GanadoresForm();
			ganador.setCliente(result.getString("cliente"));
			ganador.setFechaEjecucion(result.getString("fecha_ejecucion"));
			ganador.setConcesionaria(result.getString("razon_social"));
			
			result.next();
			ganadores.add(ganador);
		}
		
		this.disconnect();
		
		return ganadores;
		
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
	public List<DynaActionForm> getNoticiaPal(DynaActionForm form) throws SQLException {
		
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
