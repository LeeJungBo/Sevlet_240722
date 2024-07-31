package com.jung.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class MysqlService  { //여러 기능을 한클래스에 메소드로 구현해서 다른 클래스에서 단순한 코드로 쓰일수 있게 하기위함
	
	private Connection connection; //여러메소드에서 써야해서 멤버변수로 고정
	
	// 클래스를 설계하는 입장에서(서버에서 주고 받고 하면서 결과를 출력하는 과정에서 부하가 일어날수 있음)
	// 객체를 하나만 만들어서 공용으로 사용하도록 설계
	// 이런 방식을 "Singleton"이라 한다(Design pattern)
	private static MysqlService mysqlService = null;// 최초에 null (클래스 자체를 변수로)
	
	
	// singleton 객체를 돌려주는 메소드
	// static: 객체 생성 없이 사용 가능한 메소드, 멤버 변수
	// static 메소드 안에서는 static 멤버변수만 사용 가능(static변수로만 만들어진 변수만 사용가능)
	public static MysqlService getInstance() {//돌려줄 객체는 MysqlService 따라서 타입으로 넣어버림
		
		if(mysqlService == null) {//객체가 없을때는 새로운 객체를 그냥 생성
			mysqlService = new MysqlService();
		}
		//객체가 있으면 그대로 그 객체를 이용
		return mysqlService;
	}
	
	
	
	// 접속(Ex01Controller 이렇게 모든 클래스에 일일히 하는건 번거롭고 지저분해서 한번에 해결하기 위한거
	public void connect() {
		try {
			// 데이터 베이스 접속(에 필요한 mysql주소)
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 접속주소,포트,id,password // mysql:// -> http랑 비슷한거  
			String url = "jdbc:mysql://localhost:3306/dulumary";
			String id = "root";
			String password = "root";
			
			connection = DriverManager.getConnection(url, id, password);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	
	// select 쿼리 수행(query를 수행하면 결과가 나오고 그걸 써주니 resultset으로
	public ResultSet select(String query) {
		
	try {	
		Statement statement = connection.createStatement();
		return statement.executeQuery(query);
		}catch(SQLException e) {
			
			return null;//예외상황이 많이 발생해서
		}
		
		
	}
	
	// insert, update, delete 쿼리 수행(얘네는 하나로 묶어서 수행가능) 
	public int update(String query) {// 얘는 쿼리 수행을 보면 수정하거나 그럴때 몇행이 수정되었다고 메시지에 뜸 그걸 리턴해주는거
		
		try {
			Statement statement = connection.createStatement();
			// 실행된 행의 개수 return
			return statement.executeUpdate(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			// 위해 기능이 잘못수행되면 -1을 띄워 알수있게 해준다(예외 상황을 어떻게 처리할지)
			return -1;
		}
	}
	
	
	// 접속 끊기
	public void disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
