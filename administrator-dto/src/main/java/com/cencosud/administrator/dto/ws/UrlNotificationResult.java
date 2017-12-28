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

import javax.xml.bind.annotation.XmlRootElement;

import com.cencosud.administrator.dto.users.UrlCallbackDTO;
import com.cencosud.administrator.dto.ws.base.BaseResult;


/**
 * @description Clase UrlNotificationParams
 */
@XmlRootElement(name="url")
public class UrlNotificationResult extends BaseResult implements Serializable {
	
	private static final long serialVersionUID = -7961516203863986437L;
	private UrlCallbackDTO urlCallback;
	
	public void setUrlCallback(UrlCallbackDTO urlCallback) {
		this.urlCallback = urlCallback;
	}
	public UrlCallbackDTO getUrlCallback() {
		return urlCallback;
	}
	
}
