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
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cencosud.administrator.dao.OrdeneStockPendienteDao;
import com.cencosud.administrator.dao.domain.OrdeneStockPendiente;
/**
 * @description Clase ChannelDaoImpl que implementa la interface
 */
@Repository
public class OrdeneStockPendienteDaoImpl implements OrdeneStockPendienteDao {

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdeneStockPendiente> getOrdeneStockPendientes(String fechaIni, String fechaFin, int orden,
			String nroDeLinea, String doDtlStatus, String tipoOrden, String pedido, String cantidadPendiente,
			String bodega, String statCode, int estado, String equalsQhpdDespacha, int start, int limit) {
		// TODO Auto-generated method stub
		Criteria cr = sessionFactory.getCurrentSession().createCriteria(OrdeneStockPendiente.class);
		// cr.add(Restrictions.eq("id", userId));
		if (fechaIni != null) {
			cr.add(Restrictions.ge("fechaCreacion", fechaIni));//>=
		}

		if (fechaFin != null) {
			cr.add(Restrictions.le("fechaCreacion", fechaFin));///<=
		}

		

		if (orden != 0) {
			cr.add(Restrictions.eq("orden", orden));
		}

		if (nroDeLinea != null) {
			cr.add(Restrictions.eq("nroDeLinea", nroDeLinea));
		}

		if (doDtlStatus != null) {
			cr.add(Restrictions.eq("doDtlStatus", doDtlStatus));
		}

		if (tipoOrden != null) {
			cr.add(Restrictions.eq("tipoOrden", tipoOrden));
		}
		
		if (pedido != null) {
			cr.add(Restrictions.eq("pedido", pedido));
		}
		
		if (cantidadPendiente != null) {
			cr.add(Restrictions.eq("cantidadPendiente", cantidadPendiente));
		}
		
		if (bodega != null) {
			cr.add(Restrictions.eq("bodega", bodega));
		}
		
		if (statCode != null) {
			cr.add(Restrictions.eq("statCode", statCode));
		}
		
		if (estado >= 0) {
			cr.add(Restrictions.eq("estado", estado));
		}
		
		if (equalsQhpdDespacha != null) {
			cr.add(Restrictions.eq("equalsQhpdDespacha", equalsQhpdDespacha));
		}
		cr.setFirstResult(start * 1);
		cr.setMaxResults(limit);
		cr.addOrder(Order.desc("fechaCreacion"));
		return (List<OrdeneStockPendiente>) cr.list();
	}



	

}
