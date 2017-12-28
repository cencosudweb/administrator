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
@Table(name = "cumplimiento_estatico_ws")
public class CumplimientoEstaticoWs implements Serializable {
	
	
private static final long serialVersionUID = 5468480017252581493L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CUMPLIMIENTO_ES_WS")
	@SequenceGenerator(name = "SEQUENCE_CUMPLIMIENTO_ES_WS", sequenceName = "SEQUENCE_CUMPLIMIENTO_ES_WS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	
	@Column(name = "description_cumple")
	private String descriptionCumple;
	
	@Column(name = "cantidad_cumple")
	private int cantidadCumple;
	
	@Column(name = "porcentaje_cumple")
	private float porcentajeCumple;
	
	@Column(name = "description_atrasado")
	private String descriptionAtrasado;
	
	@Column(name = "cantidad_atrasado")
	private int cantidadAtrasado;
	
	@Column(name = "porcentaje_atrasado")
	private float porcentajeAtrasado;
	
	@Column(name = "description_no_cumple")
	private String descriptionNoCumple;
	
	@Column(name = "cantidad_no_cumple")
	private int cantidadNoCumple;
	
	@Column(name = "porcentaje_no_cumple")
	private float porcentajeNoCumple;
	
	@Column(name = "cantidad_total")
	private int cantidadTotal;
	
	@Column(name = "porcentaje_total")
	private float porcentajeTotal;
	
	@Column(name = "fecha_compromiso_eom")
	private String fechaCompromsoEom;
	
	
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
