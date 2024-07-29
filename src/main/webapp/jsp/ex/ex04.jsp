<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %> <!-- * 꼼수임 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료구조 다루기</title>
</head>
<body>


	<%
		// 과일 이름 리스트
		List<String> fruitList = new ArrayList<>();
		fruitList.add("사과");
		fruitList.add("바나나");
		fruitList.add("딸기");
		// 사과 바나나 딸기
		String result = "";
		for(String fruit:fruitList){
			result += fruit + " ";
		}
	
	%>

		
		<h3><%= result %></h3>
		
		<table border="1">
		
		<% for(String fruit:fruitList){ %>	
			<tr>
				<td><%= fruit %></td>
			</tr>
		<% } %>
			
		</table>
		
		
		<%
			Map<String, Integer> map1 = new HashMap<>();
			map1.put("국어", 90);
			map1.put("수학", 95);
			map1.put("영어", 80);
			
			Map<String, Integer> map2 = new HashMap<>();
			map1.put("국어", 40);
			map1.put("수학", 50);
			map1.put("영어", 45);
			
			List<Map<String, Integer>> scoreList = new ArrayList<>();
			scoreList.add(map1);
			scoreList.add(map2);
			
			
		%>
		
		<table border="1">
			<thead>
				<tr>
					<th>국어</th>
					<th>수학</th>
					<th>영어</th>
				</tr>
			</thead>
			<tbody>
				<% for(Map<String, Integer> scoreMap:scoreList){ %>
				<tr>
					<td><%= scoreMap.get("국어") %></td>
					<td><%= scoreMap.get("수학") %></td>
					<td><%= scoreMap.get("영어") %></td>
				</tr>
				<% } %>
				
			</tbody>		
		
		</table>
		
		


</body>
</html>