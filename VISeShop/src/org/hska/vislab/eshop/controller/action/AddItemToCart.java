package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;
import org.hska.vislab.eshop.controller.form.ItemDetailsForm;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class AddItemToCart extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ItemDetailsForm itemDetailsForm = (ItemDetailsForm) form;
		ShoppingCart shoppingCart = (ShoppingCart) request.getSession()
				.getAttribute(Constants.SHOPPING_CART);

		Integer amount = itemDetailsForm.getAmount();

		ItemDAO itemDAO = DAOFactory.getItemDAO();
		Item currentItem = itemDAO.getById(itemDetailsForm.getItemId());

		shoppingCart.addItemToCart(currentItem, amount);

		Integer newAmount = currentItem.getCurrentAmount()
				- itemDetailsForm.getAmount();
		currentItem.setCurrentAmount(newAmount);

		return mapping.findForward("success");
	}
}
