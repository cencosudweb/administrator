/**
 *@name ChannelDaoImpl.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
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
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.CuadraturaDoDao;
import com.cencosud.administrator.dao.domain.CuadraturaDo;
/**
 * @description Clase CuadraturaDoDaoImpl que implementa la interface
 */
@Repository
public class CuadraturaDoDaoImpl implements CuadraturaDoDao {

	@Autowired
	private SessionFactory sessionFactory;



	@SuppressWarnings("unchecked")
	@Override
	public List<CuadraturaDo> getCuadraturaDos(String fechaIni, String fechaTer, int estado, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CuadraturaDo.class);
		// cr.add(Restrictions.eq("id", userId));
		if (fechaIni != null) {
			cr.add(Restrictions.ge("fCreacion", fechaIni));//>=
		}

		if (fechaTer != null) {
			cr.add(Restrictions.le("fCreacion", fechaTer));///<=
		}

		

		
		if (estado != 9) {
			cr.add(Restrictions.eq("estado", estado));
		}
		
		
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fCreacion"));
		return (List<CuadraturaDo>) cr.list();
	}

	@Override
	public int getCuadraturaDoContar(String fechaIni, String fechaTer, int estado) {
		// TODO Auto-generated method stub
		String sql = " SELECT COUNT(*) FROM cuadratura_do ESV  where 1 = 1 ";
		
		
		

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.F_CREACION >= :fechaIni";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.F_CREACION <= :fechaTer";
		}
		
		
		if (estado != 9) {
			sql += " AND ESV.estado = :estado";
		}
		
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		
		

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}

		

		if ( estado != 9) {
			query.setParameter("estado",  estado);
		}
		
		

		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}

	

	

	

}
