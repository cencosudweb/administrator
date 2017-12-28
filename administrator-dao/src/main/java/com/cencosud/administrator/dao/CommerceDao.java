/**
 *@name CommerceDao.java
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

import com.cencosud.administrator.dao.domain.Commerce;
/**
 * @description Interface  
 */
public interface CommerceDao {

	public List<Commerce> getCommerces(int status);
	public Commerce getCommerce(Long commerceId);
	public Commerce getCommerceByMnemonic(String mnemonic);
	public Commerce getCommerceByRut(String rut);
	public void editCommerce(Commerce commerce);
	public void addCommerce(Commerce commerce);
	public void deleteCommerce(Long commerceId);
	public void updateStatus(Long commerceId, int status);
}
