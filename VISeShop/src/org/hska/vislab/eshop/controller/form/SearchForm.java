package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;

public class SearchForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5310202539401178378L;

	private String name = null;

	private String description = null;
	
	private String lowerprice = null;
	
	private String upperprice = null;

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getLowerprice() {
		return lowerprice;
	}

	public void setLowerprice(String lowerPrice) {
		this.lowerprice = lowerPrice;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUpperprice() {
		return upperprice;
	}

	public void setUpperprice(String upperPrice) {
		this.upperprice = upperPrice;
	}

}
