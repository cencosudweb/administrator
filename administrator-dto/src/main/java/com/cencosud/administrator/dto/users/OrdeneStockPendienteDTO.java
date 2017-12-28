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

public class OrdeneStockPendienteDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;

	private int orden;
	
	private String nroDeLinea;
	
	private String doDtlStatus;
	
	private String tipoOrden;
	
	private String pedido;
	
	private String sku;
	
	private String cantidadPendiente;
	
	private String bodega;
	
	private String fechaCreacion;
	
	private String statCode;
	
	private int estado;
	
	private String distroNbr;

	private String poNbr;
	
	private String sizeDesc;
	
	private String shpdQty;
	
	private int tcOrdeId;
	
	private int cantidadDespachada;
	
	private int cantidadOrdenada;
	
	private int ordeId;
	
	private int ordeLineId;
	
	private String equalsQhpdDespacha;
	
	public OrdeneStockPendienteDTO(){}
	
	public OrdeneStockPendienteDTO(Long id){
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
	 * @return the orden
	 */
	public int getOrden() {
		return orden;
	}

	/**
	 * @param orden the orden to set
	 */
	public void setOrden(int orden) {
		this.orden = orden;
	}

	/**
	 * @return the nroDeLinea
	 */
	public String getNroDeLinea() {
		return nroDeLinea;
	}

	/**
	 * @param nroDeLinea the nroDeLinea to set
	 */
	public void setNroDeLinea(String nroDeLinea) {
		this.nroDeLinea = nroDeLinea;
	}

	/**
	 * @return the doDtlStatus
	 */
	public String getDoDtlStatus() {
		return doDtlStatus;
	}

	/**
	 * @param doDtlStatus the doDtlStatus to set
	 */
	public void setDoDtlStatus(String doDtlStatus) {
		this.doDtlStatus = doDtlStatus;
	}

	/**
	 * @return the tipoOrden
	 */
	public String getTipoOrden() {
		return tipoOrden;
	}

	/**
	 * @param tipoOrden the tipoOrden to set
	 */
	public void setTipoOrden(String tipoOrden) {
		this.tipoOrden = tipoOrden;
	}

	/**
	 * @return the pedido
	 */
	public String getPedido() {
		return pedido;
	}

	/**
	 * @param pedido the pedido to set
	 */
	public void setPedido(String pedido) {
		this.pedido = pedido;
	}

	/**
	 * @return the cantidadPendiente
	 */
	public String getCantidadPendiente() {
		return cantidadPendiente;
	}

	/**
	 * @param cantidadPendiente the cantidadPendiente to set
	 */
	public void setCantidadPendiente(String cantidadPendiente) {
		this.cantidadPendiente = cantidadPendiente;
	}

	/**
	 * @return the bodega
	 */
	public String getBodega() {
		return bodega;
	}

	/**
	 * @param bodega the bodega to set
	 */
	public void setBodega(String bodega) {
		this.bodega = bodega;
	}

	/**
	 * @return the fechaCreacion
	 */
	public String getFechaCreacion() {
		return fechaCreacion;
	}

	/**
	 * @param fechaCreacion the fechaCreacion to set
	 */
	public void setFechaCreacion(String fechaCreacion) {
		this.fechaCreacion = fechaCreacion;
	}

	/**
	 * @return the statCode
	 */
	public String getStatCode() {
		return statCode;
	}

	/**
	 * @param statCode the statCode to set
	 */
	public void setStatCode(String statCode) {
		this.statCode = statCode;
	}

	/**
	 * @return the estado
	 */
	public int getEstado() {
		return estado;
	}

	/**
	 * @param estado the estado to set
	 */
	public void setEstado(int estado) {
		this.estado = estado;
	}

	/**
	 * @return the distroNbr
	 */
	public String getDistroNbr() {
		return distroNbr;
	}

	/**
	 * @param distroNbr the distroNbr to set
	 */
	public void setDistroNbr(String distroNbr) {
		this.distroNbr = distroNbr;
	}

	/**
	 * @return the poNbr
	 */
	public String getPoNbr() {
		return poNbr;
	}

	/**
	 * @param poNbr the poNbr to set
	 */
	public void setPoNbr(String poNbr) {
		this.poNbr = poNbr;
	}

	/**
	 * @return the sizeDesc
	 */
	public String getSizeDesc() {
		return sizeDesc;
	}

	/**
	 * @param sizeDesc the sizeDesc to set
	 */
	public void setSizeDesc(String sizeDesc) {
		this.sizeDesc = sizeDesc;
	}

	/**
	 * @return the shpdQty
	 */
	public String getShpdQty() {
		return shpdQty;
	}

	/**
	 * @param shpdQty the shpdQty to set
	 */
	public void setShpdQty(String shpdQty) {
		this.shpdQty = shpdQty;
	}

	/**
	 * @return the tcOrdeId
	 */
	public int getTcOrdeId() {
		return tcOrdeId;
	}

	/**
	 * @param tcOrdeId the tcOrdeId to set
	 */
	public void setTcOrdeId(int tcOrdeId) {
		this.tcOrdeId = tcOrdeId;
	}

	/**
	 * @return the cantidadDespachada
	 */
	public int getCantidadDespachada() {
		return cantidadDespachada;
	}

	/**
	 * @param cantidadDespachada the cantidadDespachada to set
	 */
	public void setCantidadDespachada(int cantidadDespachada) {
		this.cantidadDespachada = cantidadDespachada;
	}

	/**
	 * @return the cantidadOrdenada
	 */
	public int getCantidadOrdenada() {
		return cantidadOrdenada;
	}

	/**
	 * @param cantidadOrdenada the cantidadOrdenada to set
	 */
	public void setCantidadOrdenada(int cantidadOrdenada) {
		this.cantidadOrdenada = cantidadOrdenada;
	}

	/**
	 * @return the ordeId
	 */
	public int getOrdeId() {
		return ordeId;
	}

	/**
	 * @param ordeId the ordeId to set
	 */
	public void setOrdeId(int ordeId) {
		this.ordeId = ordeId;
	}

	/**
	 * @return the ordeLineId
	 */
	public int getOrdeLineId() {
		return ordeLineId;
	}

	/**
	 * @param ordeLineId the ordeLineId to set
	 */
	public void setOrdeLineId(int ordeLineId) {
		this.ordeLineId = ordeLineId;
	}

	/**
	 * @return the sku
	 */
	public String getSku() {
		return sku;
	}

	/**
	 * @param sku the sku to set
	 */
	public void setSku(String sku) {
		this.sku = sku;
	}

	/**
	 * @return the equalsQhpdDespacha
	 */
	public String getEqualsQhpdDespacha() {
		return equalsQhpdDespacha;
	}

	/**
	 * @param equalsQhpdDespacha the equalsQhpdDespacha to set
	 */
	public void setEqualsQhpdDespacha(String equalsQhpdDespacha) {
		this.equalsQhpdDespacha = equalsQhpdDespacha;
	}

	


	
}
