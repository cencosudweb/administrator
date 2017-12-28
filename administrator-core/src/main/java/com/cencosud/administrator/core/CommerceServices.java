/**
 *@name CommerceServices.java
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

import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dto.users.CommerceDTO;
/**
 * @description Interface ChannelServices
 */
public interface CommerceServices {
	public List<CommerceDTO> getCommerces(int status);
	public CommerceDTO getCommerce(Long commerceId);
	public CommerceDTO getCommerceByMnemonic(String mnemonic);
	public CommerceDTO getCommerceByRut(String rut);
	public OperationResult editCommerce(CommerceDTO commerce);
	public OperationResult addCommerce(CommerceDTO commerce);
	public OperationResult deleteCommerce(Long commerceId);
	public OperationResult updateStatus(Long commerceId, int status);
}
