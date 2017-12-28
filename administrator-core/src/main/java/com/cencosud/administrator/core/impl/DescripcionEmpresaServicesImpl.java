package com.cencosud.administrator.core.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cencosud.administrator.core.DescripcionEmpresaServices;
import com.cencosud.administrator.dao.DescripcionEmpresaDao;
import com.cencosud.administrator.dao.domain.DescripcionEmpresa;
import com.cencosud.administrator.dto.users.DescripcionEmpresaDTO;
/**
 * 
 * @authorJose
 *
 */
@Repository
public class DescripcionEmpresaServicesImpl extends BaseServicesImpl implements DescripcionEmpresaServices{

	@Autowired
	private DescripcionEmpresaDao DescripcionEmpresaDaoImpl;
	
	private static Logger log = Logger.getLogger(DescripcionEmpresaServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<DescripcionEmpresaDTO> getDescripcionEmpresas() {
		List<DescripcionEmpresaDTO> result = new ArrayList<DescripcionEmpresaDTO>();
		
		List<DescripcionEmpresa> descripcionEmpresas;
		try {
			
			descripcionEmpresas = DescripcionEmpresaDaoImpl.getDescripcionEmpresas();
			if(descripcionEmpresas != null && !descripcionEmpresas.isEmpty()){
				result = (List<DescripcionEmpresaDTO>) mapper.map(descripcionEmpresas, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
