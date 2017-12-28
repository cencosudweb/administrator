/**
 *@name SystemLog.java
 * 
 *@version 1.0 
 * 
 *@date 04-05-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.domain;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @description 
 */

@Entity
@Table(name = "system_log")
public class SystemLog implements Serializable {
	
private static final long serialVersionUID = 5468480017252581493L;
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SEQUENCE_SYSTEM_LOG")
	@SequenceGenerator(name = "SEQUENCE_SYSTEM_LOG", sequenceName = "SEQUENCE_SYSTEM_LOG", allocationSize = 1)
	//@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "iduser")
	private int iduser;
	
	@Column(name = "loglevel")
	private int loglevel;
	
	@Column(name = "action")
	private String action;
	
	@Column(name = "description")
	private String description;
	
	@Column(name = "data")
	private String data;
	
	@Column(name = "tablename")
	private String tablename;

	@Column(name = "pagename")
	private String pagename;
	
	@Column(name = "ipaddress")
	private String ipaddress;

	
	@Column(name = "creationdate")
	private String creationdate;
	
	@Column(name = "agent")
	private int agent;

	/**
	 * @return the id
	 */
	public Long getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the iduser
	 */
	public int getIduser() {
		return iduser;
	}

	/**
	 * @param iduser the iduser to set
	 */
	public void setIduser(int iduser) {
		this.iduser = iduser;
	}

	/**
	 * @return the loglevel
	 */
	public int getLoglevel() {
		return loglevel;
	}

	/**
	 * @param loglevel the loglevel to set
	 */
	public void setLoglevel(int loglevel) {
		this.loglevel = loglevel;
	}

	/**
	 * @return the action
	 */
	public String getAction() {
		return action;
	}

	/**
	 * @param action the action to set
	 */
	public void setAction(String action) {
		this.action = action;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the data
	 */
	public String getData() {
		return data;
	}

	/**
	 * @param data the data to set
	 */
	public void setData(String data) {
		this.data = data;
	}

	/**
	 * @return the tablename
	 */
	public String getTablename() {
		return tablename;
	}

	/**
	 * @param tablename the tablename to set
	 */
	public void setTablename(String tablename) {
		this.tablename = tablename;
	}

	/**
	 * @return the pagename
	 */
	public String getPagename() {
		return pagename;
	}

	/**
	 * @param pagename the pagename to set
	 */
	public void setPagename(String pagename) {
		this.pagename = pagename;
	}

	/**
	 * @return the ipaddress
	 */
	public String getIpaddress() {
		return ipaddress;
	}

	/**
	 * @param ipaddress the ipaddress to set
	 */
	public void setIpaddress(String ipaddress) {
		this.ipaddress = ipaddress;
	}

	/**
	 * @return the creationdate
	 */
	public String getCreationdate() {
		return creationdate;
	}

	/**
	 * @param creationdate the creationdate to set
	 */
	public void setCreationdate(String creationdate) {
		this.creationdate = creationdate;
	}

	/**
	 * @return the agent
	 */
	public int getAgent() {
		return agent;
	}

	/**
	 * @param agent the agent to set
	 */
	public void setAgent(int agent) {
		this.agent = agent;
	}

	/**
	 * 
	 */
	public SystemLog() {
		// TODO Auto-generated constructor stub
	}
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

}
