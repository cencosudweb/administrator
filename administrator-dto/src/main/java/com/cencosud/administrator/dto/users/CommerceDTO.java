/**
 *@name CommerceDTO.java
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
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase CommerceDTO para la transferencia de datos
 */

public class CommerceDTO implements Serializable {

	private static final long serialVersionUID = -262289197062914696L;

	private Long id;
	private String rut;
	private String businessLine;
	private String mnemonic;
	private int status;
	private Date activationDate;
	private List<UserDTO> users;
	private EconomicActivityDTO economicAcivity;

	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

	public Long getId() {
		return id;
	}

	public String getRut() {
		return rut;
	}

	public String getBusinessLine() {
		return businessLine;
	}

	public String getMnemonic() {
		return mnemonic;
	}

	public Date getActivationDate() {
		return activationDate;
	}

	public List<UserDTO> getUsers() {
		return users;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public void setBusinessLine(String businessLine) {
		this.businessLine = businessLine;
	}

	public void setMnemonic(String mnemonic) {
		this.mnemonic = mnemonic;
	}

	public void setActivationDate(Date activationDate) {
		this.activationDate = activationDate;
	}

	public void setUsers(List<UserDTO> users) {
		this.users = users;
	}

	public void setEconomicAcivity(EconomicActivityDTO economicAcivity) {
		this.economicAcivity = economicAcivity;
	}

	public EconomicActivityDTO getEconomicAcivity() {
		return economicAcivity;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getStatus() {
		return status;
	}

}
