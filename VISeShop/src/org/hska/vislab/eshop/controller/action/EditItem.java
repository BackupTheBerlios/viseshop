package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.controller.form.EditItemForm;
import org.hska.vislab.eshop.controller.form.ItemDetailsForm;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class EditItem extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		Integer itemId = Integer.parseInt(request.getParameter("itemid"));
		
		ItemDAO itemDAO = DAOFactory.getItemDAO();
		Item item = itemDAO.getById(itemId);
		
		request.setAttribute("item", item);

		return mapping.findForward("success");
	}

}
