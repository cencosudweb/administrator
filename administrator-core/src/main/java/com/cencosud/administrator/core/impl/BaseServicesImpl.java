
/**
 *@name BaseServicesImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.impl;


import org.apache.log4j.Logger;
import org.dozer.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
/**
 * @description 
 */
public abstract class BaseServicesImpl {
	
	@Autowired
	protected String errorGenerico;
	
	@Autowired
	protected Mapper mapper;
	
	/**
	 */
	protected void hacerAlgo(Logger log, String rut) {
		log.info("hacerAlgo: ");
	}
	
}
