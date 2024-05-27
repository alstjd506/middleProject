package com.shop.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodingFilter implements Filter {

	String encoding;
	
	public EncodingFilter() {
		System.out.println("EncodingFilter instance.");
	}
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		encoding = filterConfig.getInitParameter("enc");
	}
	
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		System.out.println("EncodingFilter before...");
		request.setCharacterEncoding(encoding);
		
		chain.doFilter(request, response); // *.do 서블릿실행.
		
		System.out.println("EncodingFilter after...");
	}

}
