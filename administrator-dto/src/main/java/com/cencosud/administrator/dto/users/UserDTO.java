/**
 *@name UserDTO.java
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
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description Clase UserDTO para la transferencia de datos
 */

public class UserDTO implements Serializable {

	private static final long serialVersionUID = 2364518508774717970L;

	public final static int MAX_ATTEMPTS = 3;
	
	private Long id;
	private String username;
	private String password;
	private String password2;
	private String passwordActualReset;
	private String passwordNonEncripted;
	private String name;
	private String rut;
	private String phone;
	private int status;
	private int attempts;
	private String email;
	private String email2;
	private List<RoleDTO> roles;
	private List<FinancialInstitutionDTO> fis;
	private List<CommerceDTO> commerces;
	private List<QuestionAnswerDTO> qas;
	private int typeSelected;
	private Date timePassExpiration;
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }


	public String getUsername() {
		return username;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Long getId() {
		return id;
	}


	public String getPassword() {
		return password;
	}


	public int getStatus() {
		return status;
	}


	public void setUsername(String username) {
		this.username = username;
	}


	public void setPassword(String password) {
		this.password = password;
	}


	public void setStatus(int status) {
		this.status = status;
	}


	public void setRoles(List<RoleDTO> roles) {
		this.roles = roles;
	}


	public void setFis(List<FinancialInstitutionDTO> fis) {
		this.fis = fis;
	}


	public List<FinancialInstitutionDTO> getFis() {
		return fis;
	}


	public List<RoleDTO> getRoles() {
		return roles;
	}
	
	public void addRole(RoleDTO role){
		if(this.roles == null){
			this.roles = new ArrayList<RoleDTO>(); 
		}
		this.roles.add(role);
	}


	public int getAttempts() {
		return attempts;
	}


	public String getEmail() {
		return email;
	}


	public void setAttempts(int attempts) {
		this.attempts = attempts;
	}


	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getName() {
		return name;
	}


	public String getRut() {
		return rut;
	}


	public String getPhone() {
		return phone;
	}


	public void setName(String name) {
		this.name = name;
	}


	public void setRut(String rut) {
		this.rut = rut;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public void setPasswordNonEncripted(String passwordNonEncripted) {
		this.passwordNonEncripted = passwordNonEncripted;
	}


	public String getPasswordNonEncripted() {
		return passwordNonEncripted;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}


	public String getPassword2() {
		return password2;
	}


	public void setEmail2(String email2) {
		this.email2 = email2;
	}


	public String getEmail2() {
		return email2;
	}
	
	public void setPasswordActualReset(String passwordActualReset) {
		this.passwordActualReset = passwordActualReset;
	}

	public String getPasswordActualReset() {
		return passwordActualReset;
	}
	
	public void setQas(List<QuestionAnswerDTO> qas) {
		this.qas = qas;
	}

	public List<QuestionAnswerDTO> getQas() {
		return qas;
	}
	
	public Map<String, Object> getModel(){
		Map<String, Object> model = new HashMap<String, Object>();
	    model.put("user", this.name);
	    model.put("to", this.email);
	    model.put("password", this.passwordNonEncripted);
	    model.put("username", this.username);	
	    
	    String dateFormat = "";
	    DateFormat df1 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");//DateFormat.getDateInstance(DateFormat.FULL);
	    if(this.timePassExpiration != null){
	    	dateFormat = df1.format(this.timePassExpiration);
	    
	    }
	    model.put("date", dateFormat); 
	    
		return model;
	}


	public void setCommerces(List<CommerceDTO> commerces) {
		this.commerces = commerces;
	}


	public List<CommerceDTO> getCommerces() {
		return commerces;
	}


	public void setTypeSelected(int typeSelected) {
		this.typeSelected = typeSelected;
	}


	public int getTypeSelected() {
		return typeSelected;
	}


	public void setTimePassExpiration(Date timePassExpiration) {
		this.timePassExpiration = timePassExpiration;
	}


	public Date getTimePassExpiration() {
		return timePassExpiration;
	}
}
