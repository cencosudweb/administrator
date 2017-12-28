/**
 *@name OperationResult.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.utils;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase OperationResult
 */
public class OperationResult implements Serializable {
	
	private static final long serialVersionUID = 5499721093093154777L;
	public static int SUCCESS = 0;
	public static int ERROR = 1;
	public static int WARNING = 2;
	
	public OperationResult(){}
	
	private int result;
	private Object objet;
	private String message;
	private Long id;
	private Exception excepcion;
	
	public int getResult() {return result;}
	public Object getObjet() {return objet;}
	public String getMessage() {return message;}
	public Exception getExcepcion() {return excepcion;}
	public Long getId() {return id;}
	
	public void setResult(int result) {this.result = result;}
	public void setObjet(Object objet) {this.objet = objet;}
	public void setMessage(String message) {this.message = message;}
	public void setExcepcion(Exception excepcion) {this.excepcion = excepcion;}
	public void setId(Long id) {this.id = id;}
	
	@Override
    public String toString() {return ToStringBuilder.reflectionToString(this);}

}
