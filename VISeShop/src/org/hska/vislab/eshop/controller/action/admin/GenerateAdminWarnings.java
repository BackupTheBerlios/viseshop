package org.hska.vislab.eshop.controller.action.admin;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class GenerateAdminWarnings extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ItemDAO itemDAO = DAOFactory.getItemDAO();

		Collection<Item> criticalItems = itemDAO.getAllCriticalItems();
		request.setAttribute("criticalitems", criticalItems);

		return mapping.findForward("success");
	}

}
