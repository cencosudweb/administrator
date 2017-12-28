/**
 *@name SystemLogServices.java
 * 
 *@version 1.0 
 * 
 *@date 04-05-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.dto.users.SystemLogDTO;

/**
 * @description 
 */
public interface SystemLogServices {
	public List<SystemLogDTO> getSystemLog(int iduser, String description, int start, int limit);
	public SystemLogDTO getSystemLogId(Long systemLogId);
	public void addSystemLog(int iduser, int loglevel, String action, String description, String data, String tablename, String pagename, String ipaddress, String creationdate );
	public Long getCounts(int idUser, String description);
}
