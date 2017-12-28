/**
 * 
 */
package com.cencosud.administrator.dto.users;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;

/**
 * @author jose
 *
 */
public class SystemLogDTO implements Serializable {
	
	private static final long serialVersionUID = 5468480017252581493L;
	
	private Long id;
	private int iduser;
	private int loglevel;
	private String action;
	private String description;
	private String data;
	private String tablename;
	private String pagename;
	private String ipaddress;
	private String creationdate;
	private int agent;
	
	@Override
    public String toString() {
        return ToStringBuilder.reflectionToString(this);
    }

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

}
