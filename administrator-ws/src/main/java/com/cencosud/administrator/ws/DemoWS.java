/**
 * 
 */
package com.cencosud.administrator.ws;

import javax.jws.WebService;

import org.springframework.web.bind.annotation.RequestParam;

import com.cencosud.administrator.dto.ws.DemoParams;
import com.cencosud.administrator.dto.ws.DemoResult;

/**
 * @author EA7129
 *
 */

@WebService
public interface DemoWS {
	
	public DemoResult demo(@RequestParam DemoParams params);

}
