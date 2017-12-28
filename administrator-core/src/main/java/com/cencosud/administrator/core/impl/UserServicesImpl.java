
/**
 *@name UserServicesImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.UserServices;
import com.cencosud.administrator.core.email.AdministratorMailSender;
import com.cencosud.administrator.core.enums.RoleEnum;
import com.cencosud.administrator.core.enums.StatusEnum;
import com.cencosud.administrator.core.util.DateConverter;
import com.cencosud.administrator.core.util.MD5HashingUtils;
import com.cencosud.administrator.core.util.PasswordGenerator;
import com.cencosud.administrator.utils.OperationResult;
import com.cencosud.administrator.dao.QuestionDao;
import com.cencosud.administrator.dao.RoleDao;
import com.cencosud.administrator.dao.UserDao;
import com.cencosud.administrator.dao.domain.QuestionAnswer;
import com.cencosud.administrator.dao.domain.User;
import com.cencosud.administrator.dto.users.QuestionAnswerDTO;
import com.cencosud.administrator.dto.users.RoleDTO;
import com.cencosud.administrator.dto.users.UserDTO;

/**
 * @description 
 */
@Repository
public class UserServicesImpl extends BaseServicesImpl implements UserServices {

	@Autowired
	private UserDao userDaoImpl;
	
	@Autowired
	private RoleDao roleDaoImpl;
	
	@Autowired
	private QuestionDao questionDaoImpl;
	
	@Autowired
	private AdministratorMailSender administratorMailSender;
	
	@Autowired
	private Integer	hoursAddExpiration;
	
	@Autowired
	private Integer	passwordLength;
	
