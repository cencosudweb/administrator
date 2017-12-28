/**
 *@name BaseResult.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.ws.base;

import java.io.Serializable;

/**
 * @description Clase BaseResult
 */
public class BaseResult implements Serializable {
	
	private static final long serialVersionUID = 264536383952755454L;
	private Integer codError = 0;
	private String msgError;
	private String token;
	private String rut;
	
	/**
	 * @return the codError
	 */
	public Integer getCodError() {
		return codError;
	}
	/**
	 * @param codError the codError to set
	 */
	public void setCodError(Integer codError) {
		this.codError = codError;
	}
	/**
	 * @return the msgError
	 */
	public String getMsgError() {
		return msgError;
	}
	/**
	 * @param msgError the msgError to set
	 */
	public void setMsgError(String msgError) {
		this.msgError = msgError;
	}
	/**
	 * @return the token
	 */
	public String getToken() {
		return token;
	}
	/**
	 * @param token the token to set
	 */
	public void setToken(String token) {
		this.token = token;
	}
	/**
	 * @return the rut
	 */
	public String getRut() {
		return rut;
	}
	/**
	 * @param rut the rut to set
	 */
	public void setRut(String rut) {
		this.rut = rut;
	}

}
