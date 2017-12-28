package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @author jose
 * 
 */

public class EstadoCumpleDTO implements Serializable {
	
	private static final long serialVersionUID = 3657265432071279059L;

	private Long id;
	private String description;
	
	public EstadoCumpleDTO() {
	}
	
	public EstadoCumpleDTO(Long id) {
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
