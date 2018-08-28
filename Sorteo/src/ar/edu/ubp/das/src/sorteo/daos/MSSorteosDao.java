package ar.edu.ubp.das.src.sorteo.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;

public class MSSorteosDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {
		// TODO Auto-generated method stub
		DynaActionForm form = new DynaActionForm();
		form.setItem("idSorteo", String.valueOf(result.getInt("id_sorteo")));
		form.setItem("fechaOriginal", result.getString("fecha_original"));
		form.setItem("fechaEjecucion", result.getString("fecha_ejecucion"));
		form.setItem("estado", result.getString("estado"));
		form.setItem("intentosFallidos", String.valueOf(result.getString("intentos_fallidos")));
		return form;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(DynaActionForm form) throws SQLException {		
		
	}
	
	public void setFinSorteo(Integer idSorteo) throws SQLException{
		this.connect();
		this.setProcedure("set_fin_sorteo(?)");
		this.setParameter(1, idSorteo);
		this.getStatement().execute();
		this.disconnect();
	}
	
	public void setGanadorSorteo(DynaActionForm form) throws SQLException {
		this.connect();
		this.setProcedure("set_ganador_sorteo(?,?,?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		if(form.getItem("idConcesionaria").equals("")) {
			this.setParameter(2, Types.NULL);
		}else {
			this.setParameter(2,Integer.parseInt(form.getItem("idConcesionaria")));
		}
		if(form.getItem("idCliente").equals("")) {
			this.setParameter(3, Types.NULL);
		}else {
			this.setParameter(3,Integer.parseInt(form.getItem("idCliente")));
		}
		this.getStatement().execute();
		this.disconnect();
	}
	
	public void setSorteoErroneo(DynaActionForm form) throws SQLException{
		// TODO Auto-generated method stub
		
		this.connect();
		this.setProcedure("set_sorteo_erroneo(?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		this.getStatement().execute();
		this.disconnect();
	}
	
	public void setEstadoSorteo(DynaActionForm form) throws SQLException{
		this.connect();
		this.setProcedure("actualizar_estado_sorteo(?,?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		this.setParameter(2,form.getItem("estado"));
		this.getStatement().execute();
		this.disconnect();
	}
	
	public DynaActionForm getGanadorSorteo(DynaActionForm form) throws SQLException{
		this.connect();
		this.setProcedure("get_ganador_sorteo(?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		
		ResultSet r = this.getStatement().executeQuery();
		
		DynaActionForm ganador = new DynaActionForm();		
		if( r.next() ) {
			
			ganador.setItem("idSorteo", r.getString("id_sorteo"));
			ganador.setItem("idCliente", r.getString("id_cliente"));
			ganador.setItem("idConcesionaria", r.getString("id_concesionaria"));
			ganador.setItem("razonSocial", r.getString("razon_social"));
			ganador.setItem("nombre", r.getString("nombre"));
			ganador.setItem("apellido", r.getString("apellido"));
			ganador.setItem("mail", r.getString("mail"));
		}
		
		this.disconnect();
		
		return ganador;
	}
	
	public void procesarClientesParaSorteo(DynaActionForm form) throws SQLException{
		this.connect();
		this.setProcedure("set_clientes_sorteo(?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		this.getStatement().execute();
		this.disconnect();
	}
	
	public void guardarConcesionariasParaSorteo(DynaActionForm form) throws SQLException{
		this.connect();
		this.setProcedure("set_concesionarias_sorteo(?,?)");
		this.setParameter(1,Integer.parseInt(form.getItem("idSorteo")));
		this.setParameter(2,Integer.parseInt(form.getItem("idConcesionaria")));
		this.getStatement().execute();
		this.disconnect();
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {		
	}

	@Override
	public List<DynaActionForm> select(DynaActionForm form) throws SQLException {
		this.connect();
		this.setProcedure("get_sorteos");
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
