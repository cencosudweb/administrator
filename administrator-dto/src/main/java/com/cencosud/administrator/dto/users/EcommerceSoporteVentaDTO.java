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

public class EcommerceSoporteVentaDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;

	private String numOrden;
	
	private int codDesp;
	
	private String fecTranTsql;
	
	private int numCtlTsl;
	
	private int numTerTsl;
	
	private int numTraTsql;
	
	private int pxq;
	
	private int sku;
	
	private int loloca;
	
	private int estOrden;
	
	private int tipoEstadoOc;
	
	private int tipVta;
	
	private int tipoPag;
	
	private int tipoEstado;
	
	private int tipoRelacion;
	
	public EcommerceSoporteVentaDTO(){}
	
	public EcommerceSoporteVentaDTO(Long id){
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
	 * @return the numOrden
	 */
	public String getNumOrden() {
		return numOrden;
	}

	/**
	 * @param numOrden the numOrden to set
	 */
	public void setNumOrden(String numOrden) {
		this.numOrden = numOrden;
	}

	/**
	 * @return the codDesp
	 */
	public int getCodDesp() {
		return codDesp;
	}

	/**
	 * @param codDesp the codDesp to set
	 */
	public void setCodDesp(int codDesp) {
		this.codDesp = codDesp;
	}

	/**
	 * @return the fecTranTsql
	 */
	public String getFecTranTsql() {
		return fecTranTsql;
	}

	/**
	 * @param fecTranTsql the fecTranTsql to set
	 */
	public void setFecTranTsql(String fecTranTsql) {
		this.fecTranTsql = fecTranTsql;
	}

	/**
	 * @return the numCtlTsl
	 */
	public int getNumCtlTsl() {
		return numCtlTsl;
	}

	/**
	 * @param numCtlTsl the numCtlTsl to set
	 */
	public void setNumCtlTsl(int numCtlTsl) {
		this.numCtlTsl = numCtlTsl;
	}

	/**
	 * @return the numTerTsl
	 */
	public int getNumTerTsl() {
		return numTerTsl;
	}

	/**
	 * @param numTerTsl the numTerTsl to set
	 */
	public void setNumTerTsl(int numTerTsl) {
		this.numTerTsl = numTerTsl;
	}

	/**
	 * @return the numTraTsql
	 */
	public int getNumTraTsql() {
		return numTraTsql;
	}

	/**
	 * @param numTraTsql the numTraTsql to set
	 */
	public void setNumTraTsql(int numTraTsql) {
		this.numTraTsql = numTraTsql;
	}

	/**
	 * @return the pxq
	 */
	public int getPxq() {
		return pxq;
	}

	/**
	 * @param pxq the pxq to set
	 */
	public void setPxq(int pxq) {
		this.pxq = pxq;
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
	 * @return the canVend
	 */
	public int getLoloca() {
		return loloca;
	}

	/**
	 * @param canVend the canVend to set
	 */
	public void setLoloca(int loloca) {
		this.loloca = loloca;
	}

	/**
	 * @return the estOrden
	 */
	public int getEstOrden() {
		return estOrden;
	}

	/**
	 * @param estOrden the estOrden to set
	 */
	public void setEstOrden(int estOrden) {
		this.estOrden = estOrden;
	}

	/**
	 * @return the subEstoc
	 */
	public int getTipoEstadoOc() {
		return tipoEstadoOc;
	}

	/**
	 * @param subEstoc the subEstoc to set
	 */
	public void settTipoEstadoOc(int tipoEstadoOc) {
		this.tipoEstadoOc = tipoEstadoOc;
	}

	/**
	 * @return the tipVta
	 */
	public int getTipVta() {
		return tipVta;
	}

	/**
	 * @param tipVta the tipVta to set
	 */
	public void setTipVta(int tipVta) {
		this.tipVta = tipVta;
	}

	/**
	 * @return the tipoPag
	 */
	public int getTipoPag() {
		return tipoPag;
	}

	/**
	 * @param tipoPag the tipoPag to set
	 */
	public void setTipoPag(int tipoPag) {
		this.tipoPag = tipoPag;
	}

	/**
	 * @return the tipoEstado
	 */
	public int getTipoEstado() {
		return tipoEstado;
	}

	/**
	 * @param tipoEstado the tipoEstado to set
	 */
	public void setTipoEstado(int tipoEstado) {
		this.tipoEstado = tipoEstado;
	}

	/**
	 * @return the tipoRelacion
	 */
	public int getTipoRelacion() {
		return tipoRelacion;
	}

	/**
	 * @param tipoRelacion the tipoRelacion to set
	 */
	public void setTipoRelacion(int tipoRelacion) {
		this.tipoRelacion = tipoRelacion;
	}


	


	
}
