/**
 *@name UrlCallback.java
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

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @description Clase UrlCallback
 * 
 */
@Entity
@Table(name = "urls_callback")
public class UrlCallback implements Serializable {

	private static final long serialVersionUID = -603893407617448283L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_URLS_CALLBACK")
	@SequenceGenerator(name = "SEQUENCE_URLS_CALLBACK", sequenceName = "SEQUENCE_URLS_CALLBACK", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "id_agreement")
	private Long agreementId;
	
	@Column(name = "end_path")
	private String endPath;
	
	@Column(name = "confirmation_method")
	private String confirmationMethod;
	
	@Column(name = "confirmation_output")
	private String confirmationOutput;
	
	@Column(name = "confirmation_path")
	private String confirmationPath;

	@OneToOne(cascade = CascadeType.DETACH, fetch = FetchType.LAZY)
	@JoinColumn(name = "id_channel")
	private Channel channel;
	
	public UrlCallback(){}
	
	public UrlCallback(Long id){
		this.id = id;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getAgreementId() {
		return agreementId;
	}

	public Channel getChannel() {
		return channel;
	}

	public void setAgreementId(Long agreementId) {
		this.agreementId = agreementId;
	}

	public void setChannel(Channel channel) {
		this.channel = channel;
	}

	public String getEndPath() {
		return endPath;
	}

	public String getConfirmationPath() {
		return confirmationPath;
	}

	public void setEndPath(String endPath) {
		this.endPath = endPath;
	}

	public void setConfirmationPath(String confirmationPath) {
		this.confirmationPath = confirmationPath;
	}

	public String getConfirmationMethod() {
		return confirmationMethod;
	}

	public void setConfirmationMethod(String confirmationMethod) {
		this.confirmationMethod = confirmationMethod;
	}

	public String getConfirmationOutput() {
		return confirmationOutput;
	}

	public void setConfirmationOutput(String confirmationOutput) {
		this.confirmationOutput = confirmationOutput;
	}

}
