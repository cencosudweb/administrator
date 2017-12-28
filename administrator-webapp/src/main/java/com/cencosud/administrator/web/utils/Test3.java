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

/**
 * @author ea7129
 *
 */
public class Test3 {
	private final static String URL = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth";
	private static final String targetURL = "https://paneltxd.cl/index.php/users/adfs";

	private final String USER_AGENT = "Mozilla/5.0";

	/**
	 * @param args
	 */
	public static void main(String[] args) throws Exception {
		
		System.out.println("===="+ValidacionServicioUtils.sendPost("felipefuentes.salinas@gmail.com", "abc123"));
		
		Test3 http = new Test3();

		System.out.println("Testing 1 - Send Http GET request");
		http.sendGet();

		System.out.println("\nTesting 2 - Send Http POST request");
		http.sendPost();
		
		
		
	}
	
	
	// HTTP GET request
		private void sendGet() throws Exception {

			//String url = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth?user=ea7129&pass=3712JlGj";
			String url = "http://g500603svgjm:8080/ServicioLoginSoporteIntegral-0.0.1/api/auth?user=ea7129&pass=3712JlGj.,XxX";

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

			//String url = "https://paneltxd.cl/index.php/users/adfs/";
			String url = "https://paneltxd.cl/index.php/TxdAdfs/adfs?SAMLRequest=lZJPT%2BMwEMW%2FSuR7msY0NFhtpUK1ohLLVm13D1zQxB62lhw7eCYLfPtNExB%2FDpU4WX6e3%2FjN08wIateoZcsHv8XHFomT59p5Uv3DXLTRqwBkSXmokRRrtVv%2BvFFyNFZNDBx0cOIDcpoAIoxsgxfJejUX97KS59PSnJ3LArQpx5jLi7OiMhWUEynLSqO%2BmGAhJ2OR%2FMFIHTkXXaMOJ2px7YnBcyeN82ma56nM9%2FlUFYUqyjuRrLpprAfuqQNzQyrLwDwQxJFGrwO1ZqRD3WuZo0wkyzeDV8FTW2PcYfxnNf7e3ry3aMCj4%2BeOddlx5qwOpnU4ag7NcKfhlClo6tU3IqVGJJvX2C6tN9b%2FPZ1YNRSRut7vN%2Bnm124vFrNjc9UnEBffMVUjgwGGr55m2ceOs2Enbjsv69UmOKtfkh8h1sCnrR4Va9KHvlRxBE8WPXehOheeriIC41xwbFFki%2BHLz5u3%2BA8%3D&RelayState=https%3A%2F%2Fpaneltxd.cl%2Fsaml%2Fmodule.php%2Fcore%2Fpostredirect.php%3FRedirId%3D_916e353560dd22bb7c3d1dfa455aa8ea360fb6a33a&SigAlg=http%3A%2F%2Fwww.w3.org%2F2001%2F04%2Fxmldsig-more%23rsa-sha256&Signature=mEfdiTitGs8j%2FyYWQLoDu9kSHBPYu%2BvJCM%2B4HaiJiP%2FRzYuajsyW72tmY3j3leEZyfnG0Q5wdrKz2SlPsjoUK5LPyxdQFLayaQhRxUFuSusRPzwk8UzUUfid7JKhhx7JR%2Fct8zXm40%2BDkLZ2Ig6%2Fvgb72KbO3xNhhHUw4gy%2FV2e368L5ez9xs%2B7UnEP7oSVVCnDy%2BVC%2FUKInCnVLHQDpVEl5HDhtjnM1Xyh1fThcB8PnEqsLOcKIoFepDHisySezHyzD7peUJMW271PBpQaFeszLCDTwYeKaZ%2FclP0sCsVxidiRpFLXUgwXBFP6rOBs3ZmPMlYV4a6aHhLf97AzCLA%3D%3D";
			
			
			
			URL obj = new URL(url);
			HttpsURLConnection con = (HttpsURLConnection) obj.openConnection();

			//add reuqest header
			con.setRequestMethod("POST");
			con.setDoOutput(true);
			con.setDoInput(true);
			con.setUseCaches(false);
			con.setAllowUserInteraction(false);
			con.setRequestProperty("User-Agent", USER_AGENT);
			con.setRequestProperty("Content-Length", "");
			con.setRequestProperty("Accept-Language", "application/json");

			//String urlParameters = "email=felipefuentes.salinas@gmail.com&password=abc123&loginSubmit=Ingresar";
			String urlParameters = "UserName=joseluis.garrido@externos-cl.cencosud.com&Password=3712JlGj&AuthMethod=FormsAuthentication";

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
			
			
			//JSONArray jsonarray = new JSONArray(response.toString());

			String name = null;
			String url1 = null;
			boolean result = true;
			/*
		    for(int i=0; i<jsonarray.length(); i++){
		        org.codehaus.jettison.json.JSONObject obj1 = jsonarray.getJSONObject(i);
		        
		        if (obj1.getString("login").isEmpty()) {
		        	result = false;
		        } else {
		        	result = true;
		        }
		        
		       

		        //name = obj1.getString("id");
		        //url1 = obj1.getString("login");

		        //System.out.println(name);
		        //System.out.println(url1);
		    }   
		    */
	        System.out.println(result);
			
		

		}

}
