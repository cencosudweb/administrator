/**
 *@name AgreementServices.java
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

import com.cencosud.administrator.dto.users.AgreementDTO;
import com.cencosud.administrator.utils.OperationResult;

/**
 * @description Interface AgreementServices
 */
public interface AgreementServices {
	
	public AgreementDTO getAgreement(Long agreementId);
	public OperationResult addAgreement(AgreementDTO agreement, Long idFI, Long idCommerce);
	public OperationResult updateStatus(Long agreementId, int status);
	public OperationResult editAgreement(AgreementDTO agreement);
	public boolean validateAgreementExist(Long fiId, Long commerceId);

}
