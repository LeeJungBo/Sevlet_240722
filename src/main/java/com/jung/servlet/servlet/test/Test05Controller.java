package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test05")
public class Test05Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter(); //자꾸 빨간줄이 뜨는건 엉 예외 상황이 발생할수있다는 걸 암시 이건 그냥 대충 빨간줄밑에 자동 고쳐주기에서 뜨는거 누르면 됨
	
		String numberString = request.getParameter("number");
		
		int number = Integer.parseInt(numberString);
		
		out.println("<html><head><title></title></head><body>");
		
		out.println("<ul>");
		
		for(int i = 1; i <= 9; i++) {
			
			out.println("<li>" + number + " x " + i + " = " + (number * i) + " </li> ");
		
		}
	
		out.println("</ul>");
		
		out.println("</body></html>");
		
	
	}
	
	
	
	
	
	
	
	
	
}
