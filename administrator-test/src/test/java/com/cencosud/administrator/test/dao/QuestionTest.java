/**
 *@name FinancialInstitutionTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.dao;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.hibernate.exception.DataException;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.dao.QuestionDao;
import com.cencosud.administrator.dao.domain.Question;

/**
 * @description Clase QuestionTest que implementa pruebas Unitarias
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class QuestionTest{

	@Autowired
	private QuestionDao questionDaoImpl;
	
	@Test
	@Transactional
    public void getQuestions() {
		
		List<Question> questions = questionDaoImpl.getQuestions();
		
		assertNotNull("Listado preguntas es null", questions);
		assertFalse("No hay preguntas", questions.isEmpty());
		
    }
	/*
	@Test
	@Transactional(readOnly=false)
    public void addQATest() {
		
		try {
			QuestionAnswer qa = new QuestionAnswer();
			qa.setQuestion("test question");
			qa.setAnswer("test answer");
			
			User user = new User(); user.setId(new Long(1)); 
			Set<User> users = new HashSet<User>();
			users.add(user);
			qa.setUsers(users);
			questionDaoImpl.addQuestionAnswer(qa);
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
		
    }
    */
	
	@Test
	@Transactional(readOnly=false)
    public void deleteQAForUserTest() {
		
		try {
			questionDaoImpl.deleteQuestionAnswerForUser(new Long(1));
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
		
    }
	
}
