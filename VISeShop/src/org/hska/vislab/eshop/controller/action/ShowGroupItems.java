package org.hska.vislab.eshop.controller.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hska.vislab.eshop.model.dao.CommodityGroupDAO;
import org.hska.vislab.eshop.model.dao.DAOFactory;

public class ShowGroupItems extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		Integer groupId = Integer.parseInt(request.getParameter("groupid"));
		
		CommodityGroupDAO commodityGroupDAO = DAOFactory.getCommodityGroupDAO();
		
		request.setAttribute("commoditygroup", commodityGroupDAO.getById(groupId));
		
		return mapping.findForward("success");
	}
}
