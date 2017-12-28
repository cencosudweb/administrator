package com.cencosud.administrator.dao.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * 
 * @author jose
 * 
 */

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = -7190829120215700954L;

	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_USERS")
	@SequenceGenerator(name = "SEQUENCE_USERS", sequenceName = "SEQUENCE_USERS", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	

	@Column(name = "username", unique = true)
	private String username;

	@Column(name = "password")
	private String password;

	@Column(name = "status")
	private int status;
	
	@Column(name = "attempts")
	private int attempts;
	
	@Column(name = "email", unique = true)
	private String email;
	
	@Column(name = "name")
	private String name;
	
	@Column(name = "rut")
	private String rut;
	
	@Column(name = "phone")
	private String phone;
	
	@Column(name = "password_expire")
	private long timePassExpiration;
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "users_authorities", joinColumns = { @JoinColumn(name = "id_user") }, inverseJoinColumns = { @JoinColumn(name = "id_authorities") })
	private Set<Role> roles = new HashSet<Role>(0);
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "users_financial_institution", joinColumns = { @JoinColumn(name = "id_user") }, inverseJoinColumns = { @JoinColumn(name = "id_financial_institution") })
	private Set<FinancialInstitution> fis = new HashSet<FinancialInstitution>(0);
	
	@ManyToMany(cascade = CascadeType.DETACH)
	@JoinTable(name = "users_commerce", joinColumns = { @JoinColumn(name = "id_user") }, inverseJoinColumns = { @JoinColumn(name = "id_commerce") })
	private Set<Commerce> commerces = new HashSet<Commerce>(0);
	
	@ManyToMany(cascade = CascadeType.ALL)
	@JoinTable(name = "users_questions_answers", joinColumns = { @JoinColumn(name = "id_user") }, inverseJoinColumns = { @JoinColumn(name = "id_question_answer") })
	private Set<QuestionAnswer> qas = new HashSet<QuestionAnswer>(0);
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getId() {
		return id;
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

	public void setName(String name) {
		this.name = name;
	}

	public String getName() {
		return name;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getRut() {
		return rut;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone() {
		return phone;
	}

	public void setFis(Set<FinancialInstitution> fis) {
		this.fis = fis;
	}

	public Set<FinancialInstitution> getFis() {
		return fis;
	}

	public Set<QuestionAnswer> getQas() {
		return qas;
	}

	public void setQas(Set<QuestionAnswer> qas) {
		this.qas = qas;
	}

	public void setCommerces(Set<Commerce> commerces) {
		this.commerces = commerces;
	}

	public Set<Commerce> getCommerces() {
		return commerces;
	}

	public void setTimePassExpiration(long timePassExpiration) {
		this.timePassExpiration = timePassExpiration;
	}

	public long getTimePassExpiration() {
		return timePassExpiration;
	}

}

