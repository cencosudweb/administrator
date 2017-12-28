/**
 *@name ChannelDTO.java
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
 * @description Clase ChannelDTO para la transferencia de datos
 */

public class PrioridadDTO implements Serializable {
	
	private static final long serialVersionUID = 3657265432071279059L;

	private Long id;
	private String description;
	
	public PrioridadDTO() {
	}
	
	public PrioridadDTO(Long id) {
		this.id = id;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public String getDescription() {
		return description;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	
}
