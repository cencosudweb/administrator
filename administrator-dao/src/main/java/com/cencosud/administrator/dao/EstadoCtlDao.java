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

import com.cencosud.administrator.dao.domain.EstadoCtl;
/**
 * @description Interface  
 */
public interface EstadoCtlDao {

	public List<EstadoCtl> getEstadoCtls();
	
}
