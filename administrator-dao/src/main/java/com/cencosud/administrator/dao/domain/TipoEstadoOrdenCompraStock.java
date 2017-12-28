/**
 *@name TipoEstadoVentaEnVerde.java
 * 
 *@version 1.0 
 * 
 *@date 24-04-2017
 * 
 *@author ea7129
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
 * @description 
 */

@Entity
@Table(name = "tipo_estado_oc_vtav_stock")
public class TipoEstadoOrdenCompraStock implements Serializable {
	
	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_TIPO_ESTADO_OC_VTAV")
	@SequenceGenerator(name = "SEQUENCE_TIPO_ESTADO_OC_VTAV", sequenceName = "SEQUENCE_TIPO_ESTADO_OC_VTAV", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;
	
	public TipoEstadoOrdenCompraStock(){}
	
	public TipoEstadoOrdenCompraStock(Long id){
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
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

}
