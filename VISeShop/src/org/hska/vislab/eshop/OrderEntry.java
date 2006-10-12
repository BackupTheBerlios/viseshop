package org.hska.vislab.eshop;

import org.hska.vislab.eshop.model.db.Item;

public class OrderEntry {

	private Item item;

	private Integer amount;

	public OrderEntry(Item item, Integer amount) {
		super();
		this.item = item;
		this.amount = amount;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

}
