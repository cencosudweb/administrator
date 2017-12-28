
/**
 *@name MensajesResultado.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.controller.enums;
/**
 * @description Clase Enumerada que genera mensajes al usuario   
 */
public enum MensajesResultado {
	EXITO(1), FRACASO(2), ADVERTENCIA(3);

	private final int codigo;

	MensajesResultado(int codigo) {
		this.codigo = codigo;
	}

	public int getCodigo() {
		return codigo;
	}
}