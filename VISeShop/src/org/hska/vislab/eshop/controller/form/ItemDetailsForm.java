package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.dao.ItemDAO;
import org.hska.vislab.eshop.model.db.Item;

public class ItemDetailsForm extends ActionForm {

	private static final long serialVersionUID = 4137704592750481585L;

	private Integer amount;

	private Integer itemId;

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public ActionErrors validate(ActionMapping arg0, HttpServletRequest arg1) {
		ActionErrors errors = new ActionErrors();
		ItemDAO itemDAO = DAOFactory.getItemDAO();
		Item currentItem = itemDAO.getById(itemId);
		// positive Anzahl der zu bestellenden Items
		if (amount < 1) {
			errors.add("amount", new ActionMessage("error.order.amount.wrong"));
		}
		// zu geringe Anzahl an Waren
		if ((currentItem.getCurrentAmount() - amount) < 0) {
			errors.add("amount",
					new ActionMessage("error.order.amount.tosmall"));
		}
		return errors;
	}

}
