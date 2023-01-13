package org.zkoss.ZKHibernate.domain;

import java.io.Serializable;
import javax.persistence.*;
import org.hibernate.annotations.Type;


@Entity
@Table(name = "mmobil")
@NamedQuery(name= "mmobil.findAll", query = "SELECT m FROM mmobil m")
public class Mmobil implements Serializable {
	private static final long serialVersionUID = 1L;
	private Integer mmobilpk;
	private String merekmobil;
	private String tipemobil;
	
	public Mmobil () {
		
	}
	
	@Id
	@SequenceGenerator(name = "MMOBIL_MMOBILPK_GENERATOR", sequenceName= "MMOBIL_SEQ", initialValue = 1, allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "MMOBIL_MMOBILPK_GENERATOR")
	@Column(unique = true, nullable = false)
	public Integer getMmobilpk() {
		return mmobilpk;
	}

	public void setMmobilpk(Integer mmobilpk) {
		this.mmobilpk = mmobilpk;
	}
	
	@Column(length=25)
	// type = org.zkoss.util? tanya
	public String getMerekmobil() {
		return merekmobil;
	}

	public void setMerekmobil(String mmerekmobil) {
		this.merekmobil = mmerekmobil;
	}
	
	@Column(length=25)
	// type = org.zkoss.util? tanya
	public String getTipemobil() {
		return tipemobil;
	}

	public void setTipemobil(String mtipemobil) {
		this.tipemobil = mtipemobil;
	}
	
	
	
}
