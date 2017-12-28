package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.UserDao;
import com.cencosud.administrator.dao.domain.User;

@Repository
public class UserDaoImpl implements UserDao {	

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers() {
		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.ne("username", "admin"));
		return (List<User>) cr.list();
		
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<User> getAllUsers(int estado) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("enabled", estado));
        return (List<User>)cr.list();
	}
	
//	@Override
//	@SuppressWarnings("unchecked")
//	public List<User> getAllUsersd(int estado) {
//		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
//		cr.add(Restrictions.eq("enabled", estado));
//		
//		
//		
//		
//        return (List<User>)cr.list();
//	}

	@Override
	public void addUser(User user) {
		sessionFactory.getCurrentSession().saveOrUpdate(user);
	}

	@Override
	public void deleteUser(Long userId) {
		User user = (User) sessionFactory.getCurrentSession().get(User.class, userId);
		sessionFactory.getCurrentSession().delete(user);
	}

	@Override
	public User getUser(Long userId) {
		return (User) sessionFactory.getCurrentSession().get(User.class, userId);
	}

	@Override
	public void editUser(User user){
		sessionFactory.getCurrentSession().update(user);
	}

	@Override
	public void changePassword(Long userId, String password) {
		String sql = "UPDATE users p " +
		"set p.password = :password "+
		"WHERE p.id = :userId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("password", password);
		query.executeUpdate();

	}
	
	@Override
	public void resetPassword(Long userId, String password, int attempts, int status, long timePassExpiration) {
		String sql = "UPDATE users p " +
		"set p.password = :password, p.attempts = :attempts, p.status = :status, p.password_expire = :timePassExpiration "+
		"WHERE p.id = :userId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("password", password);
		query.setParameter("attempts", attempts);
		query.setParameter("status", status);
		query.setParameter("timePassExpiration", timePassExpiration);
		query.executeUpdate();

	}
	
	@Override
	public void updateAttempts(Long userId, int attempt) {
		String sql = "UPDATE users p " +
		"set p.attempts = :attempts "+
		"WHERE p.id = :userId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("attempts", attempt);
		query.executeUpdate();

	}

	@Override
	public void updateStatus(Long userId, int status) {
		String sql = "UPDATE users p " +
		"set p.status = :status "+
		"WHERE p.id = :userId ";

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		query.setParameter("userId", userId);
		query.setParameter("status", status);
		query.executeUpdate();
		
	}

	@Override
	public User getUser(String username) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		//cr.add(Restrictions.eq("username", username));
		cr.add(Restrictions.eq("username", username));
        return (User)cr.uniqueResult();
	}

	@Override
	public boolean validateUsernameAvailability(String username) {
		return getUser(username) == null;
	}

	@Override
	public User getUserByRut(String rut) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("rut", rut));
        return (User)cr.uniqueResult();
	}

	@Override
	public User getUserByEmail(String email) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(User.class);
		cr.add(Restrictions.eq("email", email));
        return (User)cr.uniqueResult();
	}
}
