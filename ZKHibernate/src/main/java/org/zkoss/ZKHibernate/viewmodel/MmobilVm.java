package org.zkoss.ZKHibernate.viewmodel;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.zkoss.bind.BindUtils;
import org.zkoss.bind.ValidationContext;
import org.zkoss.bind.Validator;
import org.zkoss.bind.annotation.AfterCompose;
import org.zkoss.bind.annotation.Command;
import org.zkoss.bind.annotation.ContextParam;
import org.zkoss.bind.annotation.ContextType;
import org.zkoss.bind.annotation.NotifyChange;
import org.zkoss.bind.validator.AbstractValidator;
import org.zkoss.util.resource.Labels;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.Sessions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.select.Selectors;
import org.zkoss.zk.ui.select.annotation.Wire;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Button;
import org.zkoss.zul.Listbox;
import org.zkoss.zul.Listcell;
import org.zkoss.zul.Listitem;
import org.zkoss.zul.ListitemRenderer;
import org.zkoss.zul.Messagebox;
import org.zkoss.zul.Paging;
import org.zkoss.zul.event.PagingEvent;


import org.zkoss.ZKHibernate.dao.MmobilDAO;
import org.zkoss.ZKHibernate.domain.Mmobil;
import org.zkoss.ZKHibernate.model.MmobilListModel;
import org.zkoss.utils.StoreHibernateUtil;
import org.zkoss.utils.SysUtils;


public class MmobilVm {
	
	private org.zkoss.zk.ui.Session zkSession = Sessions.getCurrent();
	private Session session;
	private Transaction transaction;
	private MmobilListModel model;
	private MmobilDAO oDao  = new MmobilDAO();
	
	private int pageStartNumber;
	private int pageTotalSize;
	private boolean needsPageUpdate;
	private String filter;
	private String orderby;
	private boolean isInsert;
	
	private Mmobil objForm;
	private String merekmobil;
	private String tipemobil;
	
	@Wire
	private Button btnSave;
	@Wire
	private Button btnCancel;
	@Wire
	private Button btnDelete;
	@Wire
	private Paging paging;
	@Wire
	private Listbox listbox;
	
	@NotifyChange("*")
	@AfterCompose
	public void afterCompose(@ContextParam(ContextType.VIEW) Component view) {
		Selectors.wireComponents(view, this, false);
		paging.addEventListener("onPaging", new EventListener<Event>() {
			
			@Override
			public void onEvent(Event event) throws Exception {
				PagingEvent pe = (PagingEvent) event;
				pageStartNumber = pe.getActivePage();
				refreshModel(pageStartNumber);
			}
			
		});
		
		needsPageUpdate = true;
		//doReset();
		
		if (listbox != null) {
			listbox.setItemRenderer(new ListitemRenderer<Mmobil>() {
				@Override
				public void render(Listitem item, final Mmobil data, int index) throws Exception {
					Listcell cell = new Listcell(String.valueOf((SysUtils.PAGESIZE * pageStartNumber) + index + 1));
					item.appendChild(cell);
					cell = new Listcell(data.getMerekmobil());
					item.appendChild(cell);
					cell = new Listcell(data.getTipemobil());
					item.appendChild(cell);
				}
			});
		}
		
		listbox.addEventListener(Events.ON_CLICK, new EventListener<Event>() {
			@Override
			public void onEvent(Event event) throws Exception{
				if (listbox.getSelectedIndex() != -1) {
					isInsert = false;
					btnSave.setLabel(Labels.getLabel("common.update"));
					btnCancel.setDisabled(false);
					btnDelete.setDisabled(false);
				}
			}
			
		});
		
	}
		
		public void refreshModel(int activePage) {
			orderby = "mmobil";
			paging.setPageSize(SysUtils.PAGESIZE);
			model = new MmobilListModel(activePage, SysUtils.PAGESIZE, filter, orderby);
			if (needsPageUpdate) {
				pageTotalSize = model.getTotalSize(filter);
				needsPageUpdate = false;
			}
			
			paging.setTotalSize(pageTotalSize);
			listbox.setModel(model);
		}
		
