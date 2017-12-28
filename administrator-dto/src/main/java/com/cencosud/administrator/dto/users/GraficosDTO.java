/**
 *@name GraficosDTO.java
 * 
 *@version 1.0 
 * 
 *@date 15-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

/**
 * @description 
 */ 
public class GraficosDTO implements Serializable{
	
	private static final long serialVersionUID = -262289197062914696L;

	private Long id;
	private String fechaCompromiso;
	private int cantidad;
	private float porcentaje;
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
	 * @return the fechaCompromiso
	 */
	public String getFechaCompromiso() {
		return fechaCompromiso;
	}
	/**
	 * @param fechaCompromiso the fechaCompromiso to set
	 */
	public void setFechaCompromiso(String fechaCompromiso) {
		this.fechaCompromiso = fechaCompromiso;
	}
	/**
	 * @return the cantidad
	 */
	public int getCantidad() {
		return cantidad;
	}
	/**
	 * @param cantidad the cantidad to set
	 */
	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}
	/**
	 * @return the porcentaje
	 */
	public float getPorcentaje() {
		return porcentaje;
	}
	/**
	 * @param porcentaje the porcentaje to set
	 */
	public void setPorcentaje(float porcentaje) {
		this.porcentaje = porcentaje;
	}

}
