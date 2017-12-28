/**
 *@name RoleDTO.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
/**
 * @description Clase RoleDTO para la transferencia de datos
 */

public class RoleDTO implements Serializable {

	private static final long serialVersionUID = -8974256591763579884L;

	private Long id;
	private String role;
	private String description;

	public RoleDTO(){}
	
	public RoleDTO(Long id){
		this.id = id;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getRole() {
		return role;
	}


	public void setRole(String role) {
		this.role = role;
	}


	public void setDescription(String description) {
		this.description = description;
	}


	public String getDescription() {
		return description;
	}

	
}
