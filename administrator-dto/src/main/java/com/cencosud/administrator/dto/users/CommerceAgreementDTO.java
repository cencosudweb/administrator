/**
 *@name CommerceAgreementDTO.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase CommerceAgreementDTO para la transferencia de datos
 */

public class CommerceAgreementDTO implements Serializable {

	private static final long serialVersionUID = 5124732377129562580L;

	private CommerceDTO commerce;
	private AgreementDTO agreement;

	public CommerceAgreementDTO () {}
	
	public CommerceAgreementDTO (CommerceDTO commerce, AgreementDTO agreement) {
		this.commerce = commerce;
		this.agreement = agreement;
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public CommerceDTO getCommerce() {
		return commerce;
	}

	public AgreementDTO getAgreement() {
		return agreement;
	}

	public void setCommerce(CommerceDTO commerce) {
		this.commerce = commerce;
	}

	public void setAgreement(AgreementDTO agreement) {
		this.agreement = agreement;
	}


}
