/**
 *@name QuestionAnswer.java
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
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @description Clase QuestionAnswer
 *
 */
@Entity
@Table(name = "questions_answers")
public class QuestionAnswer implements Serializable {

	private static final long serialVersionUID = -5301754507906815679L;

	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_QUESTIONS_ANSWERS")
	@SequenceGenerator(name = "SEQUENCE_QUESTIONS_ANSWERS", sequenceName = "SEQUENCE_QUESTIONS_ANSWERS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "question")
	private String question;
	
	@Column(name = "answer")
	private String answer;
	
	@ManyToMany(cascade = CascadeType.DETACH )
	@JoinTable(name = "users_questions_answers", joinColumns = { @JoinColumn(name = "id_question_answer") }, inverseJoinColumns = { @JoinColumn(name = "id_user") })
	private Set<User> users = new HashSet<User>();
	
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

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public String getAnswer() {
		return answer;
	}
	
	public Set<User> getUsers() {
	    return users;
	}
	
	public void setUsers(Set<User> users) {
	    this.users = users;
	}
}
