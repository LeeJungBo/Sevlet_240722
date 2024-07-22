package com.jung.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex02")
public class Ex02Controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		//1-10까지의 합을 구하고 결과를 html 로 구성한다.
		int sum = 0;
		for(int i = 1; i <= 10; i++) {
			sum += i;
		}
		
		// html 타입이니 분석해서 저 plain을 하면 이거 문자열 그대로 나옴
		out.println("<html><head><title>합계</title></head><body>");
		out.println("<h2> 합계 : " +sum + "</h2></body></html>");
		
		
		
	}
	
	
}
