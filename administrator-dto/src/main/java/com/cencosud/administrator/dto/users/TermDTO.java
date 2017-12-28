/**
 *@name TermDTO.java
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
 * @description Clase TermDTO para la transferencia de datos
 */


public class TermDTO implements Serializable {
	private static final long serialVersionUID = 5982177249121331207L;
	private Long id;
	private String plazo;

	public TermDTO(){}
	
	public TermDTO(Long id){
		this.id = id;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setPlazo(String plazo) {
		this.plazo = plazo;
	}

	public String getPlazo() {
		return plazo;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
	
}
