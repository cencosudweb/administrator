/**
 *@name DemoResult.java
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

import com.cencosud.administrator.dto.ws.base.BaseResult;


/**
 * @description 
 */
@XmlRootElement(name="url")
public class DemoResult extends BaseResult implements Serializable {
	
	private static final long serialVersionUID = 8359149909752099390L;
	
	private String param1;

	public void setParam1(String param1) {
		this.param1 = param1;
	}

	public String getParam1() {
		return param1;
	}
	
}
