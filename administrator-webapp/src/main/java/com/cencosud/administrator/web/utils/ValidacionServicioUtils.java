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

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONArray;
//import org.hibernate.exception.DataException;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
//import org.junit.Assert;

//import com.cencosud.administrator.web.controller.account.AccountController;
import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;





import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;


import org.json.simple.JSONObject;


/**
 * @description
 */
public class ValidacionServicioUtils {

	private static Logger log = Logger.getLogger(ValidacionServicioUtils.class);

	private final static String URL = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth";
	private static final String targetURL = "https://paneltxd.cl/index.php/users/adfs";

	
	public static boolean isValidAddressService(String user, String password) {
		log.info("Inicio: isValidAddressService");
		boolean resp = false;
		try {

			Client client = Client.create();
			WebResource webResource = client.resource(URL + "?user=" + user + "&pass=" + password);

			ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);
			log.info("El código de respuesta getSsoJson fue :  " + response.getStatus());

			if (response.getStatus() != 200) {
				resp = false;
			}
			String output = response.getEntity(String.class);
			log.info("output " + output);

			JSONObject json = null;
			try {
				json = (JSONObject) new JSONParser().parse(output);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				log.error("Error: Parseo Json" + e);
				;
				e.printStackTrace();
				resp = false;
			}
			log.info("respuesta " + json.get("respuesta"));

			if ("false".equals(json.get("respuesta"))) {
				resp = false;
			} else {
				resp = true;
			}

			// resp = false;
		} catch (Exception e) {
			log.error("Error: Web Service" + e);
			e.printStackTrace();
		}
		log.info("Inicio: isValidAddressService");
		return resp;
	}

	public static String isValidAddResponseService(String user, String password) {
		log.info("Inicio: isValidAddressService");
		// boolean resp = false;
		String resp = null;

		try {

			Client client = Client.create();
			WebResource webResource = client.resource(URL + "?user=" + user + "&pass=" + password);

			ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);
			log.info("El código de respuesta getSsoJson fue :  " + response.getStatus());

			if (response.getStatus() != 200) {
				resp = String.valueOf(response.getStatus());
			}

			String output = response.getEntity(String.class);

			log.info("output " + output);

			JSONObject json = null;
			try {
				json = (JSONObject) new JSONParser().parse(output);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				log.error("Error: Parseo Json" + e);
				;
				e.printStackTrace();
				resp = "Error";
			}

			log.info("===" + json.put("respuesta", "mail"));
			String firstName = (String) json.get("respuesta");
			log.info("===" + firstName);
			// get an array from the JSON object
			JSONArray lang = (JSONArray) json.get("languages");
			log.info("===" + firstName);

			if ("false".equals(json.get("respuesta"))) {
				resp = "false";
			} else {
				resp = String.valueOf(json.get("respuesta"));
				resp.substring(0, 22);

			}
			log.info("resp==== " + resp);
			// log.info("respuesta " + json.get("respuesta"));
			resp = output;
			log.info("respuesta_numero " + resp);
			// log.info("resp " + resp.substring(24,66));
			// resp = false;
		} catch (Exception e) {
			log.error("Error: Web Service" + e);
			e.printStackTrace();
		}
		log.info("Inicio: isValidAddressService");
		return resp;
	}

	// HTTP POST request
	
	public static boolean sendPost(String user, String password) throws Exception {
		String url = "https://paneltxd.cl/index.php/users/adfs/";
		URL obj = new URL(url);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();
		boolean result = true;

		// add reuqest header
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		con.setDoInput(true);
		con.setUseCaches(false);
		con.setAllowUserInteraction(false);
		// con.setRequestProperty("User-Agent", USER_AGENT);
		con.setRequestProperty("Content-Length", "");
		con.setRequestProperty("Accept-Language", "application/json");

		String urlParameters = "email="+user+"&password="+password+"&loginSubmit=Ingresar";

		// Send post request
		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());
		wr.writeBytes(urlParameters);
		wr.flush();
		wr.close();

		int responseCode = con.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
		System.out.println("Post parameters : " + urlParameters);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		System.out.println("Post=" + response.toString());

		JSONArray jsonarray = new JSONArray(response.toString());

		String name = null;
		String url1 = null;
		for (int i = 0; i < jsonarray.length(); i++) {
			org.codehaus.jettison.json.JSONObject obj1 = jsonarray.getJSONObject(i);

			if (obj1.getString("login").isEmpty()) {
				result = false;
			} else {
				result = true;
			}
		}
		return result;
		
	}
	

}