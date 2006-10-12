package org.hska.vislab.eshop.model.dao;

import java.util.Collection;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hska.vislab.eshop.model.db.Account;

public class AccountDAO {

	Session currentSession;

	public AccountDAO(Session session) {
		currentSession = session;
	}

	public Account getAccountByKey(String email) {
		return (Account) currentSession.get(Account.class, email);
	}

	public Account saveAccount(String email, String firstname, String lastname,
			String street, String city, String zipcode, boolean adminFlag,
			String password, String country) {
		Account newAccount = new Account(email, adminFlag, password, firstname, lastname);
		newAccount.setCity(city);
		newAccount.setCountry(country);
		newAccount.setStreet(street);
		newAccount.setZipcode(zipcode);
		newAccount = (Account) currentSession.save(newAccount);
		return (Account) currentSession.save(newAccount);
	}
	
	public Account saveAccount(Account newAccount) {
		newAccount = (Account) currentSession.save(newAccount);
		return (Account) currentSession.save(newAccount);
	}

	@SuppressWarnings("unchecked")
	public Collection<Account> getAllAccounts() {
		Collection<Account> allAccounts = null;
		
		Query q = currentSession
			.createQuery("from Account");
		allAccounts = q.list(); 
		
		return allAccounts;
	}

}
