package org.hska.vislab.eshop.controller.action;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hska.vislab.eshop.controller.form.SearchForm;
import org.hska.vislab.eshop.model.db.Item;
import org.hska.vislab.eshop.model.sf.HibernateUtil;

public class SearchAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		
		SearchForm searchform = (SearchForm) form;
		
		String searchedtext = "%" + searchform.getSearchedtext().trim() + "%";
		float upperprice;
		float lowerprice;
		
		if (searchform.getUpperprice().length() != 0) {
			upperprice = Float.parseFloat(searchform.getUpperprice().trim());
		} else {
			upperprice = Float.POSITIVE_INFINITY;
		}
		if (searchform.getLowerprice().length() != 0) {
			lowerprice = Float.parseFloat(searchform.getLowerprice().trim());
		} else {
			lowerprice = Float.NEGATIVE_INFINITY;
		}
				
		List<Item> results = new LinkedList<Item>();
		
		Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		Query q = session.createQuery("FROM Item AS item WHERE (item.name LIKE ? OR item.description LIKE ?) AND (item.price BETWEEN ? AND ?)");
		q.setString(0, searchedtext);
		q.setString(1, searchedtext);
		q.setFloat(2, lowerprice);
		q.setFloat(3, upperprice);
		
		results = q.list();
		
		request.setAttribute("itemlist", results);
		
		return mapping.findForward("showResults");
	}
}
