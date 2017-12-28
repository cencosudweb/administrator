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

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.PautaDao;
import com.cencosud.administrator.dao.domain.Contratante;
import com.cencosud.administrator.dao.domain.Estado;
import com.cencosud.administrator.dao.domain.Gerente;
import com.cencosud.administrator.dao.domain.Padrino;
import com.cencosud.administrator.dao.domain.Pauta;
import com.cencosud.administrator.dao.domain.Soporte;
import com.cencosud.administrator.dao.domain.Tienda;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class PautaDaoImpl implements PautaDao {

	@Autowired
	private SessionFactory sessionFactory;
	

	@SuppressWarnings("unchecked")
	@Override
	public List<Pauta> getPautas() {
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Pauta.class);
			//cr.add(Restrictions.eq("id", userId));
		return (List<Pauta>) cr.list();
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<Pauta> getPautas(Tienda tienda, Padrino padrino, Gerente gerente, Contratante contratante,
			Soporte soporte, Estado estado, String starttime, int start, int limit) {
		// TODO Auto-generated method stub
		//Date now = new Date();
		//SimpleDateFormat cc_yearmonth = new SimpleDateFormat("yyyy-MM-dd");
		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(Pauta.class);
		//cr.add(Restrictions.ne("username", "admin"));
		/*if(cardID != null){
			cr.add(Restrictions.eq("card_id", cardID));
		} 
		*/
		if(tienda != null ){
			cr.add(Restrictions.eq("tienda", tienda));
		}
		
		if(padrino != null ){
			cr.add(Restrictions.eq("padrino", padrino));
		}
		
		if(gerente != null ){
			cr.add(Restrictions.eq("gerente", gerente));
		}
		
		if(contratante != null ){
			cr.add(Restrictions.eq("contratante", contratante));
		}
		
		if(soporte != null ){
			cr.add(Restrictions.eq("soporte", soporte));
		}
		
		if(estado != null ){
			cr.add(Restrictions.eq("estado", estado));
		}
	
		/*
		if(starttime != null ){
			cr.add(Restrictions.eq("fechaVisita", starttime));//=
		} else {
			cr.add(Restrictions.eq("fechaVisita", cc_yearmonth.format(now)));//=
			//cr.add(Restrictions.gt("starttime", starttime));//>
		}
		*/

		
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		
		return (List<Pauta>) cr.list();
	}

	@Override
	public int getCountPautas(Tienda tienda, Padrino padrino, Gerente gerente, Contratante contratante,
			Soporte soporte, Estado estado, String starttime) {
		// TODO Auto-generated method stub
		Date now = new Date();
		SimpleDateFormat cc_yearmonth = new SimpleDateFormat("yyyy-MM-dd");
		String yearmonth =  cc_yearmonth.format(now);
		
		String sql = " SELECT COUNT(*) FROM pautas c WHERE  1 = 1 ";
		if(tienda !=null){
			sql += " AND c.id_tienda = :tienda";
			
		}
		
		if(padrino !=null){
			sql += " AND c.id_padrino = :padrino";
		}
		
		if(gerente != null ){
			sql += " AND c.id_gerente = :gerente";
		}
		
		if(contratante != null ){
			sql += " AND c.id_contratante = :contratante";
		}
		if(soporte != null ){
			sql += " AND c.id_soporte = :soporte";
		}
		
		if(estado != null ){
			sql += " AND c.id_estado = :estado";
		}
		
		if(starttime != null){
			
			sql += " AND c.fecha_visita = :starttime";
			
		} else {
			
			sql += " AND c.fecha_visita = :yearmonth";
		}
		

		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		if(tienda !=null){
			query.setParameter("tienda", tienda);
		}
		
		if(padrino != null){
			query.setParameter("padrino", padrino);
		}

		if(starttime != null){
			query.setParameter("starttime", starttime);
		} else {
			query.setParameter("yearmonth", yearmonth);
		}
		
		if(gerente != null){
			query.setParameter("gerente", gerente);
		}
		
		if(contratante != null){
			query.setParameter("contratante", contratante);
		}
		
		if(soporte != null){
			query.setParameter("soporte", soporte);
		}
		
		if(estado != null){
			query.setParameter("estado", estado);
		}
	
		
		return query.uniqueResult().hashCode();
		
	}
	
	@Override
	public Pauta getPauta(Long pautaId) {
		// TODO Auto-generated method stub
		return (Pauta) sessionFactory.getCurrentSession().get(Pauta.class, pautaId);
	}



	@Override
	public void deletePauta(Long pautaId) {
		// TODO Auto-generated method stub
		Pauta pauta = (Pauta) sessionFactory.getCurrentSession().get(Pauta.class, pautaId);
		sessionFactory.getCurrentSession().delete(pauta);
	}

	@Override
	public void addPauta(Pauta pauta) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(pauta);
	}

	@Override
	public void editPauta(Pauta pauta) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().update(pauta);
	}

	@Override
	public int getPautaRandom(int numeroRequerimiento) {
		// TODO Auto-generated method stub
		
		String sql = " SELECT COUNT(*) FROM pautas c WHERE  1 = 1 ";
		if(numeroRequerimiento >0){
			sql += " AND c.NUMERO_REQUERIMIENTO = :numeroRequerimiento";
			
		}
		
		
		

		Query query =  sessionFactory.getCurrentSession().createSQLQuery(sql);
		
		if(numeroRequerimiento >0){
			query.setParameter("numeroRequerimiento", numeroRequerimiento);
		}
		
		
		return ((Number) query.uniqueResult()).intValue();
	}

		

}
