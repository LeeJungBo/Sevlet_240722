package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test02Controller extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		
		response.setContentType("text/plain"); //브라우저는 브라우저 화면에 어떻게 보여줄지를 알려주는거다.
		
		PrintWriter out= response.getWriter();
		
		Date now = new Date();
		
		
		SimpleDateFormat formatter = new SimpleDateFormat("HH시 mm분 ss초");
		String timeString = formatter.format(now);
		
		out.print("현재 시간은 " + timeString);
		
		//브라우저 화면(오류가 뜨면)에 404가 자주 뜨는데 그땐 주소가 이상하다는 거나 코드가 이상하다는거다.
		
		
		
	}
	
	
	
	

}
