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
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.HorarioActualizacionStockDao;
import com.cencosud.administrator.dao.domain.HorarioActualizacionStock;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class HorarioActualizacionStockDaoImpl implements HorarioActualizacionStockDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<HorarioActualizacionStock> getHorarioActualizacionStocks(int start, int limit) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(HorarioActualizacionStock.class);
			//cr.add(Restrictions.eq("id", userId));
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fecha"));
		return (List<HorarioActualizacionStock>) cr.list();
	}

}
