package org.hska.vislab.eshop.model.dao;

import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hska.vislab.eshop.model.db.Item;

public class ItemDAO {

	Session currentSession;

	public ItemDAO(Session session) {
		currentSession = session;
	}

	public Item getById(Integer itemId) {
		return (Item) currentSession.load(Item.class, itemId);
	}

	public Collection<Item> getAllItemsInGroup(Integer groupId) {
		Collection<Item> result = null;

		return result;
	}

	@SuppressWarnings("unchecked")
	public Collection<Item> getAllCriticalItems() {
		Collection<Item> criticalItems = null;

		Query q = currentSession
				.createQuery("from Item as i where i.currentAmount < i.criticalAmount");
		criticalItems = q.list();

		return criticalItems;
	}

	public Item updateItem(Item item) {
		currentSession.update(item);
		return item;
	}

}
