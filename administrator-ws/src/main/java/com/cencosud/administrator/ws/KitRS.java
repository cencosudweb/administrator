/**
 * 
 */
package com.cencosud.administrator.ws;

import javax.jws.WebService;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.Response;

/**
 * @author EA7129
 *
 */

@WebService
public interface KitRS {
	
	public Response getServices(HttpServletRequest info);
	//public BodyResp getUserLogin(HttpServletRequest info, String usuario, String clave);
	//public Response autenticarSSOJson2(HttpServletRequest info, String usuario, String clave);
	public Response getUserLogin(HttpServletRequest info, String usuario, String clave);
	public Response userLogin2(HttpServletRequest info, String usuario, String clave);
	public Response getCumplimientoEstaticoWs( HttpServletRequest info, String fechaCompromisoEom, int tipoOrden, int tipoVenta, int tipoGuia );

	public Response getTipoOrden(HttpServletRequest info);
	public Response getTipoVenta(HttpServletRequest info);
	public Response getTipoGuia(HttpServletRequest info);

	public Response getSkuServicioWs( HttpServletRequest info, int inumbr );
	public Response getSkuServicioWs2( HttpServletRequest info, int inumbr );

}
