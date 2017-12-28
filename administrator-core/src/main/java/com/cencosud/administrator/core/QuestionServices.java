/**
 *@name KitServices.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dto.users.QuestionAnswerDTO;
import com.cencosud.administrator.dto.users.QuestionDTO;
/**
 * @description 
 */
public interface QuestionServices {

	public List<QuestionDTO> getQuestions();
	public OperationResult addQuestionAnswer(Long idUser, List<QuestionAnswerDTO> qas);
	
}
