/**
 *@name UrlNotificationParams.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.ws;

import java.io.Serializable;

/**
 * @description Clase UrlNotificationParams
 */
public class UrlNotificationParams implements Serializable {

	private static final long serialVersionUID = 3559494583253527199L;
	
	private Long idAgreement;
	private Long channel;
	
	public Long getIdAgreement() {
		return idAgreement;
	}
	public void setIdAgreement(Long idAgreement) {
		this.idAgreement = idAgreement;
	}
	public Long getChannel() {
		return channel;
	}
	public void setChannel(Long channel) {
		this.channel = channel;
	}
}
