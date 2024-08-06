package com.jung.servlet.database.test;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;

@WebServlet("/db/test/test02_1")
public class Test02_1Controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		
		
	MysqlService mysqlService = MysqlService.getInstance();
	
	mysqlService.connect();
	
	String id = request.getParameter("id");
	
	String deleteQuery = "DELETE FROM `favorites` WHERE `id` = " + id + ";";
	
	mysqlService.update(deleteQuery);
	
	response.sendRedirect("/db/user/list02.jsp");
	
	}
	
}
