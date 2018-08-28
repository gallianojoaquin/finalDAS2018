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

public class AdminResumenAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {

		Dao dao = DaoFactory.getDao("Admin", "admin");
		
		request.setAttribute("CantConcesionarias", dao.getNoticiaPal(form));
		
		request.setAttribute("ActualizacionConcesionarias", dao.getTitulo(form));
		
		request.setAttribute("Resumen", dao.getProxSorteo(form));
		
		request.setAttribute("Ganadores", dao.getDetallePlan(form));
		
		return mapping.getForwardByName("success");
	
	}

}