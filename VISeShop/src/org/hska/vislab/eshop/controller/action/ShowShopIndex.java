package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.model.dao.CommodityGroupDAO;
import org.hska.vislab.eshop.model.dao.DAOFactory;

public class ShowShopIndex extends Action {

	@Override
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		CommodityGroupDAO commodityGroupDAO = DAOFactory.getCommodityGroupDAO();

		request.setAttribute("commoditygroups", commodityGroupDAO
				.getAllRootGroups());

		return mapping.findForward("success");
	}
}
