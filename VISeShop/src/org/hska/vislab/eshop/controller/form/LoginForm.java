package org.hska.vislab.eshop.controller.form;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.validator.ValidatorForm;

public class LoginForm extends ValidatorForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5310202539401178359L;

	private String email = null;

	private String password = null;

	public String getEmail() {
		return (this.email);
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return (this.password);
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		ActionErrors errors = new ActionErrors();
		if (email.equals("")) {
			errors
					.add("login", new ActionMessage(
							"error.username.required"));
		} else if (!email.contains("@")) {
			errors.add("login", new ActionMessage("error.username.email"));
		}
		return errors;
	}
}
