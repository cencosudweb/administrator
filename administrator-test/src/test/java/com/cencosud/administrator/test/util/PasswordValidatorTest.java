/**
 *@name PasswordValidatorTest.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.test.util;

import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cencosud.administrator.core.util.PasswordValidator;

/**
 * @description 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "/administrator-testContext.xml"})
public class PasswordValidatorTest {
	
	@Autowired
	private PasswordValidator passwordValidator;

	@Test
	public void testNormalPassword()
	{
		PasswordValidator validator = new PasswordValidator(false, false, false, 6, 14);

		Assert.assertTrue(validator.validate("howtodoinjava"));
		Assert.assertTrue(validator.validate("howtodoin"));
		//Sort on length
		Assert.assertFalse(validator.validate("howto"));
	}

	@Test
	public void testForceNumeric()
	{
		PasswordValidator validator = new PasswordValidator(false,false, true, 6, 16);
		//Contains numeric
		Assert.assertTrue(validator.validate("howtodoinjava12"));
		Assert.assertTrue(validator.validate("34howtodoinjava"));
		Assert.assertTrue(validator.validate("howtodo56injava"));
		//No numeric
		Assert.assertFalse(validator.validate("howtodoinjava"));
	}

	@Test
	public void testForceCapitalLetter()
	{
		PasswordValidator validator = new PasswordValidator(false,true, false, 6, 16);
		//Contains capitals
		Assert.assertTrue(validator.validate("howtodoinjavA"));
		Assert.assertTrue(validator.validate("Howtodoinjava"));
		Assert.assertTrue(validator.validate("howtodOInjava"));
		//No capital letter
		Assert.assertFalse(validator.validate("howtodoinjava"));
	}

	@Test
	public void testForceSpecialCharacter()
	{
		PasswordValidator validator = new PasswordValidator(true,false, false, 6, 16);
		//Contains special char
		Assert.assertTrue(validator.validate("howtod@injava"));
		Assert.assertTrue(validator.validate("@Howtodoinjava"));
		Assert.assertTrue(validator.validate("howtodOInjava@"));
		//No special char
		Assert.assertFalse(validator.validate("howtodoinjava"));
	}
	
	@Test
	public void testForceAllCharacter()
	{
		Assert.assertTrue(passwordValidator.validate("hoWtod@injav4"));
		Assert.assertTrue(passwordValidator.validate("@Howt0doinjava"));
		Assert.assertTrue(passwordValidator.validate("howtodOInj4va@"));
		Assert.assertTrue(passwordValidator.validate("howtod@inJava12"));
		Assert.assertTrue(passwordValidator.validate("34howTodoinjav@"));
		
		Assert.assertFalse(passwordValidator.validate("howtodoinjava"));
		Assert.assertFalse(passwordValidator.validate("123456789"));
		Assert.assertFalse(passwordValidator.validate("@@@@@@@@@"));
	}
	
	

}
