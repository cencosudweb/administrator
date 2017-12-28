/**
 * 
 */
package com.cencosud.administrator.ws.impl;


import org.springframework.beans.factory.annotation.Autowired;

import com.cencosud.administrator.core.KitServices;
import com.cencosud.administrator.dto.ws.UrlNotificationParams;
import com.cencosud.administrator.dto.ws.UrlNotificationResult;
import com.cencosud.administrator.ws.KitWS;

/**
 * @author EA7129
 *
 */
public class KitWSImpl implements KitWS {
	
	@Autowired
	private KitServices services;

	@Override
	public UrlNotificationResult getUrlNotification(UrlNotificationParams params) {
		// TODO Auto-generated method stub
		return services.getUrlNotificacion(params);
	}

}
