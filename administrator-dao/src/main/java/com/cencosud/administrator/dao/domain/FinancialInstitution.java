/**
 *@name FinancialInstitution.java
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
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ElementCollection;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.MapKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/**
 * 
 * @description Clase FinancialInstitution
 *
 */

@Entity
@Table(name = "financial_institution")
public class FinancialInstitution implements Serializable {


	private static final long serialVersionUID = 5309506559937216694L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_FINANCIAL_INSTITUTION")
	@SequenceGenerator(name = "SEQUENCE_FINANCIAL_INSTITUTION", sequenceName = "SEQUENCE_FINANCIAL_INSTITUTION", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "rut")
	private String rut;
	
	@Column(name = "razon_social")
	private String businessLine;
	
	@Column(name = "status")
	private int status;

	@Column(name = "mnemotecnico")
	private String mnemonic;
	
	@Column(name = "fecha_activacion")
	private long activationDate;
	
	@Column(name = "invocation_path")
	private String invocationPath;
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "users_financial_institution", joinColumns = { @JoinColumn(name = "id_financial_institution") }, inverseJoinColumns = { @JoinColumn(name = "id_user") })
	private Set<User> users = new HashSet<User>(0);
	
	@JoinTable(name = "commerce_agreement_fi", joinColumns = @JoinColumn(name = "financial_institution_id"), inverseJoinColumns = @JoinColumn(name = "commerce_id"))
	@MapKeyJoinColumn(name = "agreement_id")
	@ElementCollection
	private Map<Agreement, Commerce> commerces = new HashMap<Agreement, Commerce>();
	

//	@Override
//    public String toString() {
//        return ToStringBuilder.reflectionToString(this);
//    }

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

	public void setCommerces(Map<Agreement, Commerce> commerces) {
		this.commerces = commerces;
	}

	public Map<Agreement, Commerce> getCommerces() {
		return commerces;
	}

	public void setInvocationPath(String invocationPath) {
		this.invocationPath = invocationPath;
	}

	public String getInvocationPath() {
		return invocationPath;
	}
}
