package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.validator.ValidatorForm;

public class SearchForm extends ValidatorForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5310202539401178378L;

	private String searchedtext = null;
	
	private String lowerprice = null;
	
	private String upperprice = null;

	public String getSearchedtext() {
		return searchedtext;
	}

	public void setSearchedtext(String searchedtext) {
		this.searchedtext = searchedtext;
	}

	public String getLowerprice() {
		return lowerprice;
	}

	public void setLowerprice(String lowerPrice) {
		this.lowerprice = lowerPrice;
	}


	public String getUpperprice() {
		return upperprice;
	}

	public void setUpperprice(String upperPrice) {
		this.upperprice = upperPrice;
	}
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
				
		float fUpperPrice = 0.0f;
		float fLowerPrice = 0.0f;
		
		try{
			if ( (upperprice != null) && (upperprice.length() > 0) )
			fUpperPrice = Float.parseFloat(upperprice);
		} catch (Exception ex){
			errors.add("search", new ActionMessage("error.search.upperprice"));
		}
		
		try{
			if ( (lowerprice != null) && (lowerprice.length() > 0) )
			fLowerPrice = Float.parseFloat(lowerprice);
		} catch (Exception ex){
			errors.add("search", new ActionMessage("error.search.lowerprice"));
		}
		
		if (lowerprice.length() == 0) fLowerPrice = Float.NEGATIVE_INFINITY;
		if (upperprice.length() == 0) fUpperPrice = Float.POSITIVE_INFINITY;
		if ( fUpperPrice < fLowerPrice ){
			errors.add("search", new ActionMessage("error.search.upperpriceSamlerLowerprice"));
		}
		return errors;
	}
}
