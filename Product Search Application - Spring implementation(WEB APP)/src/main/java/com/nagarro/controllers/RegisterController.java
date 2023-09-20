package com.nagarro.controllers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.dao.RegisterDao;


@Controller
public class RegisterController {
	@Autowired
	RegisterDao register;
	
@PostMapping("/Register")
	public ModelAndView doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("uname");
		String pass = request.getParameter("pass");
		ModelAndView mv = new ModelAndView();
		if (register.registerUser(uname, pass)) {
			mv.setViewName("login");
			//response.sendRedirect("login.jsp");
		} else {
			mv.setViewName("Register");
		}
		//response.sendRedirect("Register.jsp");
return mv;
	}
}

