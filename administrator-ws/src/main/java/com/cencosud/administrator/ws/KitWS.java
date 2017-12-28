/**
 * 
 */
package com.cencosud.administrator.ws;

import javax.jws.WebService;

import org.springframework.web.bind.annotation.RequestParam;

import com.cencosud.administrator.dto.ws.UrlNotificationParams;
import com.cencosud.administrator.dto.ws.UrlNotificationResult;

/**
 * @author EA7129
 *
 */

@WebService
public interface KitWS {
	public UrlNotificationResult getUrlNotification(
			@RequestParam UrlNotificationParams params);

}
