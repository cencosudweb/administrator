
/**
 *@name Roles.java
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
 * @description Clase Enumerada para los roles
 */
public enum Roles {
	ADMIN("ROLE_ADMIN"), COMMERCE("ROLE_COMMERCE"), FINANCIAL("ROLE_USER_IF"), PENDING("ROLE_PENDING");

	private final String rol;

	Roles(String rol) {
		this.rol = rol;
	}

	public String getRol() {
		return rol;
	}

}