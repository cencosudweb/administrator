/**
 * 
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author EA7129
 *
 */


public class SkuServicioWsDTO implements Serializable {
	
	
private static final long serialVersionUID = 5468480017252581493L;
	
	private Long id;

	private int inumbr;
	
	private int prsDep;
	
	private int prssDp;
	
	private int prsCla;
	
	private int prsVnd;
	
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
	public int getPrssDp() {
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
