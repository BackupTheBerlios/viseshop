package org.hska.vislab.eshop.model.dao;

import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hska.vislab.eshop.model.db.Commoditygroup;

public class CommodityGroupDAO {

	Session currentSession;

	public CommodityGroupDAO(Session session) {
		currentSession = session;
	}

	public Commoditygroup getById(Integer commodityGroupId) {
		return (Commoditygroup) currentSession.get(Commoditygroup.class,
				commodityGroupId);
	}

	@SuppressWarnings("unchecked")
	public Collection<Commoditygroup> getAllRootGroups() {
		Collection<Commoditygroup> rootGroups = null;

		Query q = currentSession
				.createQuery("from Commoditygroup as grp where grp.commoditygroup = null");
		rootGroups = q.list();

		return rootGroups;
	}
}
