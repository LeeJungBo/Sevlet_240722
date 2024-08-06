package com.jung.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;

@WebServlet("/db/user/insert")
public class UserCreateController extends HttpServlet{

	
	@Override
	public void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
//		response.setContentType("text/plain"); redirect정보만 전달하면 되어서 이 2개 다 필요없다 
//		PrintWriter out = response.getWriter();
		
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday");
		String email = request.getParameter("email");
		
		MysqlService mysqlService =MysqlService.getInstance();
		
		mysqlService.connect();
		
		String query = "INSERT INTO `new_user`\r\n"//이거 자체가 문자열
				+ "(`name`, `yyyymmdd`, `email`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "','" + birthday + "','" + email + "');";//문자열안에 변수 넣은거
		
		
		int count = mysqlService.update(query);
		
//		out.println("삽입 개수 : " + count);
		
		// 리다이렉트 (redirect)
		// 클라이언트에게 특정 페이지로 이동하도록 response에 정보를 담는다.
		// 입력이 완료되면 클라이턴트에게 list로 이동하게 하고싶다.
		response.sendRedirect("/db/user/list.jsp");//이동하라는 정보만 다룰거야 사용자에게 바로 리스트 정보가 있는 표로 이동시키게 하는거
		
		
	}
}


