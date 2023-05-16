package org.zkoss.ZKHibernate.model;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.zkoss.zul.event.ListDataEvent;
import org.zkoss.zul.ext.Sortable;

import org.zkoss.ZKHibernate.dao.TreqdesignDAO;
import org.zkoss.ZKHibernate.domain.Treqdesign;

public class TreqdesignListModel extends AbstractPagingListModel<Treqdesign> implements Sortable<Treqdesign> {
	
	private static final long serialVersionUID = 1L;
	
	private int _size = -1;
	List<Treqdesign> oList;
	
	public TreqdesignListModel(int startPageNumber, int pageSize, String filter, String orderby) {
		super(startPageNumber, pageSize, filter, orderby);
	}
	
	@Override
	protected List<Treqdesign> getPageData(int itemStartNumber, int pageSize, String filter, String orderby) {
		TreqdesignDAO oDao = new TreqdesignDAO();
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
		TreqdesignDAO oDao = new TreqdesignDAO();
		try {
			_size = oDao.pageCount(filter);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return _size;
	}
	
	@Override
	public void sort(Comparator<Treqdesign> cmpr, boolean ascending) {
		Collections.sort(oList, cmpr);
		fireEvent(ListDataEvent.CONTENTS_CHANGED, -1, -1);
	}
	
	@Override
	public String getSortDirection(Comparator<Treqdesign> cmpr) {
		return null;
	}	
}
