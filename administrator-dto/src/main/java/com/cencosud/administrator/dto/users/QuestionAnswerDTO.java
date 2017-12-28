/**
 *@name QuestionAnswerDTO.java
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
 * @description Clase QuestionAnswerDTO para la transferencia de datos
 */
public class QuestionAnswerDTO implements Serializable {

	private static final long serialVersionUID = 2364518508774717970L;

	private Long id;
	private String question;
	private String answer;
	private String valSel;
	
	public QuestionAnswerDTO(){}
	
	public QuestionAnswerDTO(String question, String answer){
		this.question = question;
		this.answer = answer;
	}
	
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public String getQuestion() {
		return question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public void setValSel(String valSel) {
		this.valSel = valSel;
	}

	public String getValSel() {
		return valSel;
	}
	
	

}
