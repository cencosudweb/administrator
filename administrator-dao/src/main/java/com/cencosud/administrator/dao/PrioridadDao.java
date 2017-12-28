/**
 *@name ChannelDao.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao;

import java.util.List;

import com.cencosud.administrator.dao.domain.Prioridad;
/**
 * @description Interface  
 */
public interface PrioridadDao {

	public List<Prioridad> getPrioridads();
	public List<Prioridad> getPrioridadId(Long id);
	
}
