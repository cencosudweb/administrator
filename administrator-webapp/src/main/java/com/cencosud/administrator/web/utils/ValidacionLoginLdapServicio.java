/**
 * 
 */
package com.cencosud.administrator.web.utils;


import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.codehaus.jettison.json.JSONArray;
import org.json.simple.JSONObject;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

import javax.naming.Context;
import javax.naming.directory.Attribute;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

import org.apache.log4j.Logger;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.cencosud.administrator.core.util.UtilMIS;

/**
 * @description Clase para validacion Login Ldap
 */
public class ValidacionLoginLdapServicio {

	private static Logger logger = Logger.getLogger(ValidacionLoginLdapServicio.class);
	
	private final static String URL = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth";
	private static final String targetURL = "https://paneltxd.cl/index.php/users/adfs";

	private static final String USER_AGENT = "Mozilla/5.0";

	
	/**
	 * Metodo que inicia sesión usando Servicio de Login Integral LDAP 
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return boolean  logico con la respuesta de la ejecucion del servicio
	 */
	public static boolean ValidarloginLdapService(String username, String password) {
		logger.info("Inicio: Validar login LDAP Service");
		
		boolean resp = false;

		try {
			URL obj = new URL(URL+"?user="+username+"&pass="+password);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// optional default is GET
			con.setRequestMethod("GET");

			//add request header
			con.setRequestProperty("User-Agent", USER_AGENT);

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + URL);
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			//print result
			logger.info("Objeto Get:" +response.toString());
			
			JSONObject json = null;
			try {
				json = (JSONObject)new JSONParser().parse(response.toString());
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				logger.error("Error: Parseo Json" + e);;
				e.printStackTrace();
				resp = false;
			}
			
			if ("false".equals(json.get("respuesta").toString())) {
	        	resp = false;
	        } else {
	        	resp = true;
	        }
			
			//resp = true;
		} catch (Exception ex) {
			logger.error("Error Login Ldap" + ex.getMessage());
			//ex.printStackTrace();
		}
		logger.info("Fin: Validar login LDAP");
		return resp;
	}
	
	
	/**
	 * Metodo que inicia sesión usando Servicio de Login Integral LDAP 
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return boolean  logico con la respuesta de la ejecucion del servicio
	 */
	public static String ValidarloginInfoLdapService(String username, String password) {
		logger.info("Inicio: Validar login LDAP Service");
		
		String resp = null;

		try {
			URL obj = new URL(URL+"?user="+username+"&pass="+password);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// optional default is GET
			con.setRequestMethod("GET");

			//add request header
			con.setRequestProperty("User-Agent", USER_AGENT);

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + URL);
			System.out.println("Response Code : " + responseCode);

			BufferedReader in = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			//print result
			logger.info("Objeto Get:" +response.toString());
			
			JSONObject json = null;
			try {
				json = (JSONObject)new JSONParser().parse(response.toString());
				resp = json.get("respuesta").toString();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				logger.error("Error: Parseo Json" + e);;
				e.printStackTrace();
				resp = null;
			}
			
			if ("false".equals(json.get("respuesta").toString())) {
	        	resp = "Admin";
	        } else {
	        	MiClase ob = new ObjectMapper().readValue(json.get("respuesta").toString(), MiClase.class);
				//log.info("ob == " + ob.getMail());
	        	resp = ob.getNombre();
	        }
			
			//resp = true;
		} catch (Exception ex) {
			logger.error("Error Login Ldap" + ex.getMessage());
			//ex.printStackTrace();
		}
		logger.info("Fin: Validar login LDAP");
		return resp;
	}
	/**
	 * Metodo que inicia sesión usando Servicio de Login Post 
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return boolean  logico con la respuesta de la ejecucion del Servicio Login Post
	 */
	public static boolean ValidarloginPost(String user, String password) {
		logger.info("Inicio: Validar login Post");
		
		boolean resp = false;
		
		try {
		
		URL obj = new URL(targetURL);
		HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

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
		logger.info("\nSending 'POST' request to URL : " + targetURL);
		logger.info("Post parameters : " + urlParameters);
		logger.info("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		// print result
		logger.info("Objeto Post:" +response.toString());

		JSONArray jsonarray = new JSONArray(response.toString());

		//String name = null;
		//String url1 = null;
		for (int i = 0; i < jsonarray.length(); i++) {
			org.codehaus.jettison.json.JSONObject obj1 = jsonarray.getJSONObject(i);
			if ("FALSE".equals(obj1.getString("login"))) {
				resp = false;
			} else {
				resp = true;
			}
		}
		
		} catch (Exception ex) {
			logger.error("Error Login Post" + ex.getMessage());
		}
		logger.info("Fin: Validar login Post");
		return resp;
		
	}
	
	/**
	 * Metodo que Obtiene el valor del Atributo  LDAP
	 * 
	 * @param String    nombre del usuario
	 * @param String    contraseña del usuario
	 * @return String   Valor del Atributo Ldap
	 */
	public static String ObtenerValorAtributoLdap(String username, String password) {
		logger.info("Inicio: Obtener Valor Atributo LDAP");
		String resp = null;
	    try {
    			resp = "";
			} catch (Exception e) {
				// TODO Auto-generated catch block
				logger.error("Error Login Info Ldap:" + e.getMessage());
				e.printStackTrace();
			}
        logger.info("FIn: Obtener Valor Atributo LDAP");
        return resp;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ValidacionLoginLdapServicio valid = new ValidacionLoginLdapServicio();
		String password = "3712JlGj.,XxX";
		String username = "ea7129";
		System.out.println("--------------1---------");
		System.out.println(	"Login : " +	valid.ValidarloginLdapService(username, password));
		System.out.println("--------------1---------");
		
		System.out.println("--------------Info---------");
		System.out.println(	"Info : " +	valid.ValidarloginInfoLdapService(username, password));
		System.out.println("--------------Info---------");
		
		
		String password2 = "abc123";
		String username2 = "felipe.fuentessalinas@cencosud.cl";
		System.out.println("--------------2---------");
		System.out.println(	"Info : " +	valid.ValidarloginPost(username2, password2));
		System.out.println("--------------2---------");
		

	}

}
