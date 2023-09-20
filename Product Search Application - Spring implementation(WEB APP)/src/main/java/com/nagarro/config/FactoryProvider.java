package com.nagarro.config;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.nagarro.entities.Users;

public class FactoryProvider {
	private static SessionFactory factory;

	public static SessionFactory getFactory() {
		try {

			if (factory == null) {
				factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Users.class).buildSessionFactory();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return factory;
	}
}