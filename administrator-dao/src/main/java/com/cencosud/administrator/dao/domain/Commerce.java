/**
 *@name Commerce.java
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
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

/**
 * 
 * @description Clase Commerce
 * 
 */

@Entity
@Table(name = "commerce")
public class Commerce implements Serializable {

	private static final long serialVersionUID = 1236331746599154183L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_COMMERCE")
	@SequenceGenerator(name = "SEQUENCE_COMMERCE", sequenceName = "SEQUENCE_COMMERCE", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "rut", unique = true)
	private String rut;
	
	@Column(name = "razon_social")
	private String businessLine;

	@Column(name = "mnemotecnico")
	private String mnemonic;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "fecha_activacion")
	private long activationDate;
	
	@OneToOne
	@JoinColumn(name="id_actividad_economica")
	@NotFound(action = NotFoundAction.IGNORE)
	private EconomicActivity economicAcivity;
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "users_commerce", joinColumns = { @JoinColumn(name = "id_commerce") }, inverseJoinColumns = { @JoinColumn(name = "id_user") })
	private Set<User> users = new HashSet<User>(0);
	

	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public String getRut() {
		return rut;
	}

	public String getBusinessLine() {
		return businessLine;
	}

	public String getMnemonic() {
		return mnemonic;
	}

	public long getActivationDate() {
		return activationDate;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public void setBusinessLine(String businessLine) {
		this.businessLine = businessLine;
	}

	public void setMnemonic(String mnemonic) {
		this.mnemonic = mnemonic;
	}

	public void setActivationDate(long activationDate) {
		this.activationDate = activationDate;
	}

	public void setEconomicAcivity(EconomicActivity economicAcivity) {
		this.economicAcivity = economicAcivity;
	}

	public EconomicActivity getEconomicAcivity() {
		return economicAcivity;
	}

	public void setUsers(Set<User> users) {
		this.users = users;
	}

	public Set<User> getUsers() {
		return users;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

	
}
