package org.zkoss.ZKHibernate.domain;

import java.io.Serializable;
import javax.persistence.*;
import org.hibernate.annotations.Type;
import java.util.Date;


@Entity
@Table(name = "treqdesign")
@NamedQuery(name = "Treqdesign.findAll", query = "SELECT t FROM treqdesign t")
public class Treqdesign implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer treqdesignpk;
//	private Mproducttype mproducttype;
	private String reqid;
	private Integer totalitem;
	private String cardimgid;
	private String cardimgname;
	private String artworkimgid;
	private String artworkimgname;
	private String docid;
	private String docname;
	private String memo;
	private String status;
	private Date createdtime;
	private String createdby;
	private Date lastupdated;
	private String updatedby;

	public Treqdesign() {
		
	}
	
	@Id
	@SequenceGenerator(name = "TREQDESIGN_TREQDESIGNPK_GENERATOR", sequenceName = "TREQDESIGN_SEQ", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "TREQDESIGN_TREQDESIGNPK_GENERATOR")
	@Column(unique = true, nullable = false)
	public Integer getTreqdesignpk() {
		return treqdesignpk;
	}

	public void setTreqdesignpk(Integer treqdesignpk) {
		this.treqdesignpk = treqdesignpk;
	}

//	public Mproducttype getMproducttype() {
//		return mproducttype;
//	}
//
//	public void setMproducttype(Mproducttype mproducttype) {
//		this.mproducttype = mproducttype;
//	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 20)
	public String getReqid() {
		return reqid;
	}
	
	public void setReqid(String reqid) {
		this.reqid = reqid;
	}

	public Integer getTotalitem() {
		return totalitem;
	}

	public void setTotalitem(Integer totalitem) {
		this.totalitem = totalitem;
	}

	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 20)
	public String getCardimgid() {
		return cardimgid;
	}

	public void setCardimgid(String cardimgid) {
		this.cardimgid = cardimgid;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUserType")
	@Column(length = 100)
	public String getCardimgname() {
		return cardimgname;
	}

	public void setCardimgname(String cardimgname) {
		this.cardimgname = cardimgname;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 20)
	public String getArtworkimgid() {
		return artworkimgid;
	}

	public void setArtworkimgid(String artworkimgid) {
		this.artworkimgid = artworkimgid;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUserType")
	@Column(length = 100)
	public String getArtworkimgname() {
		return artworkimgname;
	}

	public void setArtworkimgname(String artworkimgname) {
		this.artworkimgname = artworkimgname;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 20)
	public String getDocid() {
		return docid;
	}

	public void setDocid(String docid) {
		this.docid = docid;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUserType")
	@Column(length = 100)
	public String getDocname() {
		return docname;
	}

	public void setDocname(String docname) {
		this.docname = docname;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 100)
	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 1)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getCreatedtime() {
		return createdtime;
	}

	public void setCreatedtime(Date createdtime) {
		this.createdtime = createdtime;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	
	@Temporal(TemporalType.TIMESTAMP)
	public Date getLastupdated() {
		return lastupdated;
	}

	public void setLastupdated(Date lastupdated) {
		this.lastupdated = lastupdated;
	}
	
	@Type(type = "com.sdd.utils.usertype.TrimUpperCaseUserType")
	@Column(length = 20)
	public String getUpdatedby() {
		return updatedby;
	}

	public void setUpdatedby(String updatedby) {
		this.updatedby = updatedby;
	}
	
	
	
}
