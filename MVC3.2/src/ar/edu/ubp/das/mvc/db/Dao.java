package ar.edu.ubp.das.mvc.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;

public interface Dao {

    public DynaActionForm make(ResultSet result) throws SQLException;
    public void insert(DynaActionForm form) throws SQLException;
    public void update(DynaActionForm form) throws SQLException;
    public void delete(DynaActionForm form) throws SQLException;
    public List<DynaActionForm> select(DynaActionForm form) throws SQLException;
    public List<DynaActionForm> selectConcesionarias(String procedure, DynaActionForm form) throws SQLException;
	List<DynaActionForm> getDetallePlan(DynaActionForm form) throws SQLException;
    public boolean valid(DynaActionForm form) throws SQLException;
	public Object getNoticiaPal(DynaActionForm form) throws SQLException;
	public void updateNoticiaPal(DynaActionForm form) throws SQLException;
	public Object getTitulo(DynaActionForm form) throws SQLException;
	public void updateTitulo(DynaActionForm form) throws SQLException;
	public Object getProxSorteo(DynaActionForm form) throws SQLException;
	public void updateProxSorteo(DynaActionForm form) throws SQLException;
	public Object getAvisos(DynaActionForm form) throws SQLException;
	public void updateAvisos(DynaActionForm form) throws SQLException;
	public Object getInformacion(DynaActionForm form) throws SQLException;
	public void updateInfo(DynaActionForm form) throws SQLException;
	public Object getNovedad(DynaActionForm form) throws SQLException;
	public void updateNovedad(DynaActionForm form) throws SQLException;
	public ResultSet RSView(String sQuery) throws SQLException;
	

}
