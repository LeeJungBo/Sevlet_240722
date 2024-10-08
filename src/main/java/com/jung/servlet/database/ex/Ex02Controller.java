package com.jung.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jung.servlet.common.MysqlService;
@WebServlet("/db/ex/ex02")
public class Ex02Controller extends HttpServlet {
	//Ex01에 있던걸 메소드를 통해 그대로 간소화
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		MysqlService mysqlService = MysqlService.getInstance();//static을 통해 getInstance메소드를 통해 그냥 바로 생성
		//접속(메소드로 한방에 끝내버림)
		mysqlService.connect();
		
		List<Map<String, Object>> resultList = mysqlService.select("SELECT * FROM `used_goods`");
		
		for(Map<String, Object> resultMap:resultList) {
			
			String title = (String)resultMap.get("title");
			int price = (Integer)resultMap.get("price");
			
			out.println("제목 : " + title + "가격 : " + price);
		}
		
		String query = "INSERT INTO `used_goods`\r\n" //브라우저에서 계속 새로고침을 하면 이게 insert 삽입되는거여서 계속 추가됨
				+ "(`sellerId`, `title`, `price`, `description`)\r\n"
				+ "VALUE\r\n"
				+ "(3, '고양이 간식 팝니다', 2000, '안먹어서 팔아요');";
		
		int count = mysqlService.update(query);
		// 의도된것은 1행만 수정했으니 1만 떠야한다.
		out.println("삽입 결과 : " + count);
	
	}
	
}
