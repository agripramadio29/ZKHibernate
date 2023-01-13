package org.zkoss.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class StoreHibernateUtil {
	
	private static SessionFactory sessionFactory;
	
	static {
		try {
			Configuration conf = new Configuration();
			sessionFactory = conf.configure().buildSessionFactory();
		} catch (Throwable ex) {
			// TODO: handle exception
			System.err.println("SessionFactory creation failed: " + ex);
		}
	}

	public static SessionFactory getSessionfactory() {
		return sessionFactory;
	}
	
	public static Session openSession() {
		return sessionFactory.openSession();
	}
}
