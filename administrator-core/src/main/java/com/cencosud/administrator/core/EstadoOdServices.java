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

import com.cencosud.administrator.dto.users.EstadoOdDTO;
/**
 * @description Interface ChannelServices
 */
public interface EstadoOdServices {

	public List<EstadoOdDTO> getEstadoOds();
	
}
