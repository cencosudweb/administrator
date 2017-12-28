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

import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Interface  
 */
public interface TiendaDao {

	public List<Tienda> getTiendas();
	public Tienda getTiendasId(Long id);
	public Tienda getTiendas(String description);
	
	public void addTienda(Tienda tienda);
	public void editTienda(Tienda tienda);
	public void deleteTienda(Long tiendaId);
	
}
