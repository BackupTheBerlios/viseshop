package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.hska.vislab.eshop.controller.form.EditItemForm;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class SaveItem extends Action {

	@SuppressWarnings("deprecation")
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		EditItemForm editItemForm = (EditItemForm) form;
		
		Integer itemId = Integer.parseInt(request.getParameter("itemid"));

		ItemDAO itemDAO = DAOFactory.getItemDAO();
		Item item = itemDAO.getById(itemId);
		
		item.setDescription(editItemForm.getDescription());
		item.setName(editItemForm.getName());
		item.setImgurl(editItemForm.getImgurl());
		item.setPrice(Float.parseFloat(editItemForm.getPrice()));

		itemDAO.updateItem(item);
		
		ActionErrors actionErrors = new ActionErrors();
		actionErrors.add("success", new ActionError("message.edititem.success"));
		saveErrors(request, actionErrors);
		
		return mapping.findForward("success");
	}

}
