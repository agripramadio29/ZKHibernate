package org.zkoss.ZKHibernate.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.zkoss.zul.event.ListDataEvent;
import org.zkoss.zul.ext.Sortable;

import org.zkoss.ZKHibernate.domain.Mmobil;
import org.zkoss.ZKHibernate.dao.MmobilDAO;



public class MmobilListModel extends AbstractPagingListModel<Mmobil> implements Sortable<Mmobil> {
	
	private static final long serialVersionUID = 1L;
	
	private int _size = -1;
	List<Mmobil> oList;
	
	public MmobilListModel(int startPageNumber, int pageSize, String filter, String orderby) {
		super(startPageNumber, pageSize, filter, orderby);
	}
	
	@Override
	protected List<Mmobil> getPageData(int itemStartNumber, int pageSize, String filter, String orderby) {
		MmobilDAO oDao = new MmobilDAO();
		try {
			oList = oDao.listPaging(itemStartNumber, pageSize, filter, orderby);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return oList;
	}
	
	@Override
	public int getTotalSize(String filter) {
		MmobilDAO oDao = new MmobilDAO();
		try {
			_size = oDao.pageCount(filter);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return _size;
	}
	
	@Override
	public void sort(Comparator<Mmobil> cmpr, boolean ascending) {
		Collections.sort(oList, cmpr);
		fireEvent(ListDataEvent.CONTENTS_CHANGED, -1, -1);
	}
	
	@Override
	public String getSortDirection(Comparator<Mmobil> cmpr) {
		return null;
	}

}
