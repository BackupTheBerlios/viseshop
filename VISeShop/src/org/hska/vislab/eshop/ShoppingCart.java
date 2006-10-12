package org.hska.vislab.eshop;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import org.hska.vislab.eshop.model.db.Item;

public class ShoppingCart {
	String sessionId = null;

	Collection<OrderEntry> orders = new LinkedList<OrderEntry>();

	float total;

	public String getSessionId() {
		return sessionId;
	}

	public void setSessionId(String sessionId) {
		this.sessionId = sessionId;
	}

	public ShoppingCart(String sessionId) {
		super();
		this.sessionId = sessionId;
	}

	/**
	 * Fügt ein Anzahl eines Items zum Cart hinzu
	 * 
	 * @param item
	 *            Item
	 * @param amount
	 *            Anzahl
	 */
	public void addItemToCart(Item item, int amount) {
		OrderEntry current = getEntryInOrders(item);
		if (current == null) {
			current = new OrderEntry(item, 0);
			orders.add(current);
		}
		current.setAmount(current.getAmount() + amount);
	}

	/**
	 * @param item
	 * @return
	 */
	private OrderEntry getEntryInOrders(Item item) {
		Iterator<OrderEntry> iter = orders.iterator();
		while (iter.hasNext()) {
			OrderEntry current = iter.next();
			
			if (current.getItem().getId().equals(item.getId())) {
				return current;
			}
		}
		return null;
	}

	/**
	 * Löscht einen Artikle aus dem Warenkorb
	 * 
	 * @param item
	 *            zu löschendes Item
	 * @return Anzahl der freizugebenden Artikel um in die Bestände zu
	 *         aktualisieren.
	 */
	public Integer removeItemFromCart(Item item) {
		OrderEntry current = getEntryInOrders(item);
		if (current == null) {
			return null;
		}
		Integer amount = current.getAmount();
		orders.remove(current);
		return amount;
	}

	public Collection<OrderEntry> getAllOrderItems() {
		return orders;
	}

	public float getTotalSum() {
		float sum = 0; 
		Iterator<OrderEntry> iter = orders.iterator();
		while (iter.hasNext()) {
			OrderEntry current = iter.next();
			sum += current.getItem().getPrice() * current.getAmount();
		}
		return sum;
	}
}
