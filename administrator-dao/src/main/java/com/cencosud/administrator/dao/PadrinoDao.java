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

import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Interface  
 */
public interface PadrinoDao {

	public List<Padrino> getPadrinos(Tienda tienda);
	public List<Padrino> getPadrinoDescs(String description);
	public Padrino getPadrinosId(Long id);
	public Padrino getPadrino(String description);
	
	public void addPadrino(Padrino padrino);
	public void editPadrino(Padrino padrino);
	public void deletePadrino(Long padrinoId);
	
}
