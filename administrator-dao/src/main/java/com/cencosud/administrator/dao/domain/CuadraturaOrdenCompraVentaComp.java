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
 *  @description Clase CuadraturaOrdenCompraVentaComp
 *
 */

@Entity
@Table(name = "cuadratura_oc_vtav_comp")
public class CuadraturaOrdenCompraVentaComp implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_C_OC_VTAV_COMP")
	@SequenceGenerator(name = "SEQUENCE_C_OC_VTAV_COMP", sequenceName = "SEQUENCE_C_OC_VTAV_COMP", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "RELNUM")
	private float relnum;
	
	@Column(name = "POMUMB")
	private float pomumb;
	
	@Column(name = "INUMBR")
	private float inmbr;
	
	@Column(name = "RELBL5")
	private int relbl5;
	
	@Column(name = "CANTIDAD_COMP1")
	private int cantidadComp1;
	
	@Column(name = "CANTIDAD_COMP2")
	private int cantidadComp2;
	
	@Column(name = "FECHA_INGRESO")
	private String fechaIngreso;
	
	public CuadraturaOrdenCompraVentaComp(){}
	
	public CuadraturaOrdenCompraVentaComp(Long id){
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
