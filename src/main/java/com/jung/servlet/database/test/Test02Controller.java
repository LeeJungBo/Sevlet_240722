package com.jung.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;

@WebServlet("/db/test/test02")
public class Test02Controller extends HttpServlet{
//이건 중간 숨겨진데에서 데이터 저장 기능
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		//주소가 전체 길이를 넘어가지 않게 하기위해 길이제한을 해서 어느정도가 되면 잘리게끔 하게 하기위해선 post가 좋음		
//		post메소드는 주소를 주소창에다가 직접 쓰는건 안되고 list02에서 form태그를 이용하는 수밖에 없음.(post는 주소창이 가려지기 때문에)
		
//		response.setContentType("text/plain"); 
//		PrintWriter out = response.getWriter();
//		response.sendRedirect("/db/user/list02.jsp"); 리다이렉트가 들어가서 굳이 저 위 두기능이 필요가없음 어차피 연결이 바로 list02로 갈것이니
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
	
		String name = request.getParameter("name");
		String url = request.getParameter("url");
		
		String query = "INSERT INTO `favorites`\r\n"
				+ "(`name`, `url`)\r\n"
				+ "VALUE\r\n"
				+ "('" + name + "','" + url + "');";
		
		
		
		 mysqlService.update(query);
		
		response.sendRedirect("/db/user/list02.jsp");
	}
	
	
	
}
