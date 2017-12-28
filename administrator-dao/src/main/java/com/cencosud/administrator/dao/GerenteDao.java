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

import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dao.domain.Padrino;
/**
 * @description Interface  
 */
public interface GerenteDao {

	public List<Gerente> getGerentes(Padrino padrino);
	public Gerente getGerentesId(Long id);
	
	public void addGerente(Gerente gerente);
	public void editGerente(Gerente gerente);
	public void deleteGerente(Long gerenteId);
}
