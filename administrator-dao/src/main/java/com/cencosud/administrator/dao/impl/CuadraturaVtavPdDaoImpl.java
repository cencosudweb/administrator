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

import com.cencosud.administrator.dao.CuadraturaVtavPdDao;
import com.cencosud.administrator.dao.domain.CuadraturaVtavPd;

/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class CuadraturaVtavPdDaoImpl implements CuadraturaVtavPdDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<CuadraturaVtavPd> getCuadraturaVtavConPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario) {
		// TODO Auto-generated method stub
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
 		String dateFormat = ft.format(now);
 		
 		
		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CuadraturaVtavPd.class);

		if(fechaIni != null ){
			cr.add(Restrictions.ge("fechaCreacion", fechaIni));//>=
		} else {
			cr.add(Restrictions.ge("fechaCreacion", dateFormat+" 00:00:00"));//>=
		}
		
		if(fechaTer != null ){
			cr.add(Restrictions.le("fechaCreacion", fechaTer));//<=
		} else {
			cr.add(Restrictions.le("fechaCreacion", dateFormat+" 23:59:59"));//<=
		}
		
		if(tipo_venta > 0 ){
			cr.add(Restrictions.eq("tipoVenta", tipo_venta));//=
		} 
		
		if(tipoNumeroDistribuicion > 0 ){
			cr.add(Restrictions.eq("tipoNumeroDistribuicion", tipoNumeroDistribuicion));//=
		}
		
		if(horario > 0 ){
			cr.add(Restrictions.eq("horario", horario));//=
		}
		
		
		return (List<CuadraturaVtavPd>) cr.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<CuadraturaVtavPd> getCuadraturaVtavSinPds(String fechaIni, String fechaTer, int tipo_venta, int tipoNumeroDistribuicion, int horario) {
		// TODO Auto-generated method stub
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
 		String dateFormat = ft.format(now);
 		
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(CuadraturaVtavPd.class);

		if(fechaIni != null ){
			cr.add(Restrictions.ge("fechaCreacion", fechaIni));//>=
		} else {
			cr.add(Restrictions.ge("fechaCreacion", dateFormat+" 00:00:00"));//>=
		}
		
		if(fechaTer != null ){
			cr.add(Restrictions.le("fechaCreacion", fechaTer));//<=
		} else {
			cr.add(Restrictions.le("fechaCreacion", dateFormat+" 23:59:59"));//<=
		}
		
		if(tipo_venta > 0 ){
			cr.add(Restrictions.eq("tipoVenta", tipo_venta));//=
		} 
		
		if(tipoNumeroDistribuicion > 0 ){
			cr.add(Restrictions.ne("tipoNumeroDistribuicion", tipoNumeroDistribuicion));//=
		}
		
		if(horario > 0 ){
			cr.add(Restrictions.ne("horario", horario));//=
		}
		
		
		return (List<CuadraturaVtavPd>) cr.list();
	}

	@Override
	public int getCountConOd(String fechaIni, String fechaTer, int tipoVenta, int tipoNumeroDistribuicion,
			int horario) {
		// TODO Auto-generated method stub
		
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
 		String dateFormat = ft.format(now);
 		
 		
		String sql = " SELECT COUNT(*) FROM cuadratura_vtav_pd ESV  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.fecha_creacion >= :fechaIni";
		} else {
			sql += " AND ESV.fecha_creacion >= "+dateFormat+" 00:00:00";
		}
		
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.fecha_creacion <= :fechaTer";
		} else {
			sql += " AND ESV.fecha_creacion <= "+dateFormat+" 23:59:59";
		}
		
		if (tipoVenta != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.tipo_venta = :tipoVenta";
		}
		
		if (tipoNumeroDistribuicion != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.tipo_numero_distribuicion = :tipoNumeroDistribuicion";
		}
		
		if (horario != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.horario = :horario";
		}

		
		
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}
		
		if (tipoVenta != 0) {
			query.setParameter("tipoVenta", tipoVenta);
		}
		
		if (tipoNumeroDistribuicion != 0) {
			query.setParameter("tipoNumeroDistribuicion", tipoNumeroDistribuicion);
		}
		
		if (horario != 0) {
			query.setParameter("horario", horario);
		}
		
		
		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}
	
	
	
	@Override
	public int getCountSinOd(String fechaIni, String fechaTer, int tipoVenta, int tipoNumeroDistribuicion,
			int horario) {
		// TODO Auto-generated method stub
		Date now = new Date();
 		SimpleDateFormat ft = new SimpleDateFormat ("yyyy-MM-dd");
 		String dateFormat = ft.format(now);
 		
		String sql = " SELECT COUNT(*) FROM cuadratura_vtav_pd ESV  where 1 = 1 ";

		if (fechaIni != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.fecha_creacion >= :fechaIni";
		} else {
			sql += " AND ESV.fecha_creacion >= "+dateFormat+" 00:00:00";
		}
		
		if (fechaTer != null) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.fecha_creacion <= :fechaTer";
		} else {
			sql += " AND ESV.fecha_creacion <= "+dateFormat+" 23:59:59";
		}
		
		if (tipoVenta != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.tipo_venta = :tipoVenta";
		}
		
		if (tipoNumeroDistribuicion != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.tipo_numero_distribuicion != :tipoNumeroDistribuicion";
		}
		
		if (horario != 0) {
			// sql += " AND c.calldate >= :starttime";
			// Mysql-Sql Server-PostgreSql-Oracle
			sql += " AND ESV.horario != :horario";
		}

		
		
		

		Query query = sessionFactory.getCurrentSession().createSQLQuery(sql);

		if (fechaIni != null) {
			query.setParameter("fechaIni", fechaIni);
		}
		
		if (fechaTer != null) {
			query.setParameter("fechaTer", fechaTer);
		}
		
		if (tipoVenta != 0) {
			query.setParameter("tipoVenta", tipoVenta);
		}
		
		if (tipoNumeroDistribuicion != 0) {
			query.setParameter("tipoNumeroDistribuicion", tipoNumeroDistribuicion);
		}
		
		if (horario != 0) {
			query.setParameter("horario", horario);
		}
		
		
		return ((Number) query.uniqueResult()).intValue();

		// return query.uniqueResult().hashCode();
	}
	
	

	

}
