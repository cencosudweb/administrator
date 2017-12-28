/**
 *@name QuestionDTO.java
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
 * @description Clase QuestionDTO para la transferencia de datos
 */

public class QuestionDTO implements Serializable {

	private static final long serialVersionUID = 7114993332012731581L;

	private Long id;
	private String question;

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


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getQuestion() {
		return question;
	}

	
}
