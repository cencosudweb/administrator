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
 * @author jose
 *
 */


@Entity
@Table(name = "estado_cumple_resumen")
public class EstadoCumpleResumen implements Serializable {
	
	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	// Oracle.
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "ESTADO_CUMPLE_RESUMEN")
	@SequenceGenerator(name = "ESTADO_CUMPLE_RESUMEN", sequenceName = "ESTADO_CUMPLE_RESUMEN", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;
	
	public EstadoCumpleResumen(){}
	
	public EstadoCumpleResumen(Long id){
		this.id = id;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


	public Long getId() {
		return id;
	}


	public String getDescription() {
		return description;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setDescription(String description) {
		this.description = description;
	}

}
