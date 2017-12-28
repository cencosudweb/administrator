package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.TipoVentaServices;
import com.cencosud.administrator.dao.TipoVentaDao;
import com.cencosud.administrator.dao.domain.TipoVenta;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class TipoVentaServicesImpl extends BaseServicesImpl implements TipoVentaServices{

	@Autowired
	private TipoVentaDao tipoVentaDaoImpl;
	
	private static Logger log = Logger.getLogger(TipoVentaServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoVentaDTO> getTipoVentas() {
		List<TipoVentaDTO> result = new ArrayList<TipoVentaDTO>();
		
		List<TipoVenta> tipoVentas;
		try {
			
			tipoVentas = tipoVentaDaoImpl.getTipoVentas();
			if(tipoVentas != null && !tipoVentas.isEmpty()){
				result = (List<TipoVentaDTO>) mapper.map(tipoVentas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
