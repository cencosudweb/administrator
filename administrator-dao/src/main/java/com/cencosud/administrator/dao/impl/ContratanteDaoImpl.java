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
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.ContratanteDao;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Gerente;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class ContratanteDaoImpl implements ContratanteDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Contratante> getContratantes(Gerente gerente) {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Contratante.class);
			//cr.add(Restrictions.eq("id", userId));
		
		if(gerente != null ){
			cr.add(Restrictions.eq("gerente", gerente));
		}
		return (List<Contratante>) cr.list();
	}

	@Override
	public Contratante getContratantesId(Long id) {
		// TODO Auto-generated method stub
		return (Contratante) sessionFactory.getCurrentSession().get(Contratante.class, id);
	}

	@Override
	public void addContratante(Contratante contratante) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(contratante);
	}



	@Override
	public void deleteContratante(Long contratanteId) {
		// TODO Auto-generated method stub
		Contratante contratante = (Contratante) sessionFactory.getCurrentSession().get(Contratante.class, contratanteId);
		sessionFactory.getCurrentSession().delete(contratante);
	}

	@Override
	public void editContratante(Contratante contratante) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(contratante);
	}

}
