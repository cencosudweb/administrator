/**
 * 
 */
package com.cencosud.administrator.ws.impl;

//import org.springframework.beans.factory.annotation.Autowired;

//import com.cencosud.administrator.core.KitServices;
import com.cencosud.administrator.dto.ws.DemoParams;
import com.cencosud.administrator.dto.ws.DemoResult;
import com.cencosud.administrator.ws.DemoWS;

/**
 * @author EA7129
 *
 */
public class DemoWSImpl implements DemoWS {

	//@Autowired
		//private KitServices services;

		@Override
		public DemoResult demo(DemoParams params) {
			// TODO Auto-generated method stub
			DemoResult demo = new DemoResult();
			demo.setParam1("Wena [asd]");
			return demo;
		}

}
