package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;

public class SubmitOrder extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.getSession().setAttribute(Constants.SHOPPING_CART, new ShoppingCart(request.getSession().getId()));

		return mapping.findForward("success");
	}

}
