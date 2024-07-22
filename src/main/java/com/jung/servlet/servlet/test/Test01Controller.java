package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test01Controller extends HttpServlet {// 여기가 결국 servlet을 상속받은거
	// servlet mapping을 통해 일로 찾아올수 있게끔 함 // 컨테이너 역할은 톰캣이 함
	// 컨테이너에서 HttpServletReques, HttpServletResponse 객체를 생성
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8"); // 마찬가지
		
		response.setContentType("text/plain"); //setContentType()은 html 코드임
		
		PrintWriter out = response.getWriter(); //getWriter()은 html 코드임
		
		Date now = new Date();
		
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy년 M월 d일"); //월 일 한자리임
		
		String dateTimeString = fomatter.format(now);
		
		out.print("오늘의 날짜는 " + dateTimeString);
		
		
	}
	
	
	
	

}
