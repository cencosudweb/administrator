/**
 *@name Channel.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */

package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 *  @description Clase Channel
 *
 */

public class CuadraturaJpdTotDadDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;
	
	private String fecha;
	
	private int loloca;
	
	private String lonivi;
	
	private int numeroSd;
	
	private int odEom;
	
	private int numCorrDup;
	
	private int sku;
	
	private int totarTTsl;
	
	private int deparTtsl;
	
	private int canarTtsl;
	
	private int marDesTsl;
	
	private int numTerTsql;
	
	private int numTraTsl;
	
	public CuadraturaJpdTotDadDTO(){}
	
	public CuadraturaJpdTotDadDTO(Long id){
		this.id = id;
	}
	
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
	 * @return the fecha
	 */
	public String getFecha() {
		return fecha;
	}

	/**
	 * @param fecha the fecha to set
	 */
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	/**
	 * @return the loloca
	 */
	public int getLoloca() {
		return loloca;
	}

	/**
	 * @param loloca the loloca to set
	 */
	public void setLoloca(int loloca) {
		this.loloca = loloca;
	}

	/**
	 * @return the lonivi
	 */
	public String getLonivi() {
		return lonivi;
	}

	/**
	 * @param lonivi the lonivi to set
	 */
	public void setLonivi(String lonivi) {
		this.lonivi = lonivi;
	}

	/**
	 * @return the numeroSd
	 */
	public int getNumeroSd() {
		return numeroSd;
	}

	/**
	 * @param numeroSd the numeroSd to set
	 */
	public void setNumeroSd(int numeroSd) {
		this.numeroSd = numeroSd;
	}

	/**
	 * @return the odEom
	 */
	public int getOdEom() {
		return odEom;
	}

	/**
	 * @param odEom the odEom to set
	 */
	public void setOdEom(int odEom) {
		this.odEom = odEom;
	}

	/**
	 * @return the numCorrDup
	 */
	public int getNumCorrDup() {
		return numCorrDup;
	}

	/**
	 * @param numCorrDup the numCorrDup to set
	 */
	public void setNumCorrDup(int numCorrDup) {
		this.numCorrDup = numCorrDup;
	}

	/**
	 * @return the sku
	 */
	public int getSku() {
		return sku;
	}

	/**
	 * @param sku the sku to set
	 */
	public void setSku(int sku) {
		this.sku = sku;
	}

	/**
	 * @return the totarTTsl
	 */
	public int getTotarTTsl() {
		return totarTTsl;
	}

	/**
	 * @param totarTTsl the totarTTsl to set
	 */
	public void setTotarTTsl(int totarTTsl) {
		this.totarTTsl = totarTTsl;
	}

	/**
	 * @return the deparTtsl
	 */
	public int getDeparTtsl() {
		return deparTtsl;
	}

	/**
	 * @param deparTtsl the deparTtsl to set
	 */
	public void setDeparTtsl(int deparTtsl) {
		this.deparTtsl = deparTtsl;
	}

	/**
	 * @return the canarTtsl
	 */
	public int getCanarTtsl() {
		return canarTtsl;
	}

	/**
	 * @param canarTtsl the canarTtsl to set
	 */
	public void setCanarTtsl(int canarTtsl) {
		this.canarTtsl = canarTtsl;
	}

	/**
	 * @return the marDesTsl
	 */
	public int getMarDesTsl() {
		return marDesTsl;
	}

	/**
	 * @param marDesTsl the marDesTsl to set
	 */
	public void setMarDesTsl(int marDesTsl) {
		this.marDesTsl = marDesTsl;
	}

	/**
	 * @return the numTerTsql
	 */
	public int getNumTerTsql() {
		return numTerTsql;
	}

	/**
	 * @param numTerTsql the numTerTsql to set
	 */
	public void setNumTerTsql(int numTerTsql) {
		this.numTerTsql = numTerTsql;
	}

	/**
	 * @return the numTraTsl
	 */
	public int getNumTraTsl() {
		return numTraTsl;
	}

	/**
	 * @param numTraTsl the numTraTsl to set
	 */
	public void setNumTraTsl(int numTraTsl) {
		this.numTraTsl = numTraTsl;
	}

	
	
}
