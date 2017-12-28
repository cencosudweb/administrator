/**
 *@name AgreementDao.java
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

import com.cencosud.administrator.dao.domain.Agreement;

/**
 * @description Interface  
 */
public interface AgreementDao {
	
	public Agreement getAgreement(Long agreementId);
	public void addAgreement(Agreement agreement);
	public void editAgreement(Agreement agreement);
	public void addFIComerceAgreementRelationship(Long idIF, Long idCommerce, Long idAgreement);
	public void updateStatus(Long agreementId, int status);
	public boolean validateAgreementExist(Long fiId, Long commerceId);

}
