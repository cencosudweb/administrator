/**
 *@name UserDao.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao;

import java.util.List;

import com.cencosud.administrator.dao.domain.User;
/**
 * @description Interface  
 */
public interface UserDao {

	public List<User> getAllUsers();
	public List<User> getAllUsers(int estado);
	public void addUser(User user);
	public void deleteUser(Long userId);
	public User getUser(Long userId);
	public User getUser(String username);
	public User getUserByRut(String rut);
	public User getUserByEmail(String email);
	public void editUser(User user);
	public void changePassword(Long userId, String password);
	public void resetPassword(Long userId, String password, int attempts, int status, long timePassExpiration) ;
	public void updateAttempts(Long userId, int attempt);
	public void updateStatus(Long userId, int status);
	public boolean validateUsernameAvailability(String username);
	
	
}
