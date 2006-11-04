package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.validator.ValidatorForm;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;

public class ChangeItemInCartForm extends ValidatorForm{
	String newamount = null;
	
	public String getNewamount() {
		return newamount;
	}

	public void setNewamount(String newamount) {
		this.newamount = newamount;
	}

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		
		Integer itemId = Integer.parseInt(request.getParameter("itemid"));
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
		.getAttribute(Constants.SHOPPING_CART);
		
		Integer iNewAmount = 1;
		
		try{
			iNewAmount = Integer.parseInt(newamount);
		} catch(Exception ex){
			errors.add("illegalamount", new ActionMessage("error.amount.notanumber"));
			request.setAttribute("orderitems", shoppingCart.getAllOrderItems());
			request.setAttribute("totalsum", shoppingCart.getTotalSum());
		}
		
		if(iNewAmount <= 0){
			errors.add("illegalamount", new ActionMessage("error.amount.tosmall"));
			request.setAttribute("orderitems", shoppingCart.getAllOrderItems());
			request.setAttribute("totalsum", shoppingCart.getTotalSum());
		}
		
		return errors;
	}
}