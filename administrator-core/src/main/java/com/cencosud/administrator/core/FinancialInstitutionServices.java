/**
 *@name FinancialInstitutionServices.java
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
import com.cencosud.administrator.dto.users.FinancialInstitutionDTO;
/**
 * @description 
 */
public interface FinancialInstitutionServices {

	public List<FinancialInstitutionDTO> getFIs(int status);
	public FinancialInstitutionDTO getFI(Long fiId);
	public FinancialInstitutionDTO getFIByMnemonic(String mnemonic);
	public FinancialInstitutionDTO getFIByRut(String rut);
	public OperationResult addFI(FinancialInstitutionDTO fi);
	public OperationResult deleteFI(Long fiId);
	public OperationResult editFI(FinancialInstitutionDTO fi);
	public OperationResult updateStatus(Long fiId, int status);
	
}
