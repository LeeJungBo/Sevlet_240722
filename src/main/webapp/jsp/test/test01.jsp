<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%-- 1. 점수들의 평균구하기
	스크립틀릿(scriptlet) <% %> 문법을 사용해서 주어진 점수들의 평균을 구하세요. --%> 
	
	
	<%
		int[] scores = {80, 90, 100, 95, 80};
	
		double sumScores = 0;
		for(int i = 0; i < scores.length; i++){
			sumScores += scores[i];
		}
	%>
	<div><h1>점수 평균은 <%= sumScores / scores.length %>점 입니다.</h1></div>
	
	
	<%-- 2. 채점 결과
	아래 채점표로 시험점수가 몇점인지 구하세요. --%>
	
	<%
	List<String> scoreList = Arrays.asList(new String[]{"X", "O", "O", "O", "X", "O", "O", "O", "X", "O"});
	//이런 리스트의 import값은 직접 써줘야한다.
	//O당 10점이다.
	
	int sum = 0;
	for(String score:scoreList){
		if(score.equals("O")){
			sum = sum + 10; // score += 10 이런식도 됨
		}else if(score.equals("X")){
			sum = sum + 0;
		}
	}
	
	%>
	<div><h1>체점 결과는 <%= sum %>점 입니다.</h1></div>
	
	
	<%-- 3. 1부터 n까지의 합계를 구하는 함수
	jsp의 선언문 <%! %> 문법을 사용해서 1부터 N까지의 합을 구하는 함수를 만드세요.
	만든 함수를 이용해서 50까지의 합의 결과를 출력하세요. --%> 
	<%!
		public int getSum(int N){
		
			int total = 0;
			for(int i = 0; i < N + 1; i++){
			
			total = total + i; // sum += i; 이렇게도 됨
			
			}
			
			return total;
		}
	%>
	<div><h1>1에서 50까지의 합은 <%= getSum(50) %></h1></div>
	
	
	<%-- 4. 나이 구하기
	주어진 생년월일을 가진 사람의 나이를 구하세요.
	String birthDay = "20010820"; --%> 
	
	<%
		String birthDay = "20010820";
		Date today = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		String todayString = formatter.format(today);
		
		int currentYear = Integer.parseInt(todayString.substring(0,4));
		int year = Integer.parseInt(birthDay.substring(0,4));
	
		int age = currentYear - year + 1;
	
	%>
	<div><h1><%= birthDay %> 의 나이는 <%= age %>살 입니다.</h1></div>
		
	
	
	
	
	
	
	
</body>
</html>