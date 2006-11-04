package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;
import org.hska.vislab.eshop.controller.form.ChangeAmountForm;

public class ChangeAmountAction extends Action{
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
		.getAttribute(Constants.SHOPPING_CART);

		request.setAttribute("orderitems", shoppingCart.getAllOrderItems());
		request.setAttribute("totalsum", shoppingCart.getTotalSum());
		
		return mapping.findForward("showShoppingCartChangeAmount");
	}
}
