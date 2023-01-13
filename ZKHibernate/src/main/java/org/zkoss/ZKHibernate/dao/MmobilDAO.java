package org.zkoss.ZKHibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.zkoss.ZKHibernate.domain.Mmobil;
import org.zkoss.utils.StoreHibernateUtil;

public class MmobilDAO {
	
	private Session session;
	
	// coba list paging
	// ini apaan maksudnya?
	@SuppressWarnings("unchecked")
	public List <Mmobil> listPaging(int first, int second, String filter, String orderby) throws Exception {
		List<Mmobil> oList = null;
		if (filter == null || "".equals(filter)) 
			filter = "0 = 0";
		
		// buka session
		session = StoreHibernateUtil.openSession();
		// session create query dri sql
		oList = session.createSQLQuery("select * from Mmobil where " + filter + " order by " + orderby + " limit " + second + " offset " + first).addEntity(Mmobil.class).list();
		
		session.close();
		return oList;
	}
	
	@SuppressWarnings("unchecked")
	public List <Mmobil> listProduct(String filter, String orderby) throws Exception {
		List<Mmobil> oList = null;
		if (filter == null || "".equals(filter))
			filter = "0 = 0";
		session = StoreHibernateUtil.openSession();
		oList = session.createSQLQuery("select * from Mmobil where " + filter + " order by " + orderby).addEntity(Mmobil.class).list();
		
		session.close();
		return oList;
	}
	
	public int pageCount(String filter) throws Exception {
		int count = 0;
		if (filter == null || "".equals(filter)) {
			filter = "0 = 0";
		}
		
		session = StoreHibernateUtil.openSession();
		count = Integer.parseInt((String) session.createSQLQuery("select count(*) from Mmobil where " + filter).uniqueResult().toString());
		session.close();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Mmobil> listByFilter(String filter, String orderby) throws Exception {
		List <Mmobil> oList = null;
		if (filter == null || "".equals(filter)) {
			filter = "0 = 0";
		}
		
		session = StoreHibernateUtil.openSession();
		oList = session.createQuery("from Mmobil where " + filter + " order by " + orderby).list();
		session.close();
		return oList;
	}
	
	public Mmobil findByPk(Integer pk) throws Exception{
		session = StoreHibernateUtil.openSession();
		Mmobil oForm = (Mmobil) session.createQuery("from Mmobil where Mmobilpk = " + pk).uniqueResult();
		session.close();
		return oForm;
	}
	
	public Mmobil findById(Integer pk) throws Exception{
		session = StoreHibernateUtil.openSession();
		Mmobil oForm = (Mmobil) session.createQuery("from Mmobil where Mmobilpk = " + pk).uniqueResult();
		session.close();
		return oForm;
	}
	
	public Mmobil findByFilter(String filter) throws Exception {
		session = StoreHibernateUtil.openSession();
		Mmobil oForm = (Mmobil) session.createQuery("from Mmobil where " + filter).uniqueResult();
		session.close();
		return oForm;
	}
	
	@SuppressWarnings("rawtypes")
	public List listStr(String fieldname) throws Exception{
		List oList = new ArrayList();
		session = StoreHibernateUtil.openSession();
		oList = session.createQuery("select " + fieldname + " from Mmobil order by " + fieldname).list();
		session.close();
		return oList;
	}
	
	public void save(Session session, Mmobil oForm) throws HibernateException, Exception {
		session.saveOrUpdate(oForm);
	}
	
	public void delete(Session session, Mmobil oForm) throws HibernateException, Exception {
		session.delete(oForm);
	}
	

}
