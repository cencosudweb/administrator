/**
 *@name Channel.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author Jose
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
 *  @description 
 *
 */

@Entity
@Table(name = "contratantes")
public class Contratante implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_CONTRATANTES")
	@SequenceGenerator(name = "SEQUENCE_CONTRATANTES", sequenceName = "SEQUENCE_CONTRATANTES", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;
	
	@OneToOne
	@JoinColumn(name="id_gerente")
	@NotFound(action = NotFoundAction.IGNORE)
	private Gerente gerente;
	
	public Contratante(){}
	
	public Contratante(Long id){
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
	 * @return the gerente
	 */
	public Gerente getGerente() {
		return gerente;
	}

	/**
	 * @param gerente the gerente to set
	 */
	public void setGerente(Gerente gerente) {
		this.gerente = gerente;
	}


	
}
