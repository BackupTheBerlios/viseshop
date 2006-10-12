package org.hska.vislab.eshop.controller.form;

import org.apache.struts.action.ActionForm;

public class ReorderForm extends ActionForm {

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

}
