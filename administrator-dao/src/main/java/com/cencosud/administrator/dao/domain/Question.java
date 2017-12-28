/**
 *@name Question.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */

package com.cencosud.administrator.dao.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 *  @description Clase Question
 *
 */
@Entity
@Table(name = "questions")
public class Question implements Serializable {

	private static final long serialVersionUID = -5301754507906815679L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_QUESTIONS")
	@SequenceGenerator(name = "SEQUENCE_QUESTIONS", sequenceName = "SEQUENCE_QUESTIONS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "question")
	private String question;
	
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

	public void setId(Long id) {
		this.id = id;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

}
