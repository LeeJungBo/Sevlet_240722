package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test10")
public class Test10Controller extends HttpServlet {
	
	// doPost 메소드 바깥쪽에 위치
	private final Map<String, String> userMap =  new HashMap<String, String>() {
	    {
	        put("id", "hagulu");
	        put("password", "asdf");
	        put("name", "김인규");
	    }
	};
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		
		response.setContentType("text/html");
		
		PrintWriter out= response.getWriter();
		
		String id = request.getParameter("id");
		String passWord = request.getParameter("passWord");
		
		String userId = userMap.get("id");
		String userPassword= userMap.get("password");
		
		
		out.println("<html><head><title></title></head><body>");
		
		if(!id.equals(userId)) {
			out.println("<h3>id가 일치하지 않습니다.</h3>");
		}else if(!passWord.equals(userPassword)) {
			out.println("<h3>password가 일치하지 않습니다.</h3>");
		}else {
			out.println("<div><h1>" + userMap.get("name") + "</h1></div>");
		}
		
		out.println("</body></html>");
		
		
		
		
	}
	
	
	
}
