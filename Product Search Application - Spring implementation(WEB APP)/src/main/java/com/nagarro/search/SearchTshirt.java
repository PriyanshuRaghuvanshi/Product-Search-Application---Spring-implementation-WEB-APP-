package com.nagarro.search;


import java.io.*;


import com.nagarro.entities.Tshirt;
import com.opencsv.*;
import java.util.*;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;


@Controller
public class SearchTshirt {
	
	 private boolean stopChecking = false;

    public void startCheckingForNewData() {
	        Thread thread = new Thread(new Runnable() {
	            public void run() {
	                while (!stopChecking) {
	                    try {
	                    	Thread.sleep(30000); // wait for 10 seconds
	                        getmapData(); // check for new data
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        });
	        thread.start();
	    }

	    public void stopCheckingForNewData() {
	        stopChecking = true;
	    }
	
	public void getmapData() throws  NumberFormatException, IOException {
		File folder = new File("C:\\Users\\prraghuvanshi\\eclipse-workspace\\SpringAssignment\\src\\main\\resources");

		File[] files = folder.listFiles((dir, name) -> name.endsWith(".csv"));
		for (File file : files) {
		
			insertingInDB(file.getAbsolutePath());
		}
	
	}
	
	// inserting data in database

	public void insertingInDB(String file) throws NumberFormatException, IOException {
		
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Tshirt.class)
				.buildSessionFactory();
		Session session = factory.openSession();
		session.beginTransaction();
		
			
			CSVParser parser = new CSVParserBuilder().withSeparator('|').withIgnoreQuotations(true).build();
			CSVReader csvReader = new CSVReaderBuilder(new FileReader(file)).withSkipLines(1).withCSVParser(parser).build();
              String[] allmapData;
		
		
			
				while ((allmapData = csvReader.readNext()) != null) {
					Tshirt tshirt = new Tshirt();
					tshirt.setID(allmapData[0].toUpperCase());
					tshirt.setName(allmapData[1].toUpperCase());
					tshirt.setColour(allmapData[2].toUpperCase());
					tshirt.setGender(allmapData[3].toUpperCase());
					tshirt.setSize(allmapData[4].toUpperCase());
					tshirt.setPrice(Float.parseFloat(allmapData[5]));
					tshirt.setRating(Float.parseFloat(allmapData[6]));
					tshirt.setAvailability(allmapData[7].toUpperCase());
					session.saveOrUpdate(tshirt);
				}
		

		session.getTransaction().commit();
		session.close();
	}

	@SuppressWarnings({ "unchecked" })
public List<Tshirt> sortTshirts(String colour, String size, String gender, String outputPreference) {
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Tshirt.class)
				.buildSessionFactory();
		Session session = factory.openSession();
		Query query;
		String availability ="Y";
		// if outputpreference is price
		if (outputPreference.equals("1")) {
			query = session
					.createQuery("from Tshirt where COLOUR=:colour AND  SIZE=:size AND GENDER=:gender  AND AVAILABILITY=:availability order by PRICE");
		}

		// if outputpreference is rate
		else if (outputPreference.equals("2")) {
			query = session.createQuery(
					"from Tshirt where COLOUR=:colour AND  SIZE=:size AND GENDER=:gender  AND AVAILABILITY=:availability order by RATING DESC");
		}

		// if outputpreference is price and rate both
		else {
			query = session.createQuery(
					"from Tshirt where COLOUR=:colour AND  SIZE=:size AND GENDER=:gender  AND AVAILABILITY=:availability order by PRICE,RATING DESC");
		}

		query.setParameter("colour", colour);
		query.setParameter("size", size);
		query.setParameter("gender", gender);
		query.setParameter("availability", availability);
		List<Tshirt> tshirtlist = (List<Tshirt>) query.list();

		
		
		return tshirtlist;
	}

	
	}