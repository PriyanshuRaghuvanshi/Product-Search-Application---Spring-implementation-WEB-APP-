package com.nagarro.config;


import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class FrontController extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
// TODO Auto-generated method stub
		return new Class[] { MyConfig.class };

	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected String[] getServletMappings() {
// TODO Auto-generated method stub
		return new String[] { "/" };
	}

}