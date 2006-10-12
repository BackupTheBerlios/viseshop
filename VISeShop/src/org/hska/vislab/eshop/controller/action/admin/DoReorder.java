package org.hska.vislab.eshop.controller.action.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.controller.form.ReorderForm;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class DoReorder extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		
		ReorderForm reorderForm = (ReorderForm) form;
		
		ItemDAO itemDAO = DAOFactory.getItemDAO();
		
		Item current = itemDAO.getById(reorderForm.getItemId());
		
		Integer newAmount = current.getCurrentAmount()+reorderForm.getAmount();
		
		current.setCurrentAmount(newAmount);

		return mapping.findForward("success");
	}

}
