
/**
 *@name CustomAuthenticationSuccessHandler.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.authentication;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;
/**
 * @description Clase que direccionar a las paginas segun roles   
 */
public class CustomAuthenticationSuccessHandler  implements AuthenticationSuccessHandler{

	public void onAuthenticationSuccess(
			HttpServletRequest paramHttpServletRequest,
			HttpServletResponse paramHttpServletResponse,
			Authentication paramAuthentication) throws IOException,
			ServletException {
		
		String path = paramHttpServletRequest.getContextPath();
		
		UserDTO principal = (UserDTO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		//Deteccion de Estado Pending
		if(principal.getStatus()==StatusEnum.PENDING_CONFIRMATION.getCode()){
			paramHttpServletResponse.sendRedirect(path+"/resetPasswordTemp");
        	return;
		}else{
			if(principal.getRoles()!=null && principal.getRoles().size()>0){
				for (int i = 0; i < principal.getRoles().size(); i++) {
					RoleDTO rol = principal.getRoles().get(0);
					if(rol!=null && "ROLE_PENDING".equalsIgnoreCase(rol.getRole())){
						paramHttpServletResponse.sendRedirect(path+"/resetPasswordTemp");
			        	return;
					}
				}
			}
		}
		
		for (GrantedAuthority ga : paramAuthentication.getAuthorities()) {
	        if (ga.getAuthority().equals("ROLE_ADMIN")) {
	        	paramHttpServletResponse.sendRedirect(path+"/admin/home");
	        	return;
	        }else{
	            if (ga.getAuthority().equals("ROLE_USER_IF")) {
	            	 paramHttpServletResponse.sendRedirect(path+"/financial/home");
	                 return;
	            }else{
	            	 if (ga.getAuthority().equals("ROLE_COMMERCE")) {
	                 	paramHttpServletResponse.sendRedirect(path+"/commerce/home");
	                    return;
	                 }
	            }
	        }
		}
	}
}


