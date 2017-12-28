/**
 * 
 */
package com.cencosud.administrator.web.utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * @author EA7129
 *
 */
public class TestConvert {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String dateInString = "2017-05-02 00:00:00";

        try {

            Date date = formatter.parse(dateInString);
            System.out.println(date);
            System.out.println(formatter.format(date));

        } catch (ParseException e) {
            e.printStackTrace();
        }

	}

}
