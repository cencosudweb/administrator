/**
 *@name AgreementServicesTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.core;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.QuestionServices;
import com.cencosud.administrator.dto.users.QuestionDTO;

/**
 * @description Clase 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
@TransactionConfiguration(transactionManager="transactionManager", defaultRollback=false)
public class QuestionServicesTest{

	@Autowired
	private QuestionServices questionServicesImpl;
	
	@Test
	@Transactional
	public void getQuestions() {
		
		List<QuestionDTO> questions = questionServicesImpl.getQuestions();
		
		assertNotNull("Listado preguntas es null", questions);
		assertFalse("No hay preguntas", questions.isEmpty());
		
    }
	
	/*
	@Test
	@Transactional(readOnly=false)
    public void addQATest() {
		
		try {
			List<QuestionAnswerDTO> qas = new ArrayList<QuestionAnswerDTO>();
			
			QuestionAnswerDTO qa = new QuestionAnswerDTO();
			qa.setQuestion("test question Serv");
			qa.setAnswer("test answer Serv");
			
			qas.add(qa);
			
			OperationResult result = questionServicesImpl.addQuestionAnswer(new Long(1), qas);
			
			assertNotNull("Resultado de insercion de QA", result);
			assertTrue("Resultado de insercion de QA falla", OperationResult.SUCCESS == result.getResult());
			
		}catch(Exception e){
			if(e instanceof DataException){
				Assert.fail(((DataException) e).getSQLException().getMessage());
			}else{
				Assert.fail(e.getMessage());
			}
		}
		
    }
    */
	
	
	
}
