package ar.edu.ubp.das.src.admin.actions;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;

public class AdminHomeAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {

		Dao dao = DaoFactory.getDao("Home", "admin");
		request.setAttribute("home", dao.select(form));
		
		
		//UTILIZO EL METODO SELECTCONCESIONARIAS PORQUE ES UN SELECT COMUN SOLO QUE PERMITE RECIBIR POR PARAMETRO EL PROCEDIMIENTO
		//EN ESTE CASO NO SE LO PASO PORQUE NO NECESITO REUTILIZAR EL METODO EN ESTE DAO.
		request.setAttribute("ganadores", dao.selectConcesionarias("",form));
			
		
		return mapping.getForwardByName("success");
	}

}
