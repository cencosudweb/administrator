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

import com.cencosud.administrator.dao.domain.Estado;
/**
 * @description Interface  
 */
public interface EstadoDao {

	public List<Estado> getEstados();
	public Estado getEstadosId(Long id);
	
}
