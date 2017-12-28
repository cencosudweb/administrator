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

import com.cencosud.administrator.dto.users.ContratanteDTO;
import com.cencosud.administrator.dto.users.EstadoDTO;
import com.cencosud.administrator.dto.users.GerenteDTO;
import com.cencosud.administrator.dto.users.PadrinoDTO;
import com.cencosud.administrator.dto.users.PautaDTO;
import com.cencosud.administrator.dto.users.SoporteDTO;
import com.cencosud.administrator.dto.users.TiendaDTO;
import com.cencosud.administrator.utils.OperationResult;
/**
 * @description Interface ChannelServices
 */
public interface PautaServices {

	public List<PautaDTO> getPautas();
	public List<PautaDTO> getPautas(TiendaDTO tienda, PadrinoDTO padrino, GerenteDTO gerente, ContratanteDTO contratante, SoporteDTO soporte, EstadoDTO estado, String fecha, int start, int limit);
	public int getCountPautas(TiendaDTO tienda, PadrinoDTO padrino, GerenteDTO gerente, ContratanteDTO contratante, SoporteDTO soporte, EstadoDTO estado, String starttime);
	public int getPautaRandom(int random);
	public PautaDTO getPauta(Long pautaId);
	
	public OperationResult deletePauta(Long pautaId);
	public OperationResult addPauta(PautaDTO pauta);
	public OperationResult editPauta(PautaDTO pauta);


}
