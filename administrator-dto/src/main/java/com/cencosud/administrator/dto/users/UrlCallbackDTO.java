
/**
 *@name UrlCallbackDTO.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase UrlCallbackDTO para la transferencia de datos
 */

public class UrlCallbackDTO implements Serializable {

	private static final long serialVersionUID = 7540931975357880869L;

	private Long id;
	private Long agreementId;
	private String endPath;
	private String confirmationPath;
	private ChannelDTO channel;
	private String confirmationMethod;
	private String confirmationOutput;

	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public Long getAgreementId() {
		return agreementId;
	}

	public ChannelDTO getChannel() {
		return channel;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setAgreementId(Long agreementId) {
		this.agreementId = agreementId;
	}


	public void setChannel(ChannelDTO channel) {
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
