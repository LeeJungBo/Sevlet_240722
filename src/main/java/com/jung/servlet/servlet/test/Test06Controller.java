package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test06")
public class Test06Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/json");
		
		PrintWriter out = response.getWriter();
		
		String numberString1 = request.getParameter("number1");
		
		int number1 = Integer.parseInt(numberString1);
		//int number1 = Integer.parseInt(request.getParameter("number1")) 이런식으로도 가능

		String numberString2 = request.getParameter("number2"); 
		//그냥 변수로 안만들고 바로 인자로 메서드를 넣어주는것도 가능
		
		int number2 = Integer.parseInt(numberString2);
		
		//int additon = number1 + number2
		//int subtraction = number1 + number2
		//int multiplication = number1 + number2
		//int division = number1 + number2
		
		
		
		// { "additon" : 135 }
		out.println("{");
		out.println("\"addtion\" : " + (number1 + number2) + ",");
		out.println("\"subtraction\" : " + (number1 - number2) + ",");
		out.println("\"multiplication\" : " + (number1 * number2) + ",");
		out.println("\"division\" : " + (number1/number2));
		out.println("}");
		
		
		
	}	
	
	
	
	
	
}
