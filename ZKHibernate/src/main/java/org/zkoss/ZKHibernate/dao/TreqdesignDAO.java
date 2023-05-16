package org.zkoss.ZKHibernate.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import org.zkoss.ZKHibernate.domain.Treqdesign;
import org.zkoss.utils.StoreHibernateUtil;
//import com.sdd.utils.db.StoreHibernateUtil;

public class TreqdesignDAO {

	private Session session;
	
	
	// list paging
	@SuppressWarnings("unchecked")
	public List<Treqdesign> listPaging(int first, int second, String filter, String orderby) throws Exception {
		List<Treqdesign> oList = null;
		if (filter == null || "".equals(filter)) {
			filter = "0 = 0";
		}
		session = StoreHibernateUtil.openSession();
		oList = session.createSQLQuery("select * from Treqdesign where " + filter + " order by " + orderby
				+ " limit " + second + " offset " + first).addEntity(Treqdesign.class).list();
		session.close();
		return oList;
	}
	
	public int pageCount(String filter) throws Exception {
		int count = 0;
		if (filter == null || "".equals(filter)) {
			filter = "0 = 0";
		}
		session = StoreHibernateUtil.openSession();
		count = Integer.parseInt((String) session.createSQLQuery("select count(*) from Treqdesign " + "where " + filter)
				.uniqueResult().toString());
		session.close();
		return count;
	}
	
	@SuppressWarnings("unchecked")
	public List<Treqdesign> listByFilter(String filter, String orderby) throws Exception {
		List<Treqdesign> oList = null;
		if (filter == null || "".equals(filter)) {
			filter = "0 = 0";
		}
		session = StoreHibernateUtil.openSession();
		oList = session.createQuery("from Treqdesign where " + filter + " order by " + orderby).list();
		session.close();
		return oList;
	}
	
//	@SuppressWarnings("unchecked") tunggu komando
//	public List<Treqdesign> listNativeByFilter(String filter, String orderby) throws Exception {
//		List<Treqdesign> oList = null;
//		if (filter == null || "".equals(filter)) {
//			filter = "0 = 0";
//		}
//		session = StoreHibernateUtil.openSession();
//		oList = session.createSQLQuery("select * from Treqdesign join Mproducttype on mproducttypefk = tpopk join Torder on torderfk = torderpk "
//				+ "where " + filter + " order by " + orderby).addEntity(Treqdesign.class).list();
//		session.close();
//		return oList;
//	}
	
	
	public Treqdesign findByPk(Integer pk) throws Exception {
		session = StoreHibernateUtil.openSession();
		Treqdesign oForm = (Treqdesign) session.createQuery("from Treqdesign where treqdesignpk = " + pk).uniqueResult();
		session.close();
		return oForm;
	}
	
	public Treqdesign findById(Integer pk) throws Exception {
		session = StoreHibernateUtil.openSession();
		Treqdesign oForm = (Treqdesign) session.createQuery("from Treqdesign where treqdesignpk = " + pk).uniqueResult();
		session.close();
		return oForm;
	}
	
	public Treqdesign findByFilter(String filter) throws Exception {
		session = StoreHibernateUtil.openSession();
		Treqdesign oForm = (Treqdesign) session.createQuery("from Treqdesign where " + filter).uniqueResult();
		session.close();
		return oForm;
	}
	
	@SuppressWarnings("rawtypes")
	public List listStr(String fieldname) throws Exception {
		List oList = new ArrayList();
		session = StoreHibernateUtil.openSession();
		oList = session.createQuery("select " + fieldname + " from Treqdesign order by " + fieldname).list();
		session.close();
		return oList;
	}
	
	public void save (Session session, Treqdesign oForm) throws HibernateException, Exception { session.saveOrUpdate(oForm); }
	
	public void delete (Session session, Treqdesign oForm) throws HibernateException, Exception { session.delete(oForm); }
	
	
}
