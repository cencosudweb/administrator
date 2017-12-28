
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

import com.cencosud.administrator.core.ChannelServices;
import com.cencosud.administrator.dao.ChannelDao;
import com.cencosud.administrator.dao.domain.Channel;
import com.cencosud.administrator.dto.users.ChannelDTO;
/**
 * @description 
 */
@Repository
public class ChannelServicesImpl extends BaseServicesImpl implements ChannelServices{

	@Autowired
	private ChannelDao channelDaoImpl;
	
	private static Logger log = Logger.getLogger(ChannelServicesImpl.class);
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ChannelDTO> getChannels() {
		List<ChannelDTO> result = new ArrayList<ChannelDTO>();
		
		List<Channel> channels;
		try {
			
			channels = channelDaoImpl.getChannels();
			if(channels != null && !channels.isEmpty()){
				result = (List<ChannelDTO>) mapper.map(channels, List.class);
			}

		} catch (Exception e) {
			log.error("Error inesperado", e);
		}
		
		return result;
	}

	
}
