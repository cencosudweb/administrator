/**
 *@name ValidacionServicioUtils.java
 * 
 *@version 1.0 
 * 
 *@date 13-04-2017
 * 
 *@author ea7129
 * 
 *@copyright Cencosud. All rights reserved.
 */
package com.cencosud.administrator.web.utils;

import org.apache.log4j.Logger;
//import org.hibernate.exception.DataException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
//import org.junit.Assert;

import com.fasterxml.jackson.databind.ObjectMapper;
//import com.cencosud.administrator.web.controller.account.AccountController;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;

/**
 * @description 
 */
public class ValidacionServicioUtils {
	
	 private static Logger log = Logger.getLogger(ValidacionServicioUtils.class);
	
	private final static String URL = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth";
	
	public static boolean isValidAddressService(String user, String password){
		log.info("Inicio: isValidAddressService");
		boolean resp = false;
		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource(URL+"?user="+user+"&pass="+password);

			ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);
			//log.info("El código de respuesta getSsoJson fue :  " + response.getStatus());

			if (response.getStatus() != 200) {
				resp = false;
			}
			String output = response.getEntity(String.class);
			//log.info("isValidAddressService_output " + output);
			
			JSONObject json = null;
			try {
				json = (JSONObject)new JSONParser().parse(output);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				log.error("Error: Parseo Json" + e);;
				e.printStackTrace();
				resp = false;
			}
			//log.info("isValidAddressService_respuesta == " + json.get("respuesta"));
			//log.info("isValidAddressService_respuesta == " + json.get("respuesta").toString());
	        
	        if ("false".equals(json.get("respuesta").toString())) {
	        	resp = false;
	        } else {
	        	resp = true;
	        }
	        
			//resp = false;
		} catch (Exception e) {
			log.error("Error: Web Service" + e);
			e.printStackTrace();
		}
		log.info("Inicio: isValidAddressService");
		return resp;
	}
	
	
	public static String isValidAddResponseService(String user, String password){
		log.info("Inicio: isValidAddressService");
		//boolean resp = false;
		String resp = null;
		
		try {
			
			Client client = Client.create();
			WebResource webResource = client.resource(URL+"?user="+user+"&pass="+password);

			ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);
			//log.info("El código de respuesta getSsoJson fue :  " + response.getStatus());

			if (response.getStatus() != 200) {
				resp = String.valueOf(response.getStatus());
			}
			String output = response.getEntity(String.class);
			//log.info("isValidAddResponseService_output " + output);
			
			JSONObject json = null;
			try {
				json = (JSONObject)new JSONParser().parse(output);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				log.error("Error: Parseo Json" + e);;
				e.printStackTrace();
				resp = "Error";
			}
			
			//log.info("isValidAddressService_respuesta == " + json.get("respuesta"));
			//log.info("isValidAddressService_respuesta == " + json.get("respuesta").toString());
	        
			if ("false".equals(json.get("respuesta").toString())) {
	        	resp = "Admin";
	        } else {
	        	MiClase ob = new ObjectMapper().readValue(json.get("respuesta").toString(), MiClase.class);
				//log.info("ob == " + ob.getMail());
	        	resp = ob.getNombre();
	        }
	        //log.info("resp " + resp);
			//resp = false;
		} catch (Exception e) {
			log.error("Error: Web Service" + e);
			e.printStackTrace();
		}
		log.info("Inicio: isValidAddressService");
		return resp;
	}
	

}