	private static Logger log = Logger.getLogger(UserServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<UserDTO> getUsers() {
		List<UserDTO> result = new ArrayList<UserDTO>();

		List<User> users;
		try {

			users = userDaoImpl.getAllUsers();
			result = (List<UserDTO>) mapper.map(users, List.class);

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult addUser(UserDTO user) {
		OperationResult result = new OperationResult();
		
		User userDestination;
		try {
			
			//generar password ramdom
			String ramdomPass = PasswordGenerator.randomPassword(passwordLength);
			user.setPassword(MD5HashingUtils.encrypt(ramdomPass));
			user.setPasswordNonEncripted(ramdomPass);
			user.setAttempts(UserDTO.MAX_ATTEMPTS);
			user.setStatus(StatusEnum.PENDING_CONFIRMATION.getCode());
			user.addRole(new RoleDTO(RoleEnum.ROLE_PENDING.getId()));
			user.setTimePassExpiration(DateConverter.getTimePassExiration(hoursAddExpiration));
			
			userDestination = mapper.map(user, User.class);
			userDaoImpl.addUser(userDestination);
			
			//Si toda va bien, enviar mail
			administratorMailSender.sendPassword(user.getModel())/*.get(10, TimeUnit.SECONDS)*/;
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario registrado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al registrar producto");
		}
		
		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult deleteUser(Long userId) {
		OperationResult result = new OperationResult();
		
		try {
			userDaoImpl.deleteUser(userId);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario eliminado exitosamente");
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al eliminar usuario");
		}
		
		return result;

	}

	@Override
	@Transactional
	public UserDTO getUser(Long userId) {
		UserDTO userDestination = null;
		try {
			User userSource = userDaoImpl.getUser(userId);
			if(userSource!=null)
				userDestination = mapper.map(userSource, UserDTO.class);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return userDestination;
	}
/*
	@Override
	@Transactional(readOnly = false)
	public OperationResult editUser(UserDTO user) {
		OperationResult result = new OperationResult();
		
		User userDestination;
		try {
			userDestination = mapper.map(user, User.class);
			userDaoImpl.editUser(userDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar usuario");
		}
		
		return result;

	}
	*/
	@Override
	@Transactional(readOnly = false)
	public OperationResult editUser(UserDTO user) {
		OperationResult result = new OperationResult();
		
		User userDestination;
		try {
			userDestination = userDaoImpl.getUser(user.getId());
			if(StringUtils.isNotBlank(user.getEmail()))
				userDestination.setEmail(user.getEmail());
			if(StringUtils.isNotBlank(user.getName()))
				userDestination.setName(user.getName());
			if(StringUtils.isNotBlank(user.getPhone()))
				userDestination.setPhone(user.getPhone());
			
			userDaoImpl.editUser(userDestination);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Usuario modificado exitosamente");

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al modificar usuario");
		}
		
		return result;

	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<UserDTO> getUsersByStatus(int status) {
		List<UserDTO> result = new ArrayList<UserDTO>();

		List<User> users;
		try {

			users = userDaoImpl.getAllUsers(status);
			result = (List<UserDTO>) mapper.map(users, List.class);

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult changePassword(Long userId, String newPassword, String oldPassword) {
		
		OperationResult result = new OperationResult();
		
		User user;
		
		try {
			user = userDaoImpl.getUser(userId);
			
			if(user != null){
				if(MD5HashingUtils.compare(user.getPassword(), oldPassword)){
				
					String newPasswordEncripted = MD5HashingUtils.encrypt(newPassword);
					
					userDaoImpl.changePassword(userId, newPasswordEncripted);
					
					//quitar estado pending
					roleDaoImpl.deleteRoleForUser(userId, RoleEnum.ROLE_PENDING.getId());
					
					//cambiar estado a desbloqueado
					userDaoImpl.updateStatus(userId, StatusEnum.UNBLOCKED_USER.getCode());
					
					result.setResult(OperationResult.SUCCESS);
					result.setMessage("Cambio de password realizado exitosamente");
					
				}else{
					result.setResult(OperationResult.ERROR);
					result.setMessage("Password actual ingresado no es valido");
				}
				
				
			}else {
				result.setResult(OperationResult.ERROR);
				result.setMessage("Usuario no encontrado para el id dado");
			}
			
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar password de usuario");
		}
		
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult changePasswordLoggedUser(Long userId, String newPassword, String oldEncryptedPassword) {
		
		OperationResult result = new OperationResult();
		
		User user;
		
		try {
			user = userDaoImpl.getUser(userId);
			
			if(user != null){
				if(oldEncryptedPassword != null && oldEncryptedPassword.equals(user.getPassword())){
				
					String newPasswordEncripted = MD5HashingUtils.encrypt(newPassword);
					
					userDaoImpl.changePassword(userId, newPasswordEncripted);
					
					//quitar estado pending
					roleDaoImpl.deleteRoleForUser(userId, RoleEnum.ROLE_PENDING.getId());
					
					//cambiar estado a desbloqueado
					userDaoImpl.updateStatus(userId, StatusEnum.UNBLOCKED_USER.getCode());
					
					result.setResult(OperationResult.SUCCESS);
					result.setMessage("Cambio de password realizado exitosamente");
					
				}else{
					result.setResult(OperationResult.ERROR);
					result.setMessage("Password actual ingresado no es valido");
				}
				
				
			}else {
				result.setResult(OperationResult.ERROR);
				result.setMessage("Usuario no encontrado para el id dado");
			}
			
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar password de usuario");
		}
		
		return result;
	}
	
	@Override
	@Transactional(readOnly = false)
	public OperationResult resetPassword(Long userId) {
		
		OperationResult result = new OperationResult();
		
		User user;
		
		try {
			user = userDaoImpl.getUser(userId);
			
			if(user != null){
				String newPassword = PasswordGenerator.randomPassword(passwordLength);
				String newPasswordEncripted = MD5HashingUtils.encrypt(newPassword);
				
				UserDTO userDestination = mapper.map(user, UserDTO.class);
				userDestination.setPasswordNonEncripted(newPassword);
				
				userDaoImpl.resetPassword(userId, newPasswordEncripted, UserDTO.MAX_ATTEMPTS, StatusEnum.PENDING_CONFIRMATION.getCode(), DateConverter.getLongTimePassExiration(hoursAddExpiration));
				
				//setear estado pending
				roleDaoImpl.addRoleForUser(userId, RoleEnum.ROLE_PENDING.getId());
				
				//eliminar preguntas secretas
				questionDaoImpl.deleteQuestionAnswerForUser(userId);
				
				//Si toda va bien, enviar mail
				administratorMailSender.sendResetPassword(userDestination.getModel());
				
				result.setResult(OperationResult.SUCCESS);
				result.setMessage("Cambio de password realizado exitosamente");
					
				
			}else {
				result.setResult(OperationResult.ERROR);
				result.setMessage("Usuario no encontrado para el id dado");
			}
			
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar password de usuario");
		}
		
		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult updateAttempts(Long userId, int attempt) {
		OperationResult result = new OperationResult();
		
		try {
					
			userDaoImpl.updateAttempts(userId, attempt);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Numero de intento actualizado exitosamente");
					
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al actualizar numero de intentos de usuario");
		}
		
		return result;
	}

	@Override
	@Transactional(readOnly = false)
	public OperationResult updateStatus(Long userId, int status) {
		OperationResult result = new OperationResult();
		
		try {
					
			userDaoImpl.updateStatus(userId, status);
			
			result.setResult(OperationResult.SUCCESS);
			result.setMessage("Estado de usuario actualizado exitosamente");
					
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al cambiar estado de usuario");
		}
		
		return result;
	}

	@Override
	@Transactional
	public UserDTO getUser(String username) {
		UserDTO userDestination = null;
		try {
			User userSource = userDaoImpl.getUser(username);
			if(userSource!=null)
				userDestination = mapper.map(userSource, UserDTO.class);	
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return userDestination;
	}

	
	@Override
	@Transactional
	public boolean validateUsernameAvailability(String username) {
		boolean available = false;
		try {
			available = userDaoImpl.validateUsernameAvailability(username);
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return available;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional(readOnly=false)
	public OperationResult addSecretQuestionsAnswers(Long userId, List<QuestionAnswerDTO> questionsAnswers) {
		OperationResult result = new OperationResult();
		
		try {
					
			User userSource = userDaoImpl.getUser(userId);
			if(userSource != null){
				
				Set<QuestionAnswer> qas = new HashSet<QuestionAnswer>(0);
				qas = (Set<QuestionAnswer>) mapper.map(questionsAnswers, Set.class);
				
				userSource.setQas(qas);
				
				userDaoImpl.editUser(userSource);
				
				result.setResult(OperationResult.SUCCESS);
				result.setMessage("Preguntas y respuestas secretas agregadas exitosamente");
				
			}else{
				result.setResult(OperationResult.ERROR);
				result.setMessage("Usuario no existe");
			}
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setExcepcion(e);
			result.setResult(OperationResult.ERROR);
			result.setMessage("Error al agregar preguntas y respuestas secretas");
		}
		
		return result;
	}

	@Override
	@Transactional
	public UserDTO getUserByRut(String rut) {
		UserDTO userDestination = null;
		try {
			User userSource = userDaoImpl.getUserByRut(rut);
			if(userSource!=null)
				userDestination = mapper.map(userSource, UserDTO.class);	
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return userDestination;
	}

	@Override
	@Transactional
	public UserDTO getUserByEmail(String email) {
		UserDTO userDestination = null;
		try {
			User userSource = userDaoImpl.getUserByEmail(email);
			if(userSource!=null)
				userDestination = mapper.map(userSource, UserDTO.class);	
			
		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		return userDestination;
	}

}