		@Command
		public void doSearch() {
			filter = "";
			if (merekmobil != null && merekmobil.trim().length() > 0) {
				if (filter.length() > 0)
					filter += " and ";
				filter += "merekmobil like '%" + merekmobil.trim().toUpperCase() + "%'";
				
			}
			
			needsPageUpdate = true;
			paging.setActivePage(0);
			pageStartNumber = 0;
			refreshModel(pageStartNumber);
		}
		
		@NotifyChange("objForm")
		public void doReset() {
			isInsert = true;
			objForm = new Mmobil();
			refreshModel(pageStartNumber);
			btnCancel.setDisabled(true);
			btnDelete.setDisabled(true);
			btnSave.setLabel(Labels.getLabel("common.save"));
		}
		
		@Command
		@NotifyChange("objForm")
		public void cancel() {
			doReset();
		}
		
		//transaction buat apa??
		@Command
		@NotifyChange("objForm") 
		public void save() {
			try {
				try {
					session = StoreHibernateUtil.openSession();
					transaction = session.beginTransaction();
					if (isInsert) {
					}
					oDao.save(session, objForm);
					transaction.commit();
					session.close();
					if (isInsert) {
						needsPageUpdate = true;
						Clients.evalJavaScript("showToast1('success', 'Data successfully saved')");
					} else {
						Clients.evalJavaScript("showToast1('success', 'Data updated successfully')");
					}
					doReset();
				} catch (HibernateException e) {
					// TODO: handle exception
					transaction.rollback();
					if (isInsert) {
						objForm.setMmobilpk(null);
						Clients.evalJavaScript("showToast1('error', '" + e.getMessage() + "')");
					}
					e.printStackTrace();
				} catch (Exception e) {
					if (isInsert) {
						objForm.setMmobilpk(null);
						Clients.evalJavaScript("showToast1('error', '" + e.getMessage() + "')");
					}
					e.printStackTrace();
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		
		@SuppressWarnings({ "rawtypes", "unchecked" })
		@Command
		@NotifyChange("objForm")
		public void delete() {
			try {
				Messagebox.show(Labels.getLabel("common.delete.confirm"), "Confirm Dialog",
						Messagebox.OK | Messagebox.CANCEL, Messagebox.QUESTION, new EventListener() {
					@Override
					public void onEvent(Event event) throws Exception {
						if (event.getName().equals("onOK")) {
							try {
								session = StoreHibernateUtil.openSession();
								oDao.delete(session, objForm);
								session.close();
								Clients.evalJavaScript("showToast1('success', '" + Labels.getLabel("common.delete.success") + "')");
								
								needsPageUpdate = true;
								doReset();
								BindUtils.postNotifyChange(null, null, MmobilVm.this, "objForm");
							} catch (HibernateException e) {
								// TODO: handle exception
								Clients.evalJavaScript("showToast1('error','" + e.getMessage() + "')");
								e.printStackTrace();
							}
							catch (Exception e) {
								Clients.evalJavaScript("showToast1('error','" + e.getMessage() + "')");
								e.printStackTrace();
							}
						}
					}
				});
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			
		}
		
		public Validator getValidator() {
			return new AbstractValidator() {
				@Override
				public void validate(ValidationContext context) {
					String merekmobil = (String) context.getProperties("merekmobil")[0].getValue();
					String tipemobil = (String) context.getProperties("tipemobil")[0].getValue();
					
					if (merekmobil == null || "".equals(merekmobil.trim())) {
						this.addInvalidMessage(context, "merekmobil", Labels.getLabel("common.validator.empty"));
					}
					
					if (tipemobil == null || "".equals(tipemobil.trim())) {
						this.addInvalidMessage(context, "tipemobil", Labels.getLabel("common.validator.empty"));
					}
				}
			};
		}

		public String getMerekmobil() {
			return merekmobil;
		}

		public void setMerekmobil(String merekmobil) {
			this.merekmobil = merekmobil;
		}

		public String getTipemobil() {
			return tipemobil;
		}

		public void setTipemobil(String tipemobil) {
			this.tipemobil = tipemobil;
		}

		public Mmobil getObjForm() {
			return objForm;
		}

		public void setObjForm(Mmobil objForm) {
			this.objForm = objForm;
		}
		
		
		
		
	}
	
	
	
	
	
	
	
