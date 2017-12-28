/**
 *@name SystemLogDaoImpl.java
 * 
 *@version 1.0 
 * 
 *@date 04-05-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.hibernate.exception.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.SystemLogDao;
import com.cencosud.administrator.dao.domain.SystemLog;

/**
 * @description 
 */

@Repository
public class SystemLogDaoImpl implements SystemLogDao {
	
	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	public List<SystemLog> getSystemLog(int idUser, String description, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(SystemLog.class);
		cr.add(Restrictions.ne("iduser", 1));
		//cr.add(Restrictions.ne("username", "admin"));
		if(idUser != 0 ){
			cr.add(Restrictions.eq("iduser", idUser));
		}
		
		if(description != null ){
			cr.add(Restrictions.like("description", description, MatchMode.END));//AND campo LIKE '%'
		}
		cr.addOrder(Order.desc("creationdate"));
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		return (List<SystemLog>) cr.list();
	}

	@Override
	public SystemLog getSystemLogId(Long systemLogId) {
		// TODO Auto-generated method stub
		return (SystemLog) sessionFactory.getCurrentSession().get(SystemLog.class, systemLogId);
	}
	
	@Override
	public void addSystemLog(int iduser, int loglevel, String action,
			String description, String data, String tablename, String pagename,
			String ipaddress, String creationdate) {
		// TODO Auto-generated method stub
		String sql = "INSERT into system_log (iduser, loglevel, action, description, data, tablename, pagename, ipaddress, creationdate, agent) "
				+ ""
				+ "values("+iduser+","+loglevel+",'"+action+"','"+description+"','"+data+"','"+tablename+"','"+pagename+"','"+ipaddress+"','"+creationdate+"',"+"1"+")";
		
			try {
			
			Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
			/*query.setParameter("iduser", iduser);
			query.setParameter("loglevel", loglevel);
			query.setParameter("action", action);
			query.setParameter("description", description);
			query.setParameter("data", data);
			query.setParameter("tablename", tablename);
			query.setParameter("pagename", pagename);
			query.setParameter("ipaddress", ipaddress);
			query.setParameter("creationdate", creationdate);
			
			*/query.executeUpdate();
			
		} catch (ConstraintViolationException ex) {
			/*Relacion ya existe*/
		}
	}
	
	
	
	@Override
	public Long getCounts(int idUser, String description) {
		// TODO Auto-generated method stub
		
		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(SystemLog.class);
		
		
		if(idUser != 0 ){
			cr.add(Restrictions.eq("iduser", idUser));//AND campo LIKE '%'
		}
		
		if(description != null ){
			cr.add(Restrictions.like("description", description, MatchMode.END));//AND campo LIKE '%'
		}
		
		//cr.add( Restrictions.eq("isStudent", true));
		cr.setProjection(Projections.rowCount());
		//int count = (int)cr.uniqueResult();
		Long count = (Long) cr.uniqueResult();
		//long count = ((Long)sessionFactory.getCurrentSession().createQuery("select count(*) from CuadraturaOrdenDeCompraStock").uniqueResult()).intValue();
		

		return count;
	}

	

	@SuppressWarnings("unchecked")
	public List<SystemLog> getSystemLog2() {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(SystemLog.class);
		return (List<SystemLog>) cr.list();
	}

	

}
