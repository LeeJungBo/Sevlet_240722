package com.jung.servlet.servlet.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Ex01Controller extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// response header
		// 응답 데이터에 대한 정보
		// character set
		// 밑에껀 고정
		response.setCharacterEncoding("utf-8");//문자열을 전달할때 어떤 문자열로 보낼껀지\
		// 데이터 타입(웹 서비스에 대한 타입 ex.http 일반적으로 브라우저는 html확장자가 있다.)
		// MIME
		// text/plain : 그냥 문자열
		// 우리가 만드는 결과물에 따라 달라짐
		response.setContentType("text/plain");
		
		//response body(결과물)
		PrintWriter out = response.getWriter(); 
		out.println("URL Mapping 예제");
		
		// 현재날짜 시간 response에 담기 // 현재 시간과 날짜가 저장이 됨
		Date now = new Date();
		
		out.println(now); //println은 객체가 있으면 object클래스에 있는 toString을ㄹ 구현시켜줌
		
		// 2024년 07월 17일 21:28:30  // 가로안에 어떻게 나타낼것인지로 나타내기 // 월은 대문자 MM // 24시간 기준 대문자 H // 12시간이면 소문자 h
		SimpleDateFormat fomatter = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");
		
		String dateTimeString = fomatter.format(now);
		
		out.println(dateTimeString);
		
		
	}
	
	
	
	
	
	
}
