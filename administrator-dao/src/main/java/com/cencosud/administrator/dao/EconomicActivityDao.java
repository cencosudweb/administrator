/**
 *@name EconomicActivityDao.java
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

import com.cencosud.administrator.dao.domain.EconomicActivity;
import com.cencosud.administrator.dao.domain.Role;
/**
 * @description Interface  
 */
public interface EconomicActivityDao {
	public List<EconomicActivity> getActivities();
	public Role getEconomicActivity(String id);
	public void addEconomicActivity(EconomicActivity activity);
	public void deleteEconomicActivity(EconomicActivity role);
	public void editEconomicActivity(EconomicActivity activity);
}
