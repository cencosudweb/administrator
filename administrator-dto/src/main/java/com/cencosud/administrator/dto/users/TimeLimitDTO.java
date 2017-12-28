
/**
 *@name TimeLimitDTO.java
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
 * @description Clase TimeLimitDTO para la transferencia de datos
 */


public class TimeLimitDTO implements Serializable {

	private static final long serialVersionUID = 3426782087059043339L;

	private Long id;
	private Integer timeLimit;
	private String description;
	
	public TimeLimitDTO() {
	}
	
	public TimeLimitDTO(Long id) {
		this.id = id;
	}
	
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public Integer getTimeLimit() {
		return timeLimit;
	}

	public String getDescription() {
		return description;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setTimeLimit(Integer timeLimit) {
		this.timeLimit = timeLimit;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
