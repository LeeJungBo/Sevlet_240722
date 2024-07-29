<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%
	List<String> goodsList = Arrays.asList(new String[]{ 
		    "저지방 우유", "요플레 4개", "딸기 1팩", "삼겹살 300g", "생수 6개", "주방 세제"
		});
	%>
	<div class="container">
		<h1>장 목록</h1>
		<table border="1" class="table text-center"><%-- 무조건 태그를 먼저 작성하고 할것 왜냐하면 데이터부터 넣어버리면 문제생기면 무조건 더 힘들어짐 --%>
			<thead>
				<tr>
					<th>번호</th>
					<th>품목</th>
				</tr>
			</thead>
			<tbody>
				<% int count = 1; %><%--이거같은 경우 향상된 for문이 아닌 그냥 for문을 쓰는게 좋다. --%>
				<% for(String goods:goodsList){ %>
				<tr><%--i(i=0은 건들면 안된다 왜냐하면 배열 첫번째꺼를 쓰기 위해서 - 밑에꺼에 i+1을 통해 1부터 시작하게끔)를 쓰기위해 또한 goods를 표현하기위해선 goodList.get(i)  --%>
					<td><%= count %></td>
					<td><%= goods %></td>
						<% count++; %>
				<tr>
				<% } %>
			</tbody>
		</table>
	</div>
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>