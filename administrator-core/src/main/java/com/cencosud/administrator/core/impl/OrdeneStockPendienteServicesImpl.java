
/**
 *@name ChannelServicesImpl.java
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
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.OrdeneStockPendienteServices;
import com.cencosud.administrator.dao.OrdeneStockPendienteDao;
import com.cencosud.administrator.dao.domain.OrdeneStockPendiente;
import com.cencosud.administrator.dto.users.OrdeneStockPendienteDTO;
/**
 * @description 
 */
@Repository
public class OrdeneStockPendienteServicesImpl extends BaseServicesImpl implements OrdeneStockPendienteServices{

	@Autowired
	private OrdeneStockPendienteDao ordeneStockPendienteDaoImpl;
	
	private static Logger log = Logger.getLogger(OrdeneStockPendienteServicesImpl.class);

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<OrdeneStockPendienteDTO> getOrdeneStockPendientes(String fechaIni, String fechaFin, int orden,
			String nroDeLinea, String doDtlStatus, String tipoOrden, String pedido, String cantidadPendiente,
			String bodega, String statCode, int estado, String equalsQhpdDespacha, int start, int limit) {
		// TODO Auto-generated method stub
		List<OrdeneStockPendienteDTO> result = new ArrayList<OrdeneStockPendienteDTO>();
		
		List<OrdeneStockPendiente> ordenes;
		try {
			
			ordenes = ordeneStockPendienteDaoImpl.getOrdeneStockPendientes(fechaIni, fechaFin, orden, nroDeLinea, doDtlStatus, tipoOrden, pedido, cantidadPendiente, bodega, statCode, estado, equalsQhpdDespacha, start, limit);
			if(ordenes != null && !ordenes.isEmpty()){
				result = (List<OrdeneStockPendienteDTO>) mapper.map(ordenes, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
	

	
}
