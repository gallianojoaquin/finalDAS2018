package ar.edu.ubp.das.src.admin.actions;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.edu.ubp.das.general.ClienteServicio;
import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;

public class AdminPingAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {

		String strTipoWs = form.getItem("tipoWs");
		String strUrlWs = form.getItem("urlWs");
		
		if(strTipoWs.equals("REST")) {
			strTipoWs = "Rest";
		}
		
		try {			
			ClienteServicio clienteServicio = ClienteServicio.class.cast(Class.forName(ClienteServicio.class.getPackage().getName() + ".Cliente" + strTipoWs).newInstance() );
			String json = clienteServicio.consumir(strUrlWs, "ping");
			System.out.println(json);
			if(!json.equals("pong")) {
				throw new RuntimeException(); 
			}		    
		    return null;
		} 
		catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", e.getMessage());
			throw new RuntimeException();
		}
	
	}

}
