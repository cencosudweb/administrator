/**
 *@name RoleEnum.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.enums;
/**
 * @description 
 */
public enum RoleEnum {

	ROLE_ADMIN(1, "ROLE_ADMIN"),                       
	ROLE_USER_IF(2, "ROLE_USER_IF"),                       
	ROLE_COMMERCE(3, "ROLE_COMMERCE"),          
	ROLE_PENDING(4, "ROLE_PENDING");
	
	private int id;
	private String role;
	
	public Long getId(){
		return new Long(this.id);
	}
	
	public String getRole(){
		return this.role;
	}
	
	private RoleEnum(int id, String role){
		this.role = role;
		this.id = id;
	}

}
