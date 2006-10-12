package org.hska.vislab.eshop.controller.action;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;

public class ConfirmOrder extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
				.getAttribute(Constants.SHOPPING_CART);
		
		Collection orderItems = shoppingCart.getAllOrderItems();
		
		request.setAttribute("orderitems", orderItems);
		request.setAttribute("total", shoppingCart.getTotalSum());

		return mapping.findForward("success");
	}

}
