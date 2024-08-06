<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jung.servlet.common.MysqlService" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자 목록</title>
</head>

<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();
		
		List<Map<String, Object>> resultList = mysqlService.select("SELECT * FROM `new_user`ORDER BY `id` DESC");
	
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>이름</th>
				<th>생년월일</th>
				<th>이메일</th>
				<th>자기소개</th>
			</tr>
		</thead>
		<tbody>
		<% for(Map<String, Object> resultMap:resultList){ %>
			<tr>
				<td><%= resultMap.get("name") %></td>
				<td><%= resultMap.get("yyyymmdd") %></td>
				<td><%= resultMap.get("email") %></td>
				<td><%= resultMap.get("introduce") %></td>
			</tr>
		<% } %>	
		</tbody>	
	</table>




</body>
</html>