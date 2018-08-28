package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSClientesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
		this.connect();
		
		this.setProcedure("guardar_cliente(?,?,?,?,?,?,?,?,?)");

		this.setParameter(1,Integer.parseInt(form.getItem("idConcesionaria")));
		this.setParameter(2,Integer.parseInt(form.getItem("idCliente")));
		this.setParameter(3,form.getItem("nombre"));
		this.setParameter(4,form.getItem("apellido"));
		this.setParameter(5,Integer.parseInt(form.getItem("dni")));
		this.setParameter(6,form.getItem("mail"));
		this.setParameter(7,form.getItem("provincia"));
		this.setParameter(8,form.getItem("localidad"));
		this.setParameter(9,form.getItem("direccion"));
		
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
		return null;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}
	
	public int getMaxIdCliente(int idConcesionaria) throws SQLException {
		
		this.connect();
		
		this.setProcedure("get_max_id_cliente(?)");
		
		this.setParameter(1, idConcesionaria);
		
		ResultSet r = this.getStatement().executeQuery();
		
		int ret = 0;
		if( r.next() ) {
			
			ret = r.getInt("max_id");
		}
		
		this.disconnect();
		
		return ret;
	}
}
