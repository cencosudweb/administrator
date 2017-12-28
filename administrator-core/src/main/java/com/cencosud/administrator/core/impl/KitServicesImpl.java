
/**
 *@name KitServicesImpl.java
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

import com.cencosud.administrator.core.KitServices;
import com.cencosud.administrator.core.util.MD5HashingUtils;
import com.cencosud.administrator.dao.domain.CumplimientoEstaticoWs;
import com.cencosud.administrator.dao.domain.SkuServicioWs;
import com.cencosud.administrator.dao.domain.SystemLog;
import com.cencosud.administrator.dao.domain.TipoGuia;
import com.cencosud.administrator.dao.domain.TipoOrden;
import com.cencosud.administrator.dao.domain.TipoVenta;
import com.cencosud.administrator.dao.domain.UrlCallback;
import com.cencosud.administrator.dao.domain.User;
import com.cencosud.administrator.dao.mapper.KitMapper;
import com.cencosud.administrator.dto.users.CumplimientoEstaticoWsDTO;
import com.cencosud.administrator.dto.users.SkuServicioWsDTO;
import com.cencosud.administrator.dto.users.SystemLogDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.users.UrlCallbackDTO;
import com.cencosud.administrator.dto.users.UserDTO;
import com.cencosud.administrator.dto.ws.UrlNotificationParams;
import com.cencosud.administrator.dto.ws.UrlNotificationResult;
import com.cencosud.administrator.utils.Constantes;
import com.cencosud.administrator.ws.response.BodyResp;
import com.cencosud.administrator.ws.response.RespuestaCas;

/**
 * @description
 */
@Repository
public class KitServicesImpl extends BaseServicesImpl implements KitServices {

	@Autowired
	private KitMapper kitDaoImpl;

	private static Logger log = Logger.getLogger(KitServicesImpl.class);

	@Override
	public UrlNotificationResult getUrlNotificacion(UrlNotificationParams params) {
		UrlCallbackDTO urlCallback = null;
		UrlNotificationResult result = new UrlNotificationResult();
		try {
			UrlCallback agreementSource = kitDaoImpl.getUrlCallback(params.getIdAgreement(), params.getChannel());
			if (agreementSource != null) {
				urlCallback = mapper.map(agreementSource, UrlCallbackDTO.class);
			}

			result.setUrlCallback(urlCallback);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			result.setCodError(100);
			result.setMsgError("Error inesperado");
		}
		return result;
	}

	@Override
	public BodyResp getUserLogin(String usuario, String clave) {
		// TODO Auto-generated method stub
		UserDTO user = null;
		BodyResp result = new BodyResp();
		RespuestaCas respuestaCas = new RespuestaCas();

		try {
			User userSource = kitDaoImpl.getUser(usuario, MD5HashingUtils.encrypt(clave));
			if (userSource != null) {
				user = mapper.map(userSource, UserDTO.class);
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_EXITO);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_EXITO);
				// result.setCodError(200);
				// result.setMsgError("OK");
			} else {
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR);
				// result.setCodError(404);
				// result.setMsgError("Error No hay Contenido");
			}
			result.setRespuestaCas(respuestaCas);
			result.setUser(user);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			// result.setCodError(503);
			// result.setMsgError("Error inesperado");
		}
		return result;
	}

	@Override
	public BodyResp getTipoOrden() {
		// TODO Auto-generated method stub
		TipoOrdenDTO orden = null;
		BodyResp result = new BodyResp();
		RespuestaCas respuestaCas = new RespuestaCas();

		try {
			List<TipoOrden> ordenSource = kitDaoImpl.getTipoOrden();
			if (ordenSource != null) {
				orden = mapper.map(ordenSource, TipoOrdenDTO.class);
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_EXITO);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_EXITO);
				// result.setCodError(200);
				// result.setMsgError("OK");
			} else {
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR);
				// result.setCodError(404);
				// result.setMsgError("Error No hay Contenido");
			}
			result.setRespuestaCas(respuestaCas);
			result.setOrden(orden);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			// result.setCodError(503);
			// result.setMsgError("Error inesperado");
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoOrdenDTO> getTipoOrden2() {
		// TODO Auto-generated method stub
		List<TipoOrdenDTO> result = new ArrayList<TipoOrdenDTO>();

		List<TipoOrden> tipos;
		try {

			tipos = kitDaoImpl.getTipoOrden();
			if (tipos != null && !tipos.isEmpty()) {
				result = (List<TipoOrdenDTO>) mapper.map(tipos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoVentaDTO> getTipoVenta() {
		// TODO Auto-generated method stub
		List<TipoVentaDTO> result = new ArrayList<TipoVentaDTO>();

		List<TipoVenta> tipos;
		try {

			tipos = kitDaoImpl.getTipoVenta();
			if (tipos != null && !tipos.isEmpty()) {
				result = (List<TipoVentaDTO>) mapper.map(tipos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<TipoGuiaDTO> getTipoGuia() {
		// TODO Auto-generated method stub
		List<TipoGuiaDTO> result = new ArrayList<TipoGuiaDTO>();

		List<TipoGuia> tipos;
		try {

			tipos = kitDaoImpl.getTipoGuia();
			if (tipos != null && !tipos.isEmpty()) {
				result = (List<TipoGuiaDTO>) mapper.map(tipos, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}

	@Override
	public BodyResp getCumplimientoEstaticoWs(String fechaCompromisoEom) {
		// TODO Auto-generated method stub
		CumplimientoEstaticoWsDTO cumplimiento = null;
		BodyResp result = new BodyResp();
		RespuestaCas respuestaCas = new RespuestaCas();

		try {
			CumplimientoEstaticoWs cumplimientoEstaticoWsSource = kitDaoImpl
					.getCumplimientoEstaticoWs(fechaCompromisoEom);
			if (cumplimientoEstaticoWsSource != null) {
				cumplimiento = mapper.map(cumplimientoEstaticoWsSource, CumplimientoEstaticoWsDTO.class);
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_EXITO);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_EXITO);
			} else {
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR);
			}
			result.setRespuestaCas(respuestaCas);
			result.setCumplimiento(cumplimiento);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR2);
			respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR2);
		}
		return result;
	}

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<SystemLogDTO> getLog() {
		// TODO Auto-generated method stub
		List<SystemLogDTO> result = new ArrayList<SystemLogDTO>();

		List<SystemLog> logs;
		try {

			logs = kitDaoImpl.getLog();
			if (logs != null && !logs.isEmpty()) {
				result = (List<SystemLogDTO>) mapper.map(logs, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}

		return result;
	}
	
	
	@Override
	public BodyResp getSkuServicioWs(int inumbr) {
		// TODO Auto-generated method stub
		SkuServicioWsDTO sku = null;
		BodyResp result = new BodyResp();
		RespuestaCas respuestaCas = new RespuestaCas();

		try {
			SkuServicioWs skuServicioWsSource = kitDaoImpl.getSkuServicioWs(inumbr);
			if (skuServicioWsSource != null) {
				sku = mapper.map(skuServicioWsSource, SkuServicioWsDTO.class);
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_EXITO);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_EXITO);
			} else {
				respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR);
				respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR);
			}
			result.setRespuestaCas(respuestaCas);
			result.setSku(sku);

		} catch (Exception e) {
			log.error("Error inesperado", e);
			respuestaCas.setCodigoRespuesta(Constantes.CODIGO_ERROR2);
			respuestaCas.setDescripcionRespuesta(Constantes.MENSAJE_ERROR2);
		}
		return result;
	}

}
