package org.hska.vislab.eshop.model.dao;

import org.hska.vislab.eshop.model.sf.HibernateUtil;

public class DAOFactory {
	
	public static CommodityGroupDAO getCommodityGroupDAO() {
		return new CommodityGroupDAO(HibernateUtil.getSessionFactory().getCurrentSession());
	}
	
	public static ItemDAO getItemDAO() {
		return new ItemDAO(HibernateUtil.getSessionFactory().getCurrentSession());
	}

	public static AccountDAO getAccountDAO() {
		return new AccountDAO(HibernateUtil.getSessionFactory().getCurrentSession());
	}
}
