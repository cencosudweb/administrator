/**
 *@name KitServices.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.core;

import java.util.List;

import com.cencosud.administrator.dto.users.SystemLogDTO;
import com.cencosud.administrator.dto.users.TipoGuiaDTO;
import com.cencosud.administrator.dto.users.TipoOrdenDTO;
import com.cencosud.administrator.dto.users.TipoVentaDTO;
import com.cencosud.administrator.dto.ws.UrlNotificationParams;
import com.cencosud.administrator.dto.ws.UrlNotificationResult;
import com.cencosud.administrator.ws.response.BodyResp;

/**
 * @description 
 */
public interface KitServices {
	
	public UrlNotificationResult getUrlNotificacion(UrlNotificationParams params);
	public BodyResp getUserLogin(String usuario, String clave);
	public BodyResp getTipoOrden();
	public List<TipoOrdenDTO> getTipoOrden2();
	public List<TipoVentaDTO> getTipoVenta();
	public List<TipoGuiaDTO> getTipoGuia();

	public BodyResp getCumplimientoEstaticoWs(String fechaCompromisoEom);
	
	public List<SystemLogDTO> getLog();
	
	public BodyResp getSkuServicioWs(int inumbr);
}
