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

public class CuadraturaOrdenCompraVentaCompDTO implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	private Long id;
	private float relnum;
	private float pomumb;
	private float inmbr;
	private int relbl5;
	private int cantidadComp1;
	private int cantidadComp2;
	private String fechaIngreso;
	
	public CuadraturaOrdenCompraVentaCompDTO(){}
	
	public CuadraturaOrdenCompraVentaCompDTO(Long id){
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
	 * @return the relnum
	 */
	public float getRelnum() {
		return relnum;
	}

	/**
	 * @param relnum the relnum to set
	 */
	public void setRelnum(float relnum) {
		this.relnum = relnum;
	}

	/**
	 * @return the pomumb
	 */
	public float getPomumb() {
		return pomumb;
	}

	/**
	 * @param pomumb the pomumb to set
	 */
	public void setPomumb(float pomumb) {
		this.pomumb = pomumb;
	}

	/**
	 * @return the inmbr
	 */
	public float getInmbr() {
		return inmbr;
	}

	/**
	 * @param inmbr the inmbr to set
	 */
	public void setInmbr(float inmbr) {
		this.inmbr = inmbr;
	}

	/**
	 * @return the relbl5
	 */
	public int getRelbl5() {
		return relbl5;
	}

	/**
	 * @param relbl5 the relbl5 to set
	 */
	public void setRelbl5(int relbl5) {
		this.relbl5 = relbl5;
	}

	/**
	 * @return the cantidadComp1
	 */
	public int getCantidadComp1() {
		return cantidadComp1;
	}

	/**
	 * @param cantidadComp1 the cantidadComp1 to set
	 */
	public void setCantidadComp1(int cantidadComp1) {
		this.cantidadComp1 = cantidadComp1;
	}

	/**
	 * @return the cantidadComp2
	 */
	public int getCantidadComp2() {
		return cantidadComp2;
	}

	/**
	 * @param cantidadComp2 the cantidadComp2 to set
	 */
	public void setCantidadComp2(int cantidadComp2) {
		this.cantidadComp2 = cantidadComp2;
	}

	/**
	 * @return the fechaIngreso
	 */
	public String getFechaIngreso() {
		return fechaIngreso;
	}

	/**
	 * @param fechaIngreso the fechaIngreso to set
	 */
	public void setFechaIngreso(String fechaIngreso) {
		this.fechaIngreso = fechaIngreso;
	}

	



	
}
