/**
 *@name Agreement.java
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
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @description Clase Agreement
 *
 */

@Entity
@Table(name = "agreement")
public class Agreement implements Serializable {


	private static final long serialVersionUID = -1758812898143120768L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_AGREEMENT")
	@SequenceGenerator(name = "SEQUENCE_AGREEMENT", sequenceName = "SEQUENCE_AGREEMENT", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(name = "numero_convenio")
	private String agreementId;
	
	@Column(name = "fecha_inicio")
	private long initDate;

	@Column(name = "fecha_fin")
	private long endDate;
	
	@Column(name = "status")
	private int status;
	
	@Column(name = "commerce_id")
	private Long commerceId;
	
	@OneToOne(cascade = CascadeType.DETACH, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_time_limit")
	private TimeLimit timeLimit;
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, orphanRemoval=true)
	@JoinColumn(name = "id_agreement")
	private Set<UrlCallback> urls = new HashSet<UrlCallback>(0);
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}


	public String getAgreementId() {
		return agreementId;
	}


	public long getInitDate() {
		return initDate;
	}


	public long getEndDate() {
		return endDate;
	}


	public TimeLimit getTimeLimit() {
		return timeLimit;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public void setAgreementId(String agreementId) {
		this.agreementId = agreementId;
	}

	public void setInitDate(long initDate) {
		this.initDate = initDate;
	}


	public void setEndDate(long endDate) {
		this.endDate = endDate;
	}


	public void setTimeLimit(TimeLimit timeLimit) {
		this.timeLimit = timeLimit;
	}


	public void setUrls(Set<UrlCallback> urls) {
		this.urls = urls;
	}


	public Set<UrlCallback> getUrls() {
		return urls;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public int getStatus() {
		return status;
	}


	public void setCommerceId(Long commerceId) {
		this.commerceId = commerceId;
	}


	public Long getCommerceId() {
		return commerceId;
	}
	
	public void addUrls(Set<UrlCallback> urls){
		this.urls.clear();
	    this.urls.addAll(urls);
	}
	
}
