/**
 *@name FinancialInstitutionDao.java
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

import com.cencosud.administrator.dao.domain.FinancialInstitution;
/**
 * @description Interface  
 */
public interface FinancialInstitutionDao {

	public List<FinancialInstitution> getFIs(int status);
	public FinancialInstitution getFI(Long fiId);
	public FinancialInstitution getFIByMnemonic(String mnemonic);
	public FinancialInstitution getFIByRut(String rut);
	public void addFI(FinancialInstitution fi);
	public void deleteFI(Long fiId);
	public void updateStatus(Long financialId, int status);
	public void editFI(FinancialInstitution fi);
	
}
