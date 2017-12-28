/**
 *@name UtilMIS 
 * 
 *@version 1.0 
 * 
 *@date 18 de Junio de 2015 
 * 
 *@author Cesar Machado 
 * 
 *@copyright Inversiones Security. All rights reserved.
 */

package com.cencosud.administrator.core.util;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.log4j.Logger;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

import com.cencosud.administrator.ws.response.BodyResp;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;




/**
 * @description clase de utilidad para la aplicacion. posee metodos generales
 * 			 que pueden ser usado en cualquier paquete de la aplicacion.
 */
//https://www.mkyong.com/java/how-to-convert-java-map-to-from-json-jackson/
//https://www.mkyong.com/java/jackson-2-convert-java-object-to-from-json/
//http://stackoverflow.com/questions/23446916/getjson-and-return-the-value-string


//Document
//http://www.journaldev.com/1237/java-convert-string-to-xml-document-and-xml-document-to-string
public class UtilMIS {
	//https://www.mkyong.com/java/how-to-convert-java-object-to-from-json-jackson/
	private static Logger	logger	= Logger.getLogger(UtilMIS.class);
	
	/**
	* metodo que convierte los objetos BodyResp en un String basado en formato json
	* 
	* @param BodyResp con toda la informacion del objeto que sera convertido en json
	* @return String que representa la informacion de un objeto pero en formato json
	*/
	public static String getJSONStringInput(String input) {
	
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		String json = "";

		try
		{
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("respuesta", true);
			map.put("usuario", "usuario");
			map.put("mail", "mail");

			
			// convert map to JSON string
			json = mapper.writeValueAsString(map);
			return json;
			
			//return mapper.writeValueAsString(input);
			
		} catch (JsonGenerationException e)
		{
			System.out.println();
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (JsonMappingException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (IOException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		}
		return "{\"error\": \"Exception\"}";
	}
	
	
	/**
	* metodo que convierte los objetos BodyResp en un String basado en formato json
	* 
	* @param BodyResp con toda la informacion del objeto que sera convertido en json
	* @return String que representa la informacion de un objeto pero en formato json
	*/
	public static String getJSONString(Object bodyResp) {
	
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		try
		{
			return mapper.writeValueAsString(bodyResp);
			
		} catch (JsonGenerationException e)
		{
			System.out.println();
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (JsonMappingException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (IOException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		}
		return "{\"error\": \"Exception\"}";
	}
	
	public static BodyResp getJSONObject(String jsonInString) {
		
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
		
		BodyResp bodyResp = new BodyResp();
		
		try
		{
			//return mapper.readValue("{\"name\":\"ss\"}", bodyResp);
				
			// Convert JSON string to Object
			//String jsonInString = "{\"respuestaCas\":\{\"CODIGO_RESPUESTA\":\"-1\",\"DESCRIPCION_RESPUESTA\:\"ssssssssssss\"}}";
			
			
			
			
			bodyResp =   mapper.readValue(jsonInString, BodyResp.class);
			return bodyResp;
			
			
			
		} catch (JsonGenerationException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (JsonMappingException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		} catch (IOException e)
		{
			logger.error("Se produjo un error:"+e);
			e.printStackTrace();
		}
		return bodyResp;
	}
	
	
	//convert xml to java object using jaxb (unmarshal) 
	//https://www.mkyong.com/java/jaxb-hello-world-example/
	//http://stackoverflow.com/questions/11221136/convert-xml-to-java-object-using-jaxb-unmarshal
	//
	/**
	* metodo que convierte los objetos BodyResp en un document basado en XML
	* 
	* @param BodyResp con toda la informacion del objeto a convertir en XML
	* @return Document objeto bajo la representacion de XML
	 * @throws ParserConfigurationException 
	 * @throws IOException 
	 * @throws SAXException 
	*/
	public static String jaxbObjectToXML(Object bodyResp) {
	    String datos = "";
	    try {
	    	JAXBContext jaxbCtx = JAXBContext.newInstance(bodyResp.getClass());
	        //JAXBContext context = JAXBContext.newInstance(bodyResp.cl);
	    	Marshaller marshaller = jaxbCtx.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			
			/* El archivo se guarda como "xmlservice.xml" en el objeto xmlService
			   de la clase File a traves del Marshaller definido */
			File xmlService = new File("xmlservice.xml");
			////File xmlService = new File("C:\\Users\\josef_000\\workspace_administratorv2\\administrator\\administrator-dto\\src\\main\\resources\\file.xml");
			marshaller.marshal(bodyResp, xmlService);
			


	        StringWriter sw = new StringWriter();
	        marshaller.marshal(bodyResp, sw);
	        datos = sw.toString();

	    } catch (JAXBException e) {
	        e.printStackTrace();
	    }

	    return datos;
	}
	/*
	public static BodyResp jaxbXMLToObject(String xmlInString) {
		 BodyResp bodyResp = new BodyResp();
	    try {
	    	JAXBContext jaxbCtx = JAXBContext.newInstance(BodyResp.class);
	        //JAXBContext context = JAXBContext.newInstance(bodyResp.cl);
	    	Unmarshaller unmarshaller = jaxbCtx.createUnmarshaller();
	    	//unmarshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
			

			File xmlService = new File("xmlservice.xml");
			//File xmlService = new File("C:\\Users\\josef_000\\workspace_administratorv2\\administrator\\administrator-dto\\src\\main\\resources\\file.xml");
			StringReader sr = new StringReader(xmlInString);
			//bodyResp = (BodyResp) unmarshaller.unmarshal(xmlService);
			bodyResp = (BodyResp) unmarshaller.unmarshal(sr);
			return bodyResp;
	    } catch (JAXBException e) {
	    	logger.info("error procesando XML recibido:");
			logger.info(e.getLocalizedMessage());
	    }

	    return bodyResp;
	}
	*/
	
	/**
	* metodo que toma un Document (org.w3c) y realiza el unmarshalling a BodyResp
	* 
	* @param doc es el objeto Document al que se le realiza el unmarshalling
	* @return bodyResp, objeto creado a partir del Document doc
	*/
	public static BodyResp unmarshalDoc(Document doc){
		BodyResp bodyResp = null;
		try
		{
			JAXBContext jc = JAXBContext.newInstance(BodyResp.class);
			bodyResp = (BodyResp) jc.createUnmarshaller().unmarshal(doc);
			return bodyResp;
		} catch (JAXBException e)
		{
			logger.info("error procesando XML recibido:");
			logger.info(e.getLocalizedMessage());
		}
		return bodyResp;
	}
	
	
	
	
	
}
