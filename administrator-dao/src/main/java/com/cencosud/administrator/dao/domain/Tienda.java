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
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 
 *  @description Clase Channel
 *
 */

@Entity
@Table(name = "tiendas")
public class Tienda implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_TIENDAS")
	@SequenceGenerator(name = "SEQUENCE_TIENDAS", sequenceName = "SEQUENCE_TIENDAS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;
	
	@OneToOne
	@JoinColumn(name="id_flag")
	@NotFound(action = NotFoundAction.IGNORE)
	private Flag flag;
	
	public Tienda(){}
	
	public Tienda(Long id){
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

	/**
	 * @return the flag
	 */
	public Flag getFlag() {
		return flag;
	}

	/**
	 * @param flag the flag to set
	 */
	public void setFlag(Flag flag) {
		this.flag = flag;
	}


	
}
