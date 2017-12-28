/**
 *@name DemoParams.java
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
 * @description 
 */
public class DemoParams implements Serializable {
	
	private static final long serialVersionUID = -6948904914149652973L;
	private String param1;
	private Long param2;
	
	public String getParam1() {
		return param1;
	}
	public void setParam1(String param1) {
		this.param1 = param1;
	}
	public Long getParam2() {
		return param2;
	}
	public void setParam2(Long param2) {
		this.param2 = param2;
	}
}
