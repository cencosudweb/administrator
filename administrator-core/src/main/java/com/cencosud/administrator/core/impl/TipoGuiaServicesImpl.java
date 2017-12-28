package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.TipoGuiaServices;
import com.cencosud.administrator.dao.TipoGuiaDao;
import com.cencosud.administrator.dao.domain.TipoGuia;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class TipoGuiaServicesImpl extends BaseServicesImpl implements TipoGuiaServices{

	@Autowired
	private TipoGuiaDao tipoGuiaDaoImpl;
	
	private static Logger log = Logger.getLogger(TipoGuiaServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoGuiaDTO> getTipoGuias() {
		List<TipoGuiaDTO> result = new ArrayList<TipoGuiaDTO>();
		
		List<TipoGuia> tipoGuias;
		try {
			
			tipoGuias = tipoGuiaDaoImpl.getTipoGuias();
			if(tipoGuias != null && !tipoGuias.isEmpty()){
				result = (List<TipoGuiaDTO>) mapper.map(tipoGuias, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
