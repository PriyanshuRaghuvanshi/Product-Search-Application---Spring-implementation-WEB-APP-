package com.nagarro.controllers;



import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.entities.Tshirt;
import com.nagarro.search.SearchTshirt;

@Controller
public class SearchController {

	@Autowired
	SearchTshirt searchTshirt;
	

	@PostMapping("/Search")//post method mapping
	public ModelAndView checkUser(HttpServletRequest request, HttpServletResponse response)
			throws InterruptedException, NumberFormatException, IOException {
		 searchTshirt.startCheckingForNewData();
		// searchTshirt.getmapData();
		ModelAndView mv = new ModelAndView();

		String colour = request.getParameter("colour");
		String size = request.getParameter("size");
		String gender = request.getParameter("gender");
		String outputPreference = request.getParameter("outputPreference");

//thread creation
//SearchController tshirtThread = new SearchController();
//tshirtThread.start();
//tshirtThread.join();
//tshirtThread.interrupt();

		List<Tshirt> result = searchTshirt.sortTshirts(colour, size, gender, outputPreference); // calling sortTshirts
																							
		mv.addObject("result", result);
		mv.setViewName("Search");
		return mv;
	}

}