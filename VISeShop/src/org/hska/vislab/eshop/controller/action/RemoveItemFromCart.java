package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class RemoveItemFromCart extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		Integer itemId = Integer.parseInt(request.getParameter("itemid"));
		
		ItemDAO itemDAO = DAOFactory.getItemDAO();
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
				.getAttribute(Constants.SHOPPING_CART);
		
		Item current = itemDAO.getById(itemId);
		
		Integer orderedAmount = shoppingCart.removeItemFromCart(current);
		Integer newAmount = current.getCurrentAmount() + orderedAmount;
		
		current.setCurrentAmount(newAmount);
		
		return mapping.findForward("success");
	}
}
