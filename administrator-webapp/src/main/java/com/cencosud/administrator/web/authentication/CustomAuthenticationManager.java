/**
 *@name CustomAuthenticationManager.java
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

import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

//import com.cencosud.administrator.web.utils.ValidacionServicioUtils;
import com.cencosud.administrator.core.SystemLogServices;
import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.enums.LogEnum;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.core.util.MD5HashingUtils;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.web.utils.ValidacionLoginLdapServicio;
import com.cencosud.administrator.web.utils.ValidacionServicioUtils;

/**
 * @description Clase controladora para validar el token de usuario
 */
public class CustomAuthenticationManager implements AuthenticationManager {
	private static Logger log = Logger
			.getLogger(CustomAuthenticationManager.class);

	@Autowired
	private UserServices userServicesImpl;

	@Autowired
	private SystemLogServices systemLogServicesImpl;

	public Authentication authenticate(Authentication auth)
			throws AuthenticationException {
		log.info("user:authenticate");
		log.info("user: username " + auth.getName());
		log.info("user: pass " + auth.getCredentials());
		
		Date now = new Date();
		SimpleDateFormat ft = new SimpleDateFormat ("YYYY-MM-dd HH:mm:ss");
		String currentDate = ft.format(now);
		
		
		
		UserDTO currentUser;
		UsernamePasswordAuthenticationToken authentication = null;

		if ("admin".equals(auth.getName())
				|| "financial".equals(auth.getName())
				|| "".equals(auth.getName())
				|| "".equals(auth.getCredentials())) {
			currentUser = userServicesImpl.getUser(auth.getName());
			if (currentUser != null) {
				if (currentUser.getStatus() != StatusEnum.BLOCKED_USER
						.getCode() && currentUser.getAttempts() > 0) {
					if (currentUser.getStatus() == StatusEnum.PENDING_CONFIRMATION
							.getCode()) {
						if (new Date().after(currentUser
								.getTimePassExpiration())) {
							log.error("Credenciales Expiradas");
							throw new CredentialsExpiredException(
									"Credenciales Expiradas");
						}
					}

					Boolean equals = false;
					try {
						equals = MD5HashingUtils.compare(auth.getCredentials()
								.toString(), currentUser.getPassword());
					} catch (Exception e) {
						log.error("Password invalida");
						throw new BadCredentialsException("Password invalida");
					}

					if (equals) {
						userServicesImpl.updateAttempts(currentUser.getId(), 3);
						authentication = new UsernamePasswordAuthenticationToken(
								currentUser, auth.getCredentials(),
								getAuthorities(currentUser));
					} else {
						int attemps = currentUser.getAttempts();
						attemps = attemps - 1;
						userServicesImpl.updateAttempts(currentUser.getId(),
								attemps);
						if (attemps == 0) {
							userServicesImpl.updateStatus(currentUser.getId(),
									StatusEnum.BLOCKED_USER.getCode());
							log.error("Password invalida, cuenta bloqueada");
							throw new DisabledException(
									"Password invalida, Cuenta bloqueada");
						} else {
							log.error("Password invalida");
							throw new BadCredentialsException(
									"Password invalida");
						}
					}
				} else {
					log.error("Cuenta Bloqueada");
					throw new LockedException("Cuenta Bloqueada");
				}
			} else {
				log.error("User does not exists!");
				throw new BadCredentialsException("Usuario No existe");
			}
		} else {
			currentUser = userServicesImpl.getUser("commerce");
			if (currentUser != null) {
				if (currentUser.getStatus() != StatusEnum.BLOCKED_USER
						.getCode() && currentUser.getAttempts() > 0) {
					if (currentUser.getStatus() == StatusEnum.PENDING_CONFIRMATION
							.getCode()) {
						if (new Date().after(currentUser
								.getTimePassExpiration())) {
							log.error("Credenciales Expiradas");
							throw new CredentialsExpiredException(
									"Credenciales Expiradas");
						}
					}
					log.info("user: username " + auth.getName());
					log.info("user: pass " + auth.getCredentials());
					Boolean equals = false;
					try {
						
						//equals = true;
						/*
						equals = ValidacionServicioUtils.sendPost(
								String.valueOf(auth.getName()),
								String.valueOf(auth.getCredentials()));
						*/
						
						equals = ValidacionLoginLdapServicio.ValidarloginPost(
								String.valueOf(auth.getName()),
								String.valueOf(auth.getCredentials()));
								
						
						log.info("equals: pass " + equals);
					} catch (Exception e) {
						log.error("Password invalida");
						throw new BadCredentialsException("Password invalida");
					}

					if (equals) {
						// userServicesImpl.updateAttempts(currentUser.getId(),
						// 3);
						authentication = new UsernamePasswordAuthenticationToken(
								currentUser, auth.getCredentials(),
								getAuthorities(currentUser));
					} else {
						log.error("Password invalida");
						throw new BadCredentialsException("Password invalida");
					}
				} else {
					log.error("Cuenta Bloqueada");
					throw new LockedException("Cuenta Bloqueada");
				}
			} else {
				log.error("User does not exists!");
				throw new BadCredentialsException("Usuario No existe");
			}
		}
		
		
		String response = auth.getName();
		
		log.info("response=!"+response);

		// insercion de logeos
		String ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		systemLogServicesImpl.addSystemLog(currentUser.getId().intValue(), LogEnum.LOG_USERLOGGED.getCode(), "User Logged In Front End " + currentUser.getName(), response, "-" , "-", "-", ipAddress, currentDate );
		
		
		return authentication;
		
		
		
		/*
		UserDTO currentUser;
		UsernamePasswordAuthenticationToken authentication = null;
		
		currentUser = userServicesImpl.getUser(auth.getName());
		if(currentUser!=null){
			if(currentUser.getStatus() != StatusEnum.BLOCKED_USER.getCode() && currentUser.getAttempts()>0){
				if(currentUser.getStatus() == StatusEnum.PENDING_CONFIRMATION.getCode() ){
					if(new Date().after(currentUser.getTimePassExpiration())){
						log.error("Credenciales Expiradas");
						throw new CredentialsExpiredException("Credenciales Expiradas");
					}
				}
				
				Boolean equals=false;
				try {
					equals=MD5HashingUtils.compare(auth.getCredentials().toString(), currentUser.getPassword());
				} catch (Exception e) {
					log.error("Password invalida");
					throw new BadCredentialsException("Password invalida");
				}
				
				if(equals){
					userServicesImpl.updateAttempts(currentUser.getId(), 3);
					authentication = new UsernamePasswordAuthenticationToken(currentUser, auth.getCredentials(), getAuthorities(currentUser));
				}else{
					int attemps = currentUser.getAttempts();
					attemps = attemps -1;
					userServicesImpl.updateAttempts(currentUser.getId(), attemps);
					if(attemps==0){
						userServicesImpl.updateStatus(currentUser.getId(), StatusEnum.BLOCKED_USER.getCode());
						log.error("Password invalida, cuenta bloqueada");
						throw new DisabledException("Password invalida, Cuenta bloqueada");
					}else{
						log.error("Password invalida");
						throw new BadCredentialsException("Password invalida");
					}
				}
			}else{
				log.error("Cuenta Bloqueada");
				throw new LockedException("Cuenta Bloqueada");
			}
		}else{
			log.error("User does not exists!");
			throw new BadCredentialsException("Usuario No existe");
		}
		// insercion de logeos
		String ipAddress = null;
		try {
			ipAddress = InetAddress.getLocalHost().getHostAddress();
		} catch (UnknownHostException e1) {
					// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		systemLogServicesImpl.addSystemLog(currentUser.getId().intValue(), LogEnum.LOG_USERLOGGED.getCode(), "User Logged In Front End " + currentUser.getName(), "", "-" , "-", "-", ipAddress, currentDate );
		return authentication;
		*/
		
	}

	private Collection<SimpleGrantedAuthority> getAuthorities(UserDTO user) {
		List<SimpleGrantedAuthority> authList = new ArrayList<SimpleGrantedAuthority>(
				user.getRoles().size());
		for (int i = 0; i < user.getRoles().size(); i++) {
			authList.add(new SimpleGrantedAuthority(user.getRoles().get(i)
					.getRole()));
		}
		return authList;
	}
}
