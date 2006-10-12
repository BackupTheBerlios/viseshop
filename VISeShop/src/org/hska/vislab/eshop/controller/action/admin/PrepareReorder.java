package org.hska.vislab.eshop.controller.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;

public class PrepareReorder extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		Integer itemId = Integer.parseInt(request.getParameter("itemid"));

		ItemDAO itemDAO = DAOFactory.getItemDAO();

		request.setAttribute("item", itemDAO.getById(itemId));

		return mapping.findForward("success");
	}

}
