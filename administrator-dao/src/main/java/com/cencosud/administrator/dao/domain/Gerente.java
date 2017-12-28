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
@Table(name = "gerentes")
public class Gerente implements Serializable {

	private static final long serialVersionUID = 5468480017252581493L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_GERENTES")
	@SequenceGenerator(name = "SEQUENCE_GERENTES", sequenceName = "SEQUENCE_GERENTES", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "description")
	private String description;
	
	@OneToOne
	@JoinColumn(name="id_padrino")
	@NotFound(action = NotFoundAction.IGNORE)
	private Padrino padrino;
	
	public Gerente(){}
	
	public Gerente(Long id){
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
	 * @return the padrino
	 */
	public Padrino getPadrino() {
		return padrino;
	}

	/**
	 * @param padrino the padrino to set
	 */
	public void setPadrino(Padrino padrino) {
		this.padrino = padrino;
	}


	
}
