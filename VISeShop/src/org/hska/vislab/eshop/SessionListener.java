package org.hska.vislab.eshop;

import java.text.DateFormat;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hska.vislab.eshop.model.dao.DAOFactory;
import org.hska.vislab.eshop.model.db.Item;
import org.hska.vislab.eshop.model.sf.HibernateUtil;

public class SessionListener implements HttpSessionListener {

	private static Log log = LogFactory.getLog(SessionListener.class);

	public void sessionCreated(HttpSessionEvent evt) {
		HttpSession session = evt.getSession();
		log.info("Session "
				+ session.getId()
				+ "  gestartet um "
				+ DateFormat.getTimeInstance().format(
						evt.getSession().getCreationTime()));
	}

	public void sessionDestroyed(HttpSessionEvent evt) {
		HttpSession session = evt.getSession();
		if (session.getAttribute(Constants.SHOPPING_CART) != null)
			removeReservedProducts(session);
		log.info("Session " + session.getId() + " abgelaufen!");
	}

	/**
	 * Entfernt die Reservierungen aller Produkte, die sich im Warenkorb
	 * befunden haben.
	 * 
	 * @param session
	 *            Session, die den Warenkorb enthält
	 */
	private static void removeReservedProducts(HttpSession session) {
		ShoppingCart shoppingCart = (ShoppingCart) session
				.getAttribute(Constants.SHOPPING_CART);

		// Transaktion erzeugen wenn diese noch nicht von SessionListener
		// gestartet wurde.
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session hibernateSession = sessionFactory.getCurrentSession();

		try {
			hibernateSession.getTransaction();
		} catch (HibernateException e) {
			hibernateSession.beginTransaction();
		}

		Collection<OrderEntry> orders = shoppingCart.getAllOrderItems();
		Iterator<OrderEntry> iter = orders.iterator();

		while (iter.hasNext()) {
			OrderEntry current = iter.next();

			Item currentItem = DAOFactory.getItemDAO().getById(
					current.getItem().getId());
			Integer newAmount = currentItem.getCurrentAmount()
					+ current.getAmount();

			currentItem.setCurrentAmount(newAmount);
			hibernateSession.update(currentItem);
		}

		try {
			hibernateSession.getTransaction().commit();
		} catch (HibernateException e) {
			System.err.println(e.getLocalizedMessage());
		}

		session.removeAttribute(Constants.SHOPPING_CART);
		session.invalidate();

		log.info("Session gelöscht und Artikel zurückgelegt!");
	}
}
