/**
 *@name EconomicActivity.java
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
 * @description Clase EconomicActivity
 * 
 */

@Entity
@Table(name = "economic_activity")
public class EconomicActivity implements Serializable {


	private static final long serialVersionUID = -6474098843701632456L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_ECONOMIC_ACTIVITY")
	@SequenceGenerator(name = "SEQUENCE_ECONOMIC_ACTIVITY", sequenceName = "SEQUENCE_ECONOMIC_ACTIVITY", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "nombre")
	private String name;

	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}


	
}
