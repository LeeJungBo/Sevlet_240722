package com.jung.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MysqlService  { //여러 기능을 한클래스에 메소드로 구현해서 다른 클래스에서 단순한 코드로 쓰일수 있게 하기위함
	
	private Connection connection; //여러메소드에서 써야해서 멤버변수로 고정
	
	// 클래스를 설계하는 입장에서(서버에서 주고 받고 하면서 결과를 출력하는 과정에서 부하가 일어날수 있음)
	// 객체를 하나만 만들어서 공용으로 사용하도록 설계
	// 이런 방식을 "Singleton"이라 한다(Design pattern)
	// static: 객체 생성 없이 사용 가능한 메소드, 멤버 변수
	private static MysqlService mysqlService = null;// 최초에 null (클래스 자체를 변수로)
	// MysqlService의 타입을 이용해주는데 지금 MysqlService의 클래스 객체를 만드는중 즉, 모순적이다
	//따라서 이럴땐 static을 이용하여 객체가 먼저 만들어져 있지도 않아도 이렇게 메소드로 써줄수 있다.
	
	
	// MysqlService의 타입을 이용해주는데 지금 MysqlService의 클래스 객체를 만드는중 즉, 모순적이다
	//어떤 쿼리를 써야하는지 이 이클립스에서는 모르니 불러와줘야한다.
	// singleton 객체를 돌려주는 메소드
	// static: 객체 생성 없이 사용 가능한 메소드, 멤버 변수(왜냐하면 MysqlService라는 객체를 이 메소드를 만들기 전에는 만들어 준적이 없음)
	// 위에꺼는 멤버변수이지 객체가 아니다.(그리고 객체가 비어있다(null))
	// static 메소드 안에서는 static 멤버변수만 사용 가능(static변수로만 만들어진 변수만 사용가능)
	// MysqlService의 타입으로 돌려받기 위해(MysqlService클래스 내부의 요소들을 이용하기위해)
	// MysqlService타입을 이용하여 메소드를 만들어줘야하는데 현재 MysqlService의 클래스가 존재하지 않기때문에 
	// static을 이용하여 존재하지않는 MysqlService타입을 이용하여 메소드 생성
	
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
			String url = "jdbc:mysql://localhost:3306/dulumary";//3306은 mysql들어가면 그 블록에 써져있음(잘 못보고 들어가서 몰랐던거
			String id = "root";
			String password = "root";
			
			connection = DriverManager.getConnection(url, id, password);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	
	// select 쿼리 수행(query를 수행하면 결과가 나오고 그걸 써주니 resultset으로
	public List<Map<String, Object>>select(String query) {
			//메소드의 규격은 리턴타입, 메소드 이름(select), 파라미터 이 세가지만 들어가게 되어있다
		try {	
			Statement statement = connection.createStatement();// update메소드에도 들어있다 즉 이건 어떤 쿼리의 상태를 갖고오는것같다
			ResultSet resultSet = statement.executeQuery(query);// execute 실행하다 // update메소드에도 들어있다 즉 이건 어떤 쿼리의 상태를 갖고오는것같다
			
			List<Map<String, Object>> resultList = new ArrayList<>();//mysql을 자바 형식으로 바꾸는거
			
			// 전체 컬럼이네
			ResultSetMetaData rsmd = resultSet.getMetaData();//어떤 대상 컬럼의 하는지 모르니 이걸 통해 데이터를 가져오기(한행 한행의 컬럼_
			int columnCount = rsmd.getColumnCount();//갯수를 가져옴//인덱스를 가져오는거여서 컬럼의 갯수를 가져오고
			
			List<String> columnNames = new ArrayList<>();//한행한행의 컬럼이름들을 리스트로 모아놓으거 즉, id ~~ createAt 등 쫙 모아둔것
			
						
					for(int i = 1; i <= columnCount; i++) {//int i = 1 이건 사용법이 그런거다 
						columnNames.add(rsmd.getColumnName(i)); //더해준다 저걸 //rsmd라는
					}					//getColumnName(i) 각 i번째에 있는 컬럼들(rsmd는 set형태의 집합으로 되어있는 변수)
				
					while(resultSet.next()) {
						Map<String, Object>resultMap = new HashMap<>();
						// 컬럼 이름을 통해 값을 하나씩 얻어 와서
						// 한 행의 정보를 컬럼 단위로 맵에 추가
						for(String name:columnNames) {
							Object value = resultSet.getObject(name);//getObject이라고 한건 현재 그 컬럼에 있는 타입(클래스)이 어떤건지 알수없기에 모든 타입(클래스)의 부모클래스를f
						
							resultMap.put(name, value);
						}
					
						resultList.add(resultMap);
						
					}                                 
					
					return resultList;
			
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
