/**
 *@name MailServicesTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.core.mail;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import java.util.HashMap;
import java.util.Map;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cencosud.administrator.core.email.AdministratorMailSender;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description 
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml" })
public class MailServicesTest {
	
	@Autowired
	private AdministratorMailSender administratorMailSender;

	@Test
	public void sendTest() {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", "Jose");
		model.put("to", "joseluis.garrido@externos-cl.cencosud.com");
		model.put("password", "UY4GY23G5JJHG");
		model.put("date", "22 de Abril de 2013");
		model.put("username", "jose.garrido");

		try {
			System.out.println("inicio:test");
			/*OperationResult result = */administratorMailSender.sendPassword(model);

			//assertNotNull("Resultado de envio de correo es nulo", result);
			//assertTrue("Resultado de envio de correo es falla", OperationResult.SUCCESS == result.getResult());

			System.out.println("fin:test");
		} catch (Exception e) {
			Assert.fail("falla envio de correo");
		}

	}
	
	@Test
	public void sendTestAsync() {

		Map<String, Object> model = new HashMap<String, Object>();
		model.put("user", "Jose");
		model.put("to", "joseluis.garrido@externos-cl.cencosud.com");
		model.put("password", "UY4Y23G5JJHG");
		model.put("date", "22 de Abril de 2013");
		model.put("username", "jose.garrido");

		try {
			
			String currentThreadName = Thread.currentThread().getName();
			System.out.println("inicio:test");
			System.out.println("The currentThreadName is :"+currentThreadName);
			OperationResult result = administratorMailSender.sendPasswordAsync(model).get();

			assertNotNull("Resultado de envio de correo es nulo", result);
			assertTrue("Resultado de envio de correo es falla", OperationResult.SUCCESS == result.getResult());

			System.out.println("fin:test");
		} catch (Exception e) {
			Assert.fail("falla envio de correo");
		}

	}

}
