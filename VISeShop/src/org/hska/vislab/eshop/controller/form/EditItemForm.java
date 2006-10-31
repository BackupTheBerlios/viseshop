package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.validator.ValidatorForm;

public class EditItemForm extends ValidatorForm {

	private static final long serialVersionUID = 5102758642751678272L;
	
	private String name = null;
	
	private String description = null;
	
	private String imgurl = null;
	
	private String price = null;

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgurl() {
		return imgurl;
	}

	public void setImgurl(String imgurl) {
		this.imgurl = imgurl;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ActionErrors validate(ActionMapping arg0, HttpServletRequest arg1) {
		ActionErrors errors = new ActionErrors();
		
		try {
			Float.parseFloat(price);
		} catch (Exception e) {
			errors.add("editdetails", new ActionError("error.editdetails.price"));
		}
		
		if (name.length() <= 0) {
			errors.add("editdetails", new ActionError("error.editdetails.name"));
		}
		if (description.length() <= 0) {
			errors.add("editdetails", new ActionError("error.editdetails.description"));
		}

		return errors;
	}
	
	

}
