/**
 *@name ChannelDTO.java
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
 * @description Clase ChannelDTO para la transferencia de datos
 */

public class CumplimientoEstaticoWsDTO implements Serializable {
	
	private static final long serialVersionUID = 3657265432071279059L;

	private Long id;

	private String descriptionCumple;
	
	private int cantidadCumple;
	
	private float porcentajeCumple;
	
	private String descriptionAtrasado;
	
	private int cantidadAtrasado;
	
	private float porcentajeAtrasado;
	
	private String descriptionNoCumple;
	
	private int cantidadNoCumple;
	
	private float porcentajeNoCumple;
	
	private int cantidadTotal;
	
	private float porcentajeTotal;
	
	private String fechaCompromsoEom;
	
	public CumplimientoEstaticoWsDTO() {
	}
	
	public CumplimientoEstaticoWsDTO(Long id) {
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
	 * @return the descriptionCumple
	 */
	public String getDescriptionCumple() {
		return descriptionCumple;
	}

	/**
	 * @param descriptionCumple the descriptionCumple to set
	 */
	public void setDescriptionCumple(String descriptionCumple) {
		this.descriptionCumple = descriptionCumple;
	}

	/**
	 * @return the cantidadCumple
	 */
	public int getCantidadCumple() {
		return cantidadCumple;
	}

	/**
	 * @param cantidadCumple the cantidadCumple to set
	 */
	public void setCantidadCumple(int cantidadCumple) {
		this.cantidadCumple = cantidadCumple;
	}

	/**
	 * @return the porcentajeCumple
	 */
	public float getPorcentajeCumple() {
		return porcentajeCumple;
	}

	/**
	 * @param porcentajeCumple the porcentajeCumple to set
	 */
	public void setPorcentajeCumple(float porcentajeCumple) {
		this.porcentajeCumple = porcentajeCumple;
	}

	/**
	 * @return the descriptionAtrasado
	 */
	public String getDescriptionAtrasado() {
		return descriptionAtrasado;
	}

	/**
	 * @param descriptionAtrasado the descriptionAtrasado to set
	 */
	public void setDescriptionAtrasado(String descriptionAtrasado) {
		this.descriptionAtrasado = descriptionAtrasado;
	}

	/**
	 * @return the cantidadAtrasado
	 */
	public int getCantidadAtrasado() {
		return cantidadAtrasado;
	}

	/**
	 * @param cantidadAtrasado the cantidadAtrasado to set
	 */
	public void setCantidadAtrasado(int cantidadAtrasado) {
		this.cantidadAtrasado = cantidadAtrasado;
	}

	/**
	 * @return the porcentajeAtrasado
	 */
	public float getPorcentajeAtrasado() {
		return porcentajeAtrasado;
	}

	/**
	 * @param porcentajeAtrasado the porcentajeAtrasado to set
	 */
	public void setPorcentajeAtrasado(float porcentajeAtrasado) {
		this.porcentajeAtrasado = porcentajeAtrasado;
	}

	/**
	 * @return the descriptionNoCumple
	 */
	public String getDescriptionNoCumple() {
		return descriptionNoCumple;
	}

	/**
	 * @param descriptionNoCumple the descriptionNoCumple to set
	 */
	public void setDescriptionNoCumple(String descriptionNoCumple) {
		this.descriptionNoCumple = descriptionNoCumple;
	}

	/**
	 * @return the cantidadNoCumple
	 */
	public int getCantidadNoCumple() {
		return cantidadNoCumple;
	}

	/**
	 * @param cantidadNoCumple the cantidadNoCumple to set
	 */
	public void setCantidadNoCumple(int cantidadNoCumple) {
		this.cantidadNoCumple = cantidadNoCumple;
	}

	/**
	 * @return the porcentajeNoCumple
	 */
	public float getPorcentajeNoCumple() {
		return porcentajeNoCumple;
	}

	/**
	 * @param porcentajeNoCumple the porcentajeNoCumple to set
	 */
	public void setPorcentajeNoCumple(float porcentajeNoCumple) {
		this.porcentajeNoCumple = porcentajeNoCumple;
	}

	/**
	 * @return the cantidadTotal
	 */
	public int getCantidadTotal() {
		return cantidadTotal;
	}

	/**
	 * @param cantidadTotal the cantidadTotal to set
	 */
	public void setCantidadTotal(int cantidadTotal) {
		this.cantidadTotal = cantidadTotal;
	}

	/**
	 * @return the porcentajeTotal
	 */
	public float getPorcentajeTotal() {
		return porcentajeTotal;
	}

	/**
	 * @param porcentajeTotal the porcentajeTotal to set
	 */
	public void setPorcentajeTotal(float porcentajeTotal) {
		this.porcentajeTotal = porcentajeTotal;
	}

	/**
	 * @return the fechaCompromsoEom
	 */
	public String getFechaCompromsoEom() {
		return fechaCompromsoEom;
	}

	/**
	 * @param fechaCompromsoEom the fechaCompromsoEom to set
	 */
	public void setFechaCompromsoEom(String fechaCompromsoEom) {
		this.fechaCompromsoEom = fechaCompromsoEom;
	}

	

	
	
}
