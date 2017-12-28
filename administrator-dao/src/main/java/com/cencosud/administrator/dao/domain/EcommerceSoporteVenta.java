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
 * 
 *  @description Clase EcommerceSoporteVenta
 *
 */

@Entity
@Table(name = "ecommerce_soporte_venta")
public class EcommerceSoporteVenta implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_ECOMMERCE_SVTA")
	@SequenceGenerator(name = "SEQUENCE_ECOMMERCE_SVTA", sequenceName = "SEQUENCE_ECOMMERCE_SVTA", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "NUMORDEN")
	private String numOrden;
	
	@Column(name = "CODIGO_DESPACHO")
	private int codDesp;
	
	@Column(name = "FECTRANTSL")
	private String fecTranTsql;
	
	@Column(name = "NUMCTLTSL")
	private int numCtlTsl;
	
	@Column(name = "NUMTERTSL")
	private int numTerTsl;
	
	@Column(name = "NUMTRANTSL")
	private int numTraTsql;
	
	@Column(name = "PXQ")
	private int pxq;
	
	@Column(name = "SKU")
	private int sku;
	
	@Column(name = "loloca")
	private int loloca;
	
	@Column(name = "ESTORDEN")
	private int estOrden;
	
	@Column(name = "TIPO_ESTADO_OC")
	private int tipoEstadoOc;
	
	@Column(name = "TIPVTA")
	private int tipVta;
	
	@Column(name = "TIPOPAG")
	private int tipoPag;
	
	@Column(name = "TIPO_ESTADO")
	private int tipoEstado;
	
	@Column(name = "TIPO_RELACION")
	private int tipoRelacion;
	
	public EcommerceSoporteVenta(){}
	
	public EcommerceSoporteVenta(Long id){
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
	public void setTipoEstadoOc(int tipoEstadoOc) {
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
