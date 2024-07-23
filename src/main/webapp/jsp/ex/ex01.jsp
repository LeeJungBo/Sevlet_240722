<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> <!-- 이건 import값을 직접 넣어줘야함 -->
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>1. 기본문법</h2>
	
	<!-- html 주석  -->
	<%--  스크립트릿! 서버화면에 나옴--%>
	<!-- 밑에께 자바코드 넣는데 -->
	<%
		// 1부터 10까지 합 구하기
		int sum = 0;
		for(int i = 0; i <= 10; i++){
			sum += i;
		}
	%>
	<h3>합계 : <%= sum %></h3>	
	<input type="text" value="<%= sum %>">
	<div><%= sum * 2 %></div>
	
	<h2>2. 리스트 다루기</h2>
	<%
		// 동물이름 리스트
		List<String> animalList = new ArrayList<>(); 
		animalList.add("cat");
		animalList.add("dog");
	%>
	
	<ul>
		<li><%= animalList.get(0) %></li>
		<li><%= animalList.get(1) %></li>
	</ul>
	
	<h3>3. 메소드 만들기</h3><!-- 메소드를 직접넣어주는건 흔치는 않음 -->
	
	<%!
		// hello World를 문자열로 리턴하는 메소드
		public String getHelloWorld(){
		return "Hello World";
		
	    }
	%>
	
	<h4><%= getHelloWorld() %></h4>
	
	
	
</body>
</html>