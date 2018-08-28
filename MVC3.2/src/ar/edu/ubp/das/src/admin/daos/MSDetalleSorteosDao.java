package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.admin.forms.SorteoForm;

public class MSDetalleSorteosDao extends DaoImpl{
	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		SorteoForm sorteo = new SorteoForm();

    	sorteo.setIdSorteo(result.getInt("id_sorteo"));
    	sorteo.setFechaOriginal(result.getString("fecha_original"));
    	sorteo.setFechaEjecucion(result.getString("fecha_ejecucion"));
    	sorteo.setFechaFinEjecucion(result.getString("fecha_fin_ejecucion"));
    	sorteo.setEstado(result.getString("estado"));
    	sorteo.setIntentosFallidos(result.getInt("intentos_fallidos"));
    	sorteo.setConcesionaria(result.getString("concesionaria"));
    	sorteo.setGanador(result.getString("ganador"));
    	sorteo.setMail(result.getString("mail"));

    	return sorteo;
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
		
		this.setProcedure("dbo.get_detalle_sorteos", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
    	List<DynaActionForm> sorteos = this.executeQuery();
        
		this.disconnect();
		
		return sorteos;
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
