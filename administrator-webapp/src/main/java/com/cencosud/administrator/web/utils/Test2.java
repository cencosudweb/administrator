/**
 * 
 */
package com.cencosud.administrator.web.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.ws.rs.core.MultivaluedMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import com.sun.jersey.api.client.Client;
import com.sun.jersey.api.client.ClientResponse;
import com.sun.jersey.api.client.WebResource;
import com.sun.jersey.core.util.MultivaluedMapImpl;

/**
 * @author ea7129
 *
 */
public class Test2 {
	private final static String URL = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth";
	private static final String targetURL = "https://paneltxd.cl/index.php/users/adfs";

	private final String USER_AGENT = "Mozilla/5.0";

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		
		ValidacionServicioUtils.sendPost("", "");
		System.out.println(ValidacionServicioUtils.sendPost("", ""));
		
		Test2 http = new Test2();

		System.out.println("Testing 1 - Send Http GET request");
		http.sendGet();

		System.out.println("\nTesting 2 - Send Http POST request");
		http.sendPost();
		
		
		try {

			Client client = Client.create();
			WebResource webResource = client.resource(URL + "?user=" + "ea7129" + "&pass=" + "3712JlGj");

			ClientResponse response = webResource.accept("application/json").get(ClientResponse.class);

			if (response.getStatus() != 200) {
				System.out.println("Output from Server1 .... \n");
			}
			String output = response.getEntity(String.class);
			System.out.println("output=" + output);
			JSONObject json = null;
			try {
				json = (JSONObject) new JSONParser().parse(output);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			if ("false".equals(json.get("respuesta"))) {
			} else {
			}

			// resp = false;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		try {
			String input = "{\"email\":\"felipefuentes.salinas@gmail.com\",\"password\":\"ssssssssssss\"}";

			
			Client client = Client.create();
			
			
			MultivaluedMap queryParams = new MultivaluedMapImpl();
			   queryParams.add("param1", "val1");
			   queryParams.add("param2", "val2");
			   
			   

			WebResource webResource = client.resource("https://paneltxd.cl/index.php/users/adfs");
			
			

			ClientResponse response = webResource.accept("application/json").post(ClientResponse.class, queryParams	);

			if (response.getStatus() != 200) {
				System.out.println("Output from Server2 .... \n");
			}
			String output = response.getEntity(String.class);
			System.out.println("output22=" + output);
			

			// resp = false;
		} catch (Exception e) {
			e.printStackTrace();
		}

		try {

			Client client = Client.create();

			WebResource webResource = client.resource("https://paneltxd.cl/index.php/users/adfs")
					.queryParam("email", "felipefuentes.salinas@gmail.com").queryParam("password", "abc123");

			String input = "{\"email\":\"felipefuentes.salinas@gmail.com\",\"password\":\"ssssssssssss\"}";

			ClientResponse response = webResource.type("application/json").post(ClientResponse.class);

			if (response.getStatus() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + response.getStatus());
			}

			System.out.println("Output from Server3 .... \n");
			String output = response.getEntity(String.class);
			System.out.println("3="+output);

		} catch (Exception e) {

			e.printStackTrace();

		}
/*
		try {
			
			
			  Map<String,Object> params = new LinkedHashMap<>();
		        params.put("email", "fishie@seamail.example.com");
		        params.put("password", "10394");

		        StringBuilder postData = new StringBuilder();
		        for (Map.Entry<String,Object> param : params.entrySet()) {
		            if (postData.length() != 0) postData.append('&');
		            postData.append(URLEncoder.encode(param.getKey(), "UTF-8"));
		            postData.append('=');
		            postData.append(URLEncoder.encode(String.valueOf(param.getValue()), "UTF-8"));
		        }
		        byte[] postDataBytes = postData.toString().getBytes("UTF-8");


			URL url = new URL("https://paneltxd.cl/index.php/users/adfs");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Accept", "application/json");
			conn.setRequestProperty("Content-Length", String.valueOf(postDataBytes.length));
	        conn.setDoOutput(true);
	        conn.getInputStream();
	        conn.getOutputStream().write(postDataBytes);
	        
	        
			if (conn.getResponseCode() != 200) {
				throw new RuntimeException("Failed : HTTP error code : " + conn.getResponseCode());
			}

			BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));

			String output;
			System.out.println("Output from Server4 .... \n");
			while ((output = br.readLine()) != null) {
				System.out.println("4="+output);
			}

			conn.disconnect();

		} catch (MalformedURLException e) {

			e.printStackTrace();

		} catch (IOException e) {

			e.printStackTrace();

		}
		*/
		
		 String urlString="https://paneltxd.cl/index.php/users/adfs";

	        URL url=new URL(urlString);
	        URLConnection connection=url.openConnection();
	        connection.setDoOutput(true);
	        OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream());
	        out.write("{\"email\": \"Mr.Client\", \"password\": \"Mr.Client\"}");
	        out.close();

	        BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
	        String decodedString;
	        while ((decodedString = in.readLine()) != null) {
	        System.out.println("===="+decodedString);
	        }
	        in.close();
	        
	        
	        
	        try {

				URL targetUrl = new URL(targetURL);

				HttpURLConnection httpConnection = (HttpURLConnection) targetUrl.openConnection();
				httpConnection.setDoOutput(true);
				httpConnection.setRequestMethod("POST");
				httpConnection.setRequestProperty("Content-Type", "application/json");

				String input = "{\"email\":1,\"password\":\"Liam\"}";

				OutputStream outputStream = httpConnection.getOutputStream();
				outputStream.write(input.getBytes());
				outputStream.flush();

				if (httpConnection.getResponseCode() != 200) {
					throw new RuntimeException("Failed : HTTP error code : "
						+ httpConnection.getResponseCode());
				}

				BufferedReader responseBuffer = new BufferedReader(new InputStreamReader(
						(httpConnection.getInputStream())));

				String output;
				System.out.println("Output from Server111111111111:\n");
				while ((output = responseBuffer.readLine()) != null) {
					System.out.println(output);
				}

				httpConnection.disconnect();

			  } catch (MalformedURLException e) {

				e.printStackTrace();

			  } catch (IOException e) {

				e.printStackTrace();

			 }
	}
	
	
	// HTTP GET request
		private void sendGet() throws Exception {

			String url = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth?user=ea7129&pass=3712JlGj";

			URL obj = new URL(url);
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			// optional default is GET
			con.setRequestMethod("GET");

			//add request header
			con.setRequestProperty("User-Agent", USER_AGENT);

			int responseCode = con.getResponseCode();
			System.out.println("\nSending 'GET' request to URL : " + url);
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
			System.out.println("Get1 = "+response.toString());

		}

		// HTTP POST request
		private void sendPost() throws Exception {

			String url = "https://paneltxd.cl/index.php/users/adfs/";
			URL obj = new URL(url);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

			//add reuqest header
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setAllowUserInteraction(false);
			//con.setRequestProperty("User-Agent", USER_AGENT);
			con.setRequestProperty("Content-Length", "");  
			con.setRequestProperty("Accept-Language", "application/json");

			String urlParameters = "email=C02G8416DRJM&password=1111&loginSubmit=Ingresar";

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

			BufferedReader in = new BufferedReader(
			        new InputStreamReader(con.getInputStream()));
			String inputLine;
			StringBuffer response = new StringBuffer();

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			//print result
			System.out.println("Post="+response.toString());

		}

}
