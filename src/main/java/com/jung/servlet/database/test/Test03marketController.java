package com.jung.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;

@WebServlet("/db/test/test03Market")
public class Test03marketController extends HttpServlet {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		
		String nickName = request.getParameter("nickName");
		String title = request.getParameter("title");
		String description = request.getParameter("decription");
		int price = Integer.parseInt(request.getParameter("price"));//parseInt에 null값이 들어가면 안된다 - 잊지말것
		String image = request.getParameter("image");
		
		String query = "INSERT INTO `used_goods`\r\n"
				+ "(`title`, `price`, `nickname`, `profileImage`, `description`)\r\n"
				+ "VALUES\r\n"
				+ "('"+ nickName + "','" + title + "','" + description + "','" + price + "','" + image + "');";
		
		
		mysqlService.update(query);
		
		
		
		response.sendRedirect("/db/market/marketOutput.jsp");
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
