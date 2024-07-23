package com.jung.servlet.servlet.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/servlet/test08")
public class Test08Controller extends HttpServlet {
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		
		String search = request.getParameter("search");
		
		
		List<String> list = new ArrayList<>(Arrays.asList(// 묶음으로 해서 클래스값으로 리턴 
		        "강남역 최고 맛집 소개 합니다.", 
		        "오늘 기분 좋은 일이 있었네요.", 
		        "역시 맛집 데이트가 제일 좋네요.", 
		        "집에 가는 길에 동네 맛집 가서 안주 사갑니다.",
		        "자축 저 오늘 생일 이에요."));
		
		out.println("<html><head><title></title></head><body>");
		

		for(String text:list) {
			
			if(text.contains(search)) {
				
				String newText= text.replace(search, "<b>" + search + "</b>");//이런 문자열은 반드시 return값으로 변경해줘서 바꿔줘야한다.
				//이렇게 리턴값을 변수에 저장한채 나올수있게 해준다
				out.println("<div>" + newText + "</div> <hr>");
			}

		}
		
		out.println("</body></html>");
		
		
		
		
		
		//		for(int i = 0; i < list.size(); i++) {
//			
//			if(list.get(i).contains(search)) {
//				
//				list.get(i).replace(search, search);
//	
//				out.println(list.get(i) + "<hr>");
//			}
//
//		}
//		
//		out.println("</body></html>");
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
