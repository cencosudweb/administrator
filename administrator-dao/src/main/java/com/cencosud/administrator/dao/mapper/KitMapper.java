/**
 *@name KitMapper.java
 * 
 *@version 1.0 
 * 
 *@date 07-03-2017
 * 
 *@author EA7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.One;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.cencosud.administrator.dao.domain.Agreement;
import com.cencosud.administrator.dao.domain.Channel;
import com.cencosud.administrator.dao.domain.CumplimientoEstaticoWs;
import com.cencosud.administrator.dao.domain.SkuServicioWs;
import com.cencosud.administrator.dao.domain.SystemLog;
import com.cencosud.administrator.dao.domain.TipoGuia;
import com.cencosud.administrator.dao.domain.TipoOrden;
import com.cencosud.administrator.dao.domain.TipoVenta;
import com.cencosud.administrator.dao.domain.UrlCallback;
import com.cencosud.administrator.dao.domain.User;

/**
 * @description Interface KitMapper
 */
public interface KitMapper {

	final String SELECT_AGREEMENT_BY_ID = " SELECT * FROM agreement WHERE id = #{id} ";
	final String SELECT_URL_CALLBACK = " SELECT * FROM urls_callback where id_channel = #{idChannel} and id_agreement = #{idAgreement} ";
	final String SELECT_CHANNEL = " SELECT * FROM channels where id=#{idChannel}";
	final String SELECT_USER = " SELECT * FROM users where username=#{usuario} and password=#{clave}";
	final String SELECT_LOG = " SELECT * FROM system_log ORDER BY DESCRIPTION DESC";
	
	
	

	final String SELECT_TIPO_ORDEN = " SELECT * FROM tipo_orden ORDER BY DESCRIPTION DESC";
	final String SELECT_TIPO_VENTA = " SELECT * FROM tipo_venta ORDER BY DESCRIPTION ASC";
	final String SELECT_TIPO_GUIA = " SELECT * FROM tipo_guia ORDER BY DESCRIPTION ASC";
	final String SELECT_CUMPLIMIENTO_ESTATICO_WS = "  SELECT description_cumple, cantidad_cumple, porcentaje_cumple, description_atrasado,cantidad_atrasado,porcentaje_atrasado,description_no_cumple,cantidad_no_cumple,porcentaje_no_cumple,cantidad_total,porcentaje_total,fecha_compromiso_eom FROM cumplimiento_estatico_ws where fecha_compromiso_eom = #{fechaCompromisoEom}";
	final String SELECT_SKU_SERVICIO_WS = "  SELECT INUMBR,PRSDEP,PRSSDP,PRSCLA,PRSVND,prstip FROM sku_servicio_ws where inumbr IN ( #{inumbr} )";

	@Select(SELECT_AGREEMENT_BY_ID)
	@Results(value = { @Result(property = "id"), @Result(property = "agreementId", column = "numero_convenio"),
			@Result(property = "initDate", column = "fecha_inicio"),
			@Result(property = "endDate", column = "fecha_fin"), @Result(property = "status", column = "status"),
			@Result(property = "commerceId", column = "commerce_id") })
	Agreement getAgreement(@Param("id") Long agreementId);

	@Select(SELECT_URL_CALLBACK)
	@Results(value = { @Result(property = "id"), @Result(property = "agreementId", column = "id_agreement"),
			@Result(property = "endPath", column = "end_path"),
			@Result(property = "confirmationPath", column = "confirmation_path"),
			@Result(property = "confirmationMethod", column = "confirmation_method"),
			@Result(property = "confirmationOutput", column = "confirmation_output"),
			@Result(property = "channel", column = "id_channel", javaType = Channel.class, one = @One(select = "getChannel")) })
	UrlCallback getUrlCallback(@Param("idAgreement") Long agreementId, @Param("idChannel") Long channelId);

	@Select(SELECT_CHANNEL)
	@Results(value = { @Result(property = "id"), @Result(property = "description") })
	Channel getChannel(@Param("idChannel") Long idChannel);
	
	@Select(SELECT_USER)
	@Results(value = { @Result(property = "id"), @Result(property = "username", column = "username"),
			@Result(property = "password", column = "password"), @Result(property = "status", column = "status"),
			@Result(property = "attempts", column = "attempts"), @Result(property = "email", column = "email"),
			@Result(property = "name", column = "name"), @Result(property = "email", column = "email"),
			@Result(property = "rut", column = "rut"), @Result(property = "phone", column = "phone"),
			@Result(property = "timePassExpiration", column = "password_expire") })
	User getUser(@Param("usuario") String usuario, @Param("clave") String clave);

	@Select(SELECT_TIPO_ORDEN)
	@Results(value = { @Result(property = "id"), @Result(property = "description", column = "description") })
	// TipoOrden getTipoOrden();
	List<TipoOrden> getTipoOrden();

	@Select(SELECT_TIPO_VENTA)
	@Results(value = { @Result(property = "id"), @Result(property = "description", column = "description") })
	//TipoOrden getTipoVenta();
	List<TipoVenta> getTipoVenta();

	@Select(SELECT_TIPO_GUIA)
	@Results(value = { @Result(property = "id"), @Result(property = "description", column = "description") })
	//TipoOrden getTipoGuia();
	List<TipoGuia> getTipoGuia();

	@Select(SELECT_CUMPLIMIENTO_ESTATICO_WS)
	@Results(value = { 
			//@Result(property = "id", column = "id"),
			@Result(property = "descriptionCumple", column = "description_cumple"),
			@Result(property = "cantidadCumple", column = "cantidad_cumple"),
			@Result(property = "porcentajeCumple", column = "porcentaje_cumple"),
			@Result(property = "descriptionAtrasado", column = "description_atrasado"),
			@Result(property = "cantidadAtrasado", column = "cantidad_atrasado"),
			@Result(property = "porcentajeAtrasado", column = "porcentaje_atrasado"),
			@Result(property = "descriptionNoCumple", column = "description_no_cumple"),
			@Result(property = "cantidadNoCumple", column = "cantidad_no_cumple"),
			@Result(property = "porcentajeNoCumple", column = "porcentaje_no_cumple"),
			@Result(property = "cantidadTotal", column = "cantidad_total"),
			@Result(property = "porcentajeTotal", column = "porcentaje_total"),
			@Result(property = "fechaCompromsoEom", column = "fecha_compromiso_eom")

	})
	CumplimientoEstaticoWs getCumplimientoEstaticoWs(@Param("fechaCompromisoEom") String fechaCompromisoEom);
	
	
	@Select(SELECT_LOG)
	@Results(value = { @Result(property = "id"), @Result(property = "description", column = "description") })
	List<SystemLog> getLog();
	
	
	
	@Select(SELECT_SKU_SERVICIO_WS)
	@Results(value = { 
			//@Result(property = "id", column = "id"),
			@Result(property = "inumbr", column = "INUMBR"),
			@Result(property = "prsDep", column = "PRSDEP"),
			@Result(property = "prssDp", column = "PRSSDP"),
			@Result(property = "prsCla", column = "PRSCLA"),
			@Result(property = "prsVnd", column = "PRSVND"),
			@Result(property = "prstip", column = "prstip")
	})
	SkuServicioWs getSkuServicioWs(@Param("inumbr") int inumbr);
	
	
	
	

}
