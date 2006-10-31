package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.Constants;
import org.hska.vislab.eshop.ShoppingCart;
import org.hska.vislab.eshop.controller.form.LoginForm;
import org.hska.vislab.eshop.model.dao.AccountDAO;
import org.hska.vislab.eshop.model.dao.CommodityGroupDAO;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.db.Account;

public class LoginAction extends Action {

	@SuppressWarnings("deprecation")
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		LoginForm loginForm = (LoginForm) form;

		AccountDAO accountDAO = DAOFactory.getAccountDAO();

		Account account = accountDAO.getAccountByKey(loginForm.getEmail());

		// Sollte der Benutzer nicht existieren, werden auf der
		// Folgeseite die Benutzerdaten abgefragt.
		if (account == null) {
			request.getSession().setAttribute("email", loginForm.getEmail());
			return mapping.findForward("registration");

		} else {

			// Falls das Passwort korrekt ist wird auf auf den Shop
			// weitergeleitet. Ein Admin kommt auf die Adminindex Seite.
			if (account.getPassword().equals(loginForm.getPassword())) {
				request.getSession().setAttribute(Constants.ACCOUNT, account);
				request.getSession().setAttribute(Constants.SHOPPING_CART,
						new ShoppingCart(request.getSession().getId()));

				CommodityGroupDAO commodityGroupDAO = DAOFactory
						.getCommodityGroupDAO();

				request.setAttribute("commoditygroups", commodityGroupDAO
						.getAllRootGroups());

				if (account.isAdministrator())
					return mapping.findForward("success_admin");
				else
					return mapping.findForward("success");
			} else {
				ActionErrors errors = new ActionErrors();
				errors.add("login", new ActionError(
						"error.user.passwordforgotten"));
				saveErrors(request, errors);
				return mapping.getInputForward();
			}
		}
	}
}
