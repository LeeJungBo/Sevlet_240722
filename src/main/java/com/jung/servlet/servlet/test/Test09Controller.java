package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test09")
public class Test09Controller extends HttpServlet {
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Post를 하는이유는 보안을 위해서 get은 파라미터를 보여지게 입력이되는데 Post는 안보여지게 입력되어서 보안적으로 나음
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String text = request.getParameter("text");
		
		out.println("<html><head><title>지원결과</title></head><body>");
		
		out.println("<h2>" + name +"님 지원이 완료되었습니다.</h2><hr>");
		out.println("<div>지원내용</div>");
		out.println("<div>" + text + "</div>");
		
		out.println("</body></html>");
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
}
