/**
 *@name ChannelServices.java
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

import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Interface ChannelServices
 */
public interface PadrinoServices {

	public List<PadrinoDTO> getPadrinos(TiendaDTO tienda);
	public List<PadrinoDTO> getPadrinoDescs(String description);
	public PadrinoDTO getPadrinosId(Long id);
	public PadrinoDTO getPadrino(String description);
	
	public OperationResult deletePadrino(Long padrinoId);
	public OperationResult addPadrino(PadrinoDTO padrino);
	public OperationResult editPadrino(PadrinoDTO padrino);
	
}
