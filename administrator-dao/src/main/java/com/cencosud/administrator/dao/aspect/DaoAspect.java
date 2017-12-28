/**
 *@name DaoAspect.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.aspect;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @description 
 */

@Aspect
@Component
public class DaoAspect {
	
	@Autowired
	private SessionFactory sessionFactory;

	/**
	 * omite todos los metodos get*
	 */
	@Pointcut("execution(public void com.cencosud.administrator.dao.impl.*.*(..))")
	public void businessMethods() {
	}

	@After("businessMethods()")
	public void after() {
		try {
			if(sessionFactory.getCurrentSession().isDirty()){
				sessionFactory.getCurrentSession().flush();
			}
		} catch (IllegalStateException e) {
		}
		
	}

}
