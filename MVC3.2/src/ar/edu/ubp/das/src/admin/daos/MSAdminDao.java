package ar.edu.ubp.das.src.admin.daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.db.DaoImpl;
import ar.edu.ubp.das.src.admin.forms.ConcesionariasForm;
import ar.edu.ubp.das.src.admin.forms.ResumenForm;

public class MSAdminDao extends DaoImpl {
	
	@Override
	public ResultSet RSView(String sQuery) throws SQLException 
	{
		ResultSet rs;
		
		this.connect();
		
	    rs = this.executeQueryPrepared_ResulSet(sQuery);
	    
     	return rs;
	}

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
		
		Integer id = Integer.parseInt(form.getItem("id"));
		String habilitada = form.getItem("habilitada");
		String url = form.getItem("url") == null ? "" : form.getItem("url");
		String sufijo = form.getItem("sufijo") == null ? "" : form.getItem("sufijo");

		this.connect();
        
		this.setProcedure("dbo.P_SET_CONCESIONARIA_HABILITADA (?,?,?,?)");    			

		this.setParameter(1, id);
		this.setParameter(2, habilitada);
		this.setParameter(3, url);
		this.setParameter(4, sufijo);

                        
        this.getStatement().executeUpdate();

	}

	@Override
	public void delete(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<DynaActionForm> select(DynaActionForm form) throws SQLException {	
		
		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		ConcesionariasForm concesionaria;
		
		this.connect();
        
		this.setProcedure("dbo.P_GET_CONCESIONARIAS");                            
        ResultSet result = this.getStatement().executeQuery();
        
        result.next();
        while(result.getRow() > 0) {
        	concesionaria = new ConcesionariasForm();
        	concesionaria.setId_concesionaria(result.getString("id_concesionaria"));
        	concesionaria.setRazon_social(result.getString("razon_social"));
        	concesionaria.setDireccion(result.getString("direccion"));
        	concesionaria.setUrl(result.getString("url"));
        	concesionaria.setId_tecnologia(result.getString("id_tecnologia"));
        	concesionaria.setEstado_autorizacion(result.getString("estado_autorizacion"));
        	
        	result.next();
        	
        	concesionarias.add(concesionaria);
                        
        }
        
        this.disconnect();
        
        return concesionarias;
         
	}	
	
	public List<DynaActionForm> selectCantidadesResumen() throws SQLException{
		List<DynaActionForm> listaResumen = new LinkedList<DynaActionForm>();
		ResumenForm resumen;
		
		this.connect();
        
		this.setProcedure("dbo.p_get_datos_cuantitativos");                            
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        while(result.getRow() > 0) {
        	resumen = new ResumenForm();
        	resumen.setCant_sorteos_atrasados(result.getString("cant_sorteos_atrasados"));
        	resumen.setCant_sorteos_pendientes(result.getString("cant_sorteos_pendientes"));
        	resumen.setCantidad_clientes(result.getString("cantidad_clientes"));
        	resumen.setProx_sorteo(result.getString("prox_sorteo"));
        	resumen.setRazon_social_concesionaria(result.getString("razon_social"));
        	resumen.setNombre_ganador(result.getString("nombre"));
        	resumen.setFecha_ult_sorteo(result.getString("fecha_ejecucion"));
        	resumen.setEstado(result.getString("estado"));
        	
        	result.next();
        	
        	listaResumen.add(resumen);
                        
        }
        
        this.disconnect();
        
        return listaResumen;
	}
	
	public List<DynaActionForm> selectUltActualizaciones() throws SQLException{
		
		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		ConcesionariasForm concesionaria;
		
		this.connect();
        
		this.setProcedure("dbo.p_get_ultimas_actualizaciones_concesionarias");                            
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        while(result.getRow() > 0) {
        	concesionaria = new ConcesionariasForm();
        	concesionaria.setRazon_social(result.getString("razon_social"));
        	concesionaria.setCuit(result.getString("cuit"));
        	concesionaria.setTelefono(result.getString("telefono"));
        	concesionaria.setFecha_actualizacion(result.getString("fecha_actualizacion"));
        	concesionaria.setCantidad(result.getString("cant_intentos"));
        	concesionaria.setEstado_autorizacion(result.getString("estado_autorizacion"));
        	concesionaria.setEstado_actualizacion(result.getString("estado_actualizacion"));       
        	concesionaria.setCantidad_clientes(result.getString("cant_clientes"));
        	concesionaria.setDireccion(result.getString("direccion"));
        	
        	result.next();
        	
        	concesionarias.add(concesionaria);
                        
        }
        
        this.disconnect();
        
        return concesionarias;
	}
	
	public List<DynaActionForm> selectCantConcesionarias() throws SQLException{

		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		ConcesionariasForm concesionaria;
		this.connect();
        
		this.setProcedure("dbo.p_get_cant_concesionarias_por_estado");                            
        ResultSet result = this.getStatement().executeQuery();

        result.next();
        while(result.getRow() > 0) {
        	concesionaria = new ConcesionariasForm();
        	concesionaria.setEstado_autorizacion(result.getString("estado_autorizacion"));
        	concesionaria.setCantidad(result.getString("cantidad"));
        	
        	result.next();
        	
        	concesionarias.add(concesionaria);
                        
        }
        
        this.disconnect();
        
        return concesionarias;
	}	
	
	public List<DynaActionForm> selectConcesionarias(String procedure, DynaActionForm form) throws SQLException {
		
		List<DynaActionForm> concesionarias = new LinkedList<DynaActionForm>();
		ConcesionariasForm concesionaria;
		
		this.connect();
        
		this.setProcedure(procedure);    			

                        
        ResultSet result = this.getStatement().executeQuery();
        
        result.next();
        while(result.getRow() > 0) {
        	concesionaria = new ConcesionariasForm();
        	concesionaria.setId_concesionaria(result.getString("id_concesionaria"));
        	concesionaria.setRazon_social(result.getString("razon_social"));
        	concesionaria.setDireccion(result.getString("direccion"));
        	concesionaria.setUrl(result.getString("url"));
        	concesionaria.setId_tecnologia(result.getString("id_tecnologia"));
        	result.next();
        	
        	concesionarias.add(concesionaria);
                        
        }
        
        this.disconnect();
        
        return concesionarias;
         
	}	

	public MSAdminDao() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public boolean valid(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<DynaActionForm> getDetallePlan(DynaActionForm form) throws SQLException {
		List<DynaActionForm> listaResumen = new LinkedList<DynaActionForm>();
		ResumenForm resumen;
		this.connect();
		
		this.setProcedure("dbo.P_get_ganadores", ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
		
		ResultSet result = this.getStatement().executeQuery();
        
        result.next();
        while(result.getRow() > 0) {
        	resumen = new ResumenForm();
        	resumen.setNombre_ganador(result.getString("cliente"));
        	resumen.setFecha_ganador(result.getString("fecha_ejecucion"));
        	resumen.setRazon_social_concesionaria(result.getString("razon_social"));
        	result.next();
        	
        	listaResumen.add(resumen);
                        
        }
        
		this.disconnect();
		
		return listaResumen;
	}

	@Override
	public Object getNoticiaPal(DynaActionForm form) throws SQLException {
		return selectCantConcesionarias();
	}
	
	public Object getProxSorteo(DynaActionForm form) throws SQLException {
		return selectCantidadesResumen();
	}

	
	public Object getTitulo(DynaActionForm form) throws SQLException {
		return selectUltActualizaciones();
	}

	
	public void updateNoticiaPal(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}
	
	public void updateTitulo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	

	public void updateProxSorteo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public Object getAvisos(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateAvisos(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public Object getInformacion(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateInfo(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	public Object getNovedad(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	public void updateNovedad(DynaActionForm form) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
