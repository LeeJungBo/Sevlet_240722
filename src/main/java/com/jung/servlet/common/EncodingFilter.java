package com.jung.servlet.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

//해당 필터를 거쳐갈 페이지 주소 형식
@WebFilter("/*") //전체 하위 패키지에 적용시키기 위한거 만약 특정 서블릿 클래스로 할라면 웹핑에서 써주듯이 여기다가 지정시키면 됨
public class EncodingFilter implements Filter {
	
	@Override //ServletRequest request, ServletResponse response 여기에서 처리되는것이 filter를 통해 거쳐감
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response); //chain이라는건 다 연결된다는거
		
		
		
	}

	
		
	
	

}
