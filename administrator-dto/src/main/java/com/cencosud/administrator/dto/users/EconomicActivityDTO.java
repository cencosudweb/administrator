/**
 *@name EconomicActivityDTO.java
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
 * @description Clase EconomicActivityDTO para la transferencia de datos
 */

public class EconomicActivityDTO implements Serializable {

	private static final long serialVersionUID = 8925480442566785691L;

	private Long id;
	private String name;

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


	public void setName(String name) {
		this.name = name;
	}


	public String getName() {
		return name;
	}

	
}
