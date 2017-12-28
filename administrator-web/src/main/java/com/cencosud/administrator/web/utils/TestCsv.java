package com.cencosud.administrator.web.utils;

import java.io.FileReader;
import java.io.IOException;
import java.util.Arrays;

import com.opencsv.CSVReader;

public class TestCsv {

	public static final char SEPARADOR = ';';
	public static final char COMILLAS = '"';

	public static void main(String[] args) {

		CSVReader lector = null;

		try {
			// Abrir el .csv
			lector = new CSVReader(new FileReader("C:/Users/ea7129/Documents/Cargar_Excel_kpi_Manual/test.csv"),
					SEPARADOR, COMILLAS);

			// Definir el string de la línea leída
			String[] linea = null;

			while ((linea = lector.readNext()) != null) {
				// System.out.println(Arrays.toString(linea));
				System.out.println("DATA=" + linea[0] + "" + linea[1]);

			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// Cierro el buffer de lectura
			if (lector != null) {
				try {
					lector.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

}
