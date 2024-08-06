package com.jung.servlet.database.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;

@WebServlet("/db/test/test01")
public class Test01Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = MysqlService.getInstance();
		
		mysqlService.connect();
		
		List<Map<String, Object>> resultList = mysqlService.select("SELECT `address`, `area`, `type` FROM `real_estate` ORDER BY `id` DESC LIMIT 10;");
		
		for(Map<String,Object> resultMap:resultList) {
			
			String address = (String)resultMap.get("address");
			int area = (Integer)resultMap.get("area");
			String type = (String)resultMap.get("type");
		
			out.println("매물 주소 : " + address + ", 면적 : " + area + ", 타입 : " + type);
		}
		
		
		
		// 브라우저에 출력값이 안뜨는데 어떤게 문제인지?
		// 내림차순으로 해야되는데 어떻게 여기서 적용시켜야하는지
		
		
		String query = "INSERT INTO `real_estate`\r\n"
				+ "(`realtorId`, `address`, `area`, `type`, `price`, `rentPrice`)\r\n"
				+ "VALUES\r\n"
				+ "(3, '헤라펠리스 101동 5305호', 350, '매매', 1500000, NULL);";
		// 물어볼것 : 여기서만 해도 되는지 아니면 mysql가서 인서트를 해주고 와야되는건지
		
		int count = mysqlService.update(query);
		
		out.println("삽입 개수 : " + count);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
