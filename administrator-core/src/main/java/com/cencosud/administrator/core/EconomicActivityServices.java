/**
 *@name EconomicActivityServices.java
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

import com.cencosud.administrator.dto.users.EconomicActivityDTO;
/**
 * @description Interface ChannelServices 
 */

public interface EconomicActivityServices {

	public List<EconomicActivityDTO> getActivities();
	
}
