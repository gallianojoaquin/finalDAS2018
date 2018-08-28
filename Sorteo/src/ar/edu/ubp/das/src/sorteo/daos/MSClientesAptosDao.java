package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSClientesAptosDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		DynaActionForm form = new DynaActionForm();

		form.setItem("idConcesionaria", result.getString("id_concesionaria"));
		form.setItem("idCliente", result.getString("id_cliente"));
		form.setItem("nombre", result.getString("nombre"));
		form.setItem("apellido", result.getString("apellido"));
		form.setItem("mail", result.getString("mail"));
		form.setItem("razonSocial", result.getString("razon_social"));
		
		return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		this.connect();
		
		this.setProcedure("get_aptos(?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		
		this.executeQuery();
		
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
		
		this.setProcedure("get_aptos(?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		
		List<DynaActionForm> list = this.executeQuery();
		
		this.disconnect();
		
		return list;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
