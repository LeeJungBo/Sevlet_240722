<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jung.servlet.common.MysqlService" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style1.css">
</head>
<body>
		<% 
			MysqlService mysqlService = MysqlService.getInstance();
			mysqlService.connect();
			
			List<Map<String, Object>> resultList = mysqlService.select("SELECT * FROM `favorites` ORDER BY `id` DESC");
			//mysqlService.select("SELECT * FROM `favorites` ORDER BY `id` DESC");는 원래 set형식으로 저장되지만 이걸 리스트 형식으로 바꾼거
		
		%>
		
		
		<table  class="table text-center">
			<thead>
				<tr>
					<th>사이트</th>
					<th>사이트 주소</th>
				</tr>
			</thead>
			<tbody>
				<% for(Map<String, Object> site:resultList){ %>
				<tr>
					<td><%= site.get("name") %></td>
					<td><a href="<%= site.get("url") %>" target="_blank"><%= site.get("url") %></a></td>
					<td><a href="/db/test/test02_1?id=<%= site.get("id") %>" class="btn btn-danger btn-sm ml-4">삭제</a></td>
				</tr>
				<% } %>
			</tbody>
		</table>
		
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>	
</body>
</html>