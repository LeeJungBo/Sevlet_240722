package com.jung.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/ex03")
public class Ex03Controller extends HttpServlet{
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
//		response.setContentType("text/html");
		response.setContentType("application/json");// json은 이 형식임
		
		PrintWriter out = response.getWriter();
		
		
		//이름과 생년월일을 전달받고(파라미터값으로 ㄱㄱ)
		//이름과 나이를 정리한 html을 작성한다.
		//이 의미는 나는 request에서 파라미터 name을 받아와야 응답할꺼야라고 하는거
		//getParameter는 문자열이구나
		String name = request.getParameter("name");
		String birthday = request.getParameter("birthday"); // 20040512
							//요청한 birthday가 request로 꺼내봤더니 없어서 오류 500이 뜸
	//http://localhost:8080/servlet/ex03?name=이중보&birthday=20120403 이런식으로 브라우저에서 birthday값을 직접 요청해줘야한다.
		//즉, 요청하는 쪽에서 그 값을 요청해줘야한다는거 (검색에서 요청하는쪽에서 입력해주는것과 같은거)
		// 이 방식은 클릭을 통해 링크로 요청도 가능한것이다.(이 방법은 
		
		
		String yearString = birthday.substring(0,4);
		int year = Integer.parseInt(yearString);
		
		int age = 2024 - year + 1;
		
//		out.println("<html><head>이름,나이</title></head><body>");
//		out.println("<h2> 이름 : " +  name + "</h2>");
//		out.println("<h2> 생일 : " +  birthday + "</h2>");
//		out.println("</body></html>");
		// 이름, 나이
		// response에 데이터만 담아서 보내야 하는 경우(무수히 많은 데이터들이 있으므로)
		// 데이터를 표현하는 규격을 통해 문자열을 담는다.
		// json (자바에서 list의 형식이나 map의 형식으로 데이터 보관 : 이걸 다 문자열로 표현할것이다.이걸 json으로 함)
		// 이름과 나이를 json형태로
		// json {"name" : "김인규", "age":31} \를 넣어주는건 그냥 규격임
		out.println("{\"name\":\"" + name + "\",\"age\":" + age + "}");
		
		
		
		
		
		
		
	}

}
