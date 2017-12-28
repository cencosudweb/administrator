
/**
 *@name AdminUtils.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.utils;

import java.util.ArrayList;
import java.util.List;

import com.cencosud.administrator.web.controller.enums.Roles;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UrlCallbackDTO;

/**
 * @description Clase de utilidades para manejo de roles   
 */
public class AdminUtils {
	
	public static String getPathHomeRole(List<RoleDTO> roles){
		if(roles!=null){
			for (int i = 0; i < roles.size(); i++) {
				RoleDTO rol = roles.get(i);
				if(rol.getRole().equalsIgnoreCase(Roles.ADMIN.getRol())){
					return "role/admin/home";
				}
				if(rol.getRole().equalsIgnoreCase(Roles.FINANCIAL.getRol())){
					return "role/financial/home";
				}
				if(rol.getRole().equalsIgnoreCase(Roles.COMMERCE.getRol())){
					return "role/commerce/home";
				}
			}
		}else{
			return "/";
		}
		return "/";
	}
	
    public static List<UrlCallbackDTO> cleanUrls(List<UrlCallbackDTO> urls){
    	List<UrlCallbackDTO> urlsClean = new ArrayList<UrlCallbackDTO>();;
    	if(urls!=null && urls.size()>0){
    		for (int i = 0; i < urls.size(); i++) {
    			UrlCallbackDTO url = urls.get(i);
    			if(-1 != url.getChannel().getId()){
    				urlsClean.add(url);
    			}
			}
    	}
    	return urlsClean;
    }
}
