/**
 *@name Role.java
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
 * @description Clase Role
 * 
 */

@Entity
@Table(name = "authorities")
public class Role implements Serializable {

	private static final long serialVersionUID = -8974256591763579884L;

	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_AUTHORITIES")
	@SequenceGenerator(name = "SEQUENCE_AUTHORITIES", sequenceName = "SEQUENCE_AUTHORITIES", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "authority")
	private String role;
	
	@Column(name = "description")
	private String description;

	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDescription() {
		return description;
	}
	
}
