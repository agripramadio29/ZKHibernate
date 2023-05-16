package org.zkoss.ZKHibernate.viewmodel;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.text.NumberFormat;
import java.util.Date;

import org.hibernate.HibernateException;
import org.hibernate.Transaction;
import org.zkoss.bind.BindContext;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.Validator;
import org.zkoss.bind.annotation.AfterCompose;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.io.Files;
import org.zkoss.util.media.Media;
import org.zkoss.util.resource.Labels;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.event.UploadEvent;
import org.zkoss.zk.ui.select.Selectors;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Button;
import org.zkoss.zul.Combobox;
import org.zkoss.zul.Div;
import org.zkoss.zul.Grid;
import org.zkoss.zul.Image;
import org.zkoss.zul.Label;
import org.zkoss.zul.ListModelList;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.ListitemRenderer;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Paging;
import org.zkoss.zul.event.PagingEvent;

import org.zkoss.ZKHibernate.dao.TreqdesignDAO;
import org.zkoss.ZKHibernate.domain.Treqdesign;
import org.zkoss.ZKHibernate.model.TreqdesignListModel;

//import com.sdd.incams.dao.TcounterengineDAO;
//import com.sdd.incams.dao.MproducttypeDAO;
//import com.sdd.incams.domain.Mproducttype;
//import com.sdd.incams.domain.Muser;
//import com.sdd.incams.utils.AppData;
//import com.sdd.incams.utils.AppUtils;
//import com.sdd.utils.SysUtils;
//import com.sdd.utils.db.StoreHibernateUtil;


public class TreqdesignVm {
	
	private org.zkoss.zk.ui.Session zkSession = Sessions.getCurrent();
//	private Muser oUser;
	
	private org.hibernate.Session session;
	private Transaction transaction;
	
	private TreqdesignListModel model;
	private TreqdesignDAO oDao = new TreqdesignDAO();
	
	private int pageStartNumber;
	private int pageTotalSize;
	private boolean needsPageUpdate;
	private String filter;
	private String orderby;
	private boolean isInsert;
	private String filenameimg;
	private String filenameart;
	private String documentname;
	private String memo;
	private String status;
	private Integer totalitem;
	private Media media_pic;
	private Media media_art;
	
	private Treqdesign objForm;
	private String unitcode;
//	private Mproduct mproduct;
//	private Mproducttype mproducttype;
	
//	private TorderDAO oDao = new TorderDAO();
//	private TordermemoDAO memoDao = new TordermemoDAO();
//	private TorderdocDAO docDao = new TorderdocDAO();
	
//	private List<Torderdoc> docList = new ArrayList<>();
//	private List<Mproduct> mproductmodel = new ArrayList<>()
//	private Map<String, Media> mapMedia = new HashMap<String, Media>();
	
	
	@Wire
	private Grid gridDoc;
	@Wire
	private Button btnSave;
	@Wire
	private Button btnCancel;
	@Wire
	private Button btnDelete;
	@Wire
	private Button btnBrowseimg;
	@Wire
	private Button btnBrowseart;
	@Wire
	private Image image;
	@Wire
	private Listbox listbox;
	@Wire
	private Div divImage;
	@Wire
	private Combobox cbProduct, cbProducttype;
	@Wire
	private Label lblmemo;
	
	
//	@AfterCompose
//	public void afterCompose(@ContextParam(ContextType.VIEW) Component view) throws Exception {
//		Selectors.wireComponents(view, this, false);
//		oUser = (Muser) zkSession.getAttribute("oUser");
//		if (oUser != null)
//			unitcode = oUser.getMusergroup().getUnitcode();
//		doReset();
//	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
