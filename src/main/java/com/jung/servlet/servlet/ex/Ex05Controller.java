package com.jung.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex05")
public class Ex05Controller extends HttpServlet {

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		request.setCharacterEncoding("utf-8"); //입력받는 타입을 utf-8 받겠다는거 doPost에 있는 특직(왜냐 이건 문장으로 받기때문에)
		response.setCharacterEncoding("utf-8"); //작성해주는 타입을 utf-8 해주겠다는거
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		
		int year = Integer.parseInt(birthday.substring(0,4));
		
		int age = 2024 - year + 1;
		
		out.println("<html><head><title>이름,나이</title></head><body>");
		
		out.println("<h2>이름 : " + name + "</h2>");
		out.println("<h2>나이 : " + age + "</h2>");
		
		out.println("</body></html>");
	}
	
	
	
	
	
}
