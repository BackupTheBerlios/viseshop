package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.controller.form.RegisterForm;
import org.hska.vislab.eshop.model.dao.AccountDAO;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.db.Account;

public class RegisterAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		RegisterForm registerForm = (RegisterForm) form;
		
		String eMail = (String)(request.getSession().getAttribute("email"));
		request.getSession().removeAttribute("email");
		
		Account account = new Account();
		account.setAdministrator(false);
		account.setCity(registerForm.getCity());
		account.setCountry(registerForm.getCountry());
		account.setEmail(eMail);
		account.setFirstname(registerForm.getFirstname());
		account.setLastname(registerForm.getLastname());
		account.setStreet(registerForm.getStreet());
		account.setZipcode(registerForm.getZipcode());

		// Gleicheit der Passwörter sicherstellen
		if (registerForm.getPassword()
				.equals(registerForm.getPassword_retype())) {
			account.setPassword(registerForm.getPassword());
		} else {
			// TODO Fehler ausgeben
			return mapping.getInputForward();
		}
		
		// Account in der Datenbank eintragen
		AccountDAO accountDAO = DAOFactory.getAccountDAO();
		account = accountDAO.saveAccount(account);

		// Account an die Session Binden
		request.getSession().setAttribute(Constants.ACCOUNT, account);

		return mapping.findForward("success");
	}
}
