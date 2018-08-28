package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.admin.forms.ClienteForm;
import ar.edu.ubp.das.src.admin.forms.DetallePlanForm;

public class MSClientesDao extends DaoImpl {

	@Override
	public DynaActionForm make(ResultSet result) throws SQLException {

    	ClienteForm cliente = new ClienteForm();
    	
    	cliente.setNombre(result.getString("nombre"));
    	cliente.setDni(result.getString("dni"));
    	cliente.setMail(result.getString("mail"));
    	cliente.setProvincia(result.getString("provincia"));
    	cliente.setDireccion(result.getString("direccion"));
    	cliente.setMarca(result.getString("marca"));
    	cliente.setModelo(result.getString("modelo"));
    	cliente.setVersion(result.getString("version"));
    	cliente.setDominio(result.getString("dominio"));
    	cliente.setAnio(result.getInt("anio"));
    	cliente.setConcesionaria(result.getString("concesionaria"));
    	cliente.setCantCuotasPagas(result.getInt("cuotas_pagas"));
    	cliente.setAlDia(result.getString("al_dia"));
    	cliente.setNumeroIdConcesionaria(result.getInt("id_concesionaria"));
    	cliente.setNumeroIdCliente(result.getInt("id_cliente"));

    	return cliente;
	}

	@Override
	public void insert(DynaActionForm form) throws SQLException {
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

	@Override
	public void update(DynaActionForm form) throws SQLException {
		
		String nom = form.getItem("nom");
		String ape = form.getItem("ape"); 
		String tdoc = form.getItem("tdoc");
		String doc = form.getItem("doc");
	    String sexo = form.getItem("sexo");
	    String cucu = form.getItem("cucu");
	    String ema = form.getItem("ema");
	    String tel = form.getItem("tel");
	    String tmov = form.getItem("tmov");
	    String pais = form.getItem("pais");
	    String prov = form.getItem("prov");
	    String cpos = form.getItem("cpos");
	    String bar = form.getItem("bar");
	    String calle = form.getItem("calle");
	    String ncall = form.getItem("ncall");
	    String ntorr = form.getItem("ntorr");
	    String npiso = form.getItem("npiso");
	    String dpto = form.getItem("dpto");
		
		this.connect();
		
		this.setProcedure("dbo.p_update_datos_comprador(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		this.setParameter(1, tdoc); 
		this.setParameter(2, doc);
		this.setParameter(3, nom); 
		this.setParameter(4, ape);
		this.setParameter(5, sexo);
		this.setParameter(6, calle);
		this.setParameter(7, ncall);
		this.setParameter(8, npiso);
		this.setParameter(9, dpto);
		this.setParameter(10, ntorr);
		this.setParameter(11, bar);
		this.setParameter(12, prov);
		this.setParameter(13, pais);
		this.setParameter(14, cpos);
		this.setParameter(15, cucu);
		this.setParameter(16, ema);
		this.setParameter(17, tel);
		this.setParameter(18, tmov);
		
        this.executeUpdate(); 
        this.disconnect();
	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DynaActionForm> select(DynaActionForm form) throws SQLException {
				
		String tipoDoc = form.getItem("tipoDoc");
		String documento = form.getItem("usuario");
		
		this.connect();
		
		if(tipoDoc != null && documento != null && tipoDoc != "" && documento != "")
		{
			this.setProcedure("dbo.p_get_datos_comprador(?,?)");		
			this.setParameter(1,tipoDoc);
			this.setParameter(2,documento);
		}
		else {
			this.setProcedure("dbo.p_get_all_clientes");
		}
		this.setProcedure("dbo.p_get_all_clientes", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);

    	List<DynaActionForm> clientes = this.executeQuery();
        
		this.disconnect();
		
		return clientes;
	}
	
	@Override
	public List<DynaActionForm> getDetallePlan(DynaActionForm form) throws SQLException {
		
		List<DynaActionForm>  detalles = new LinkedList<DynaActionForm>();
		DetallePlanForm detalle;
		
		this.connect();
		
		this.setProcedure("p_get_detalle_plan(?,?)");
		this.setParameter(1,"DNI");
		this.setParameter(2,"35894335");
		
		ResultSet result = this.getStatement().executeQuery();
		
		result.next();
		while(result.getRow() > 0) {
			
			detalle = new DetallePlanForm();
			detalle.setApellido(result.getString("apellido"));
			detalle.setCuotasPlan(result.getString("cuotas"));
			detalle.setDescripcionPlan(result.getString("descripcion"));
			detalle.setDocumento(result.getString("documento"));
			detalle.setFechaActualizacion(result.getString("fechaActualizacion"));
			detalle.setNombre(result.getString("nombre"));
			detalle.setRazonSocialConces(result.getString("razonSocial"));
			detalle.setTipoDocumento(result.getString("tipoDocumento"));
			result.next();
			
			detalles.add(detalle);			
		}
		
		this.disconnect();
		
		return detalles;
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<DynaActionForm> selectConcesionarias(String procedure, DynaActionForm form) throws SQLException {
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
