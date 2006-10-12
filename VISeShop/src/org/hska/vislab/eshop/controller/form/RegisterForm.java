package org.hska.vislab.eshop.controller.form;

import org.apache.struts.action.ActionForm;

public class RegisterForm extends ActionForm {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5832115143120271862L;

	private String email;

	private String firstname;

	private String lastname;

	private String street;

	private String zipcode;

	private String city;

	private String country;

	private String password;

	private String password_retype;

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword_retype() {
		return password_retype;
	}

	public void setPassword_retype(String password_retype) {
		this.password_retype = password_retype;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

}
