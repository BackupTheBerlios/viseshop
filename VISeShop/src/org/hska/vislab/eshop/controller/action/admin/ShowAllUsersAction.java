package org.hska.vislab.eshop.controller.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.model.dao.AccountDAO;
import org.hska.vislab.eshop.model.dao.DAOFactory;

public class ShowAllUsersAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		AccountDAO accountDAO = DAOFactory.getAccountDAO();
				
		request.setAttribute("accounts", accountDAO.getAllAccounts());
		
		return mapping.findForward("success");
	}
	
	

}
