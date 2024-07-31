package com.jung.servlet.database.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/db/ex/ex01")
public class Ex01Controller extends HttpServlet {

	@Override
	public  void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/plain");
		
		PrintWriter out = response.getWriter();
		
		// 데이터 베이스 접속 (예외상황들 많이 발생하는것을 방지)
		try {
			// 데이터 베이스 접속(에 필요한 mysql주소)
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 접속주소,포트,id,password // mysql:// -> http랑 비슷한거  
			String url = "jdbc:mysql://localhost:3306/dulumary";
			String id = "root";
			String password = "root";
			
			Connection connection = DriverManager.getConnection(url, id, password);//접속을 해주는 객체를 리턴해준다 // getConnection 이 기능이 중요한것(저 3개를 갖다 쓰기위한거)
			Statement statement = connection.createStatement();//얘를 통해서 쿼리 수행
			
			String query = "SELECT * FROM `used_goods`;";//얘 입장은 이거 그냥 문자열 그래서 틀렸는지 안틀렸는지 안알려줌
			
			ResultSet resultSet= statement.executeQuery(query);//RedsultSet iter랑 비슷 따라서 쿼리에 있는 걸 맨앞에 있다가 한행씩 접근할수 있게 하는 도구
			
			while(resultSet.next()){//iter랑 비슷(다음께 있는 행을 가리켜라)
				String title = resultSet.getString("title");//쿼리에 있는 것들을 뽑아쓰기 위한거
				int price = resultSet.getInt("price");
				String description = resultSet.getString("description");
				out.println("제목 : " + title + "가격 : " + price + "설명 : " + description);
			}
			
			
			String title = resultSet.getString("title"); //다음꼐 있는 행에 문자열만 가져와라
			
			out.println(title);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
