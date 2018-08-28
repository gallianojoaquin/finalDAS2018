package ar.edu.ubp.das.src.admin.actions;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ar.edu.ubp.das.mvc.action.Action;
import ar.edu.ubp.das.mvc.action.ActionMapping;
import ar.edu.ubp.das.mvc.action.DynaActionForm;
import ar.edu.ubp.das.mvc.config.ForwardConfig;
import ar.edu.ubp.das.mvc.db.Dao;
import ar.edu.ubp.das.mvc.db.DaoFactory;

public class AdminLoginValidarAction implements Action {

	@Override
	public ForwardConfig execute(ActionMapping mapping, DynaActionForm form, HttpServletRequest request,
			HttpServletResponse response) throws SQLException, RuntimeException {
		
		Dao dao = DaoFactory.getDao("Login", "admin");
		
		String sMessage ="";
		if(!dao.valid(form)) {
			sMessage = "Usuario incorrecto.";
			request.setAttribute("message", sMessage);
			response.setStatus(400);
			return mapping.getForwardByName("information");
		}	
		String usuario="";
		if(form.getItem("tipoDoc") != null || form.getItem("tipoDoc") != "")
			usuario = form.getItem("tipoDoc").toString() + ";" + form.getItem("usuario").toString();
		else
			usuario = form.getItem("usuario").toString();

		HttpSession session = request.getSession(false);
		
		if (session != null)
		{
			session.setAttribute("usuario", usuario);
		}
		
		return mapping.getForwardByName("success");
		
	}

}
