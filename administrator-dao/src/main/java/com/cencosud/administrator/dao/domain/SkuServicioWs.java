/**
 * 
 */
package com.cencosud.administrator.dao.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author EA7129
 *
 */


@Entity
@Table(name = "sku_servicio_ws")
public class SkuServicioWs implements Serializable {
	
	
private static final long serialVersionUID = 5468480017252581493L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_SKU_SERVICIO_WS")
	@SequenceGenerator(name = "SEQUENCE_SKU_SERVICIO_WS", sequenceName = "SEQUENCE_SKU_SERVICIO_WS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	
	@Column(name = "INUMBR")
	private int inumbr;
	
	@Column(name = "PRSDEP")
	private int prsDep;
	
	@Column(name = "PRSSDP")
	private int prssDp;
	
	@Column(name = "PRSCLA")
	private int prsCla;
	
	@Column(name = "PRSVND")
	private int prsVnd;
	
	@Column(name = "prstip")
	private String prstip;
	
	
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }



	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}



	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}



	/**
	 * @return the inumbr
	 */
	public int getInumbr() {
		return inumbr;
	}



	/**
	 * @param inumbr the inumbr to set
	 */
	public void setInumbr(int inumbr) {
		this.inumbr = inumbr;
	}



	/**
	 * @return the prsDep
	 */
	public int getPrsDep() {
		return prsDep;
	}



	/**
	 * @param prsDep the prsDep to set
	 */
	public void setPrsDep(int prsDep) {
		this.prsDep = prsDep;
	}



	/**
	 * @return the prssDp
	 */
	public float getPrssDp() {
		return prssDp;
	}



	/**
	 * @param prssDp the prssDp to set
	 */
	public void setPrssDp(int prssDp) {
		this.prssDp = prssDp;
	}



	/**
	 * @return the prsCla
	 */
	public int getPrsCla() {
		return prsCla;
	}



	/**
	 * @param prsCla the prsCla to set
	 */
	public void setPrsCla(int prsCla) {
		this.prsCla = prsCla;
	}



	/**
	 * @return the prsVnd
	 */
	public int getPrsVnd() {
		return prsVnd;
	}



	/**
	 * @param prsVnd the prsVnd to set
	 */
	public void setPrsVnd(int prsVnd) {
		this.prsVnd = prsVnd;
	}



	/**
	 * @return the prstip
	 */
	public String getPrstip() {
		return prstip;
	}



	/**
	 * @param prstip the prstip to set
	 */
	public void setPrstip(String prstip) {
		this.prstip = prstip;
	}


	
}
