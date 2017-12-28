/**
 *@name ChannelServices.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Interface ChannelServices
 */
public interface TiendaServices {

	public List<TiendaDTO> getTiendas();
	public TiendaDTO getTiendasId(Long id);
	public TiendaDTO getTienda(String description);
	public OperationResult deleteTienda(Long tiendaId);
	public OperationResult addTienda(TiendaDTO tienda);
	public OperationResult editTienda(TiendaDTO tienda);
	
}
