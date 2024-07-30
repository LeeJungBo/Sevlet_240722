<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
    List<Map<String, String>> list = new ArrayList<>();
    Map<String, String> map = new HashMap<String, String>() {{ put("ch", "5"); put("name", "SBS"); put("category", "지상파"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "7"); put("name", "KBS2"); put("category", "지상파"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "9"); put("name", "KBS1"); put("category", "지상파"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "11"); put("name", "MBC"); put("category", "지상파"); } };
    list.add(map);

    map = new HashMap<String, String>() {{ put("ch", "54"); put("name", "OCN"); put("category", "영화"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "56"); put("name", "Screen"); put("category", "영화"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "57"); put("name", "Mplex"); put("category", "영화"); } };
    list.add(map);

    map = new HashMap<String, String>() {{ put("ch", "30"); put("name", "KBS 드라마"); put("category", "드라마"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "32"); put("name", "MBC 드라마"); put("category", "드라마"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "34"); put("name", "Olive"); put("category", "드라마"); } };
    list.add(map);

    map = new HashMap<String, String>() {{ put("ch", "3"); put("name", "tvN"); put("category", "예능"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "28"); put("name", "MBC Every1"); put("category", "예능"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "48"); put("name", "JTBC2"); put("category", "예능"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "49"); put("name", "E채널"); put("category", "예능"); } };
    list.add(map);

    map = new HashMap<String, String>() {{ put("ch", "120"); put("name", "SPOTV"); put("category", "스포츠"); } };
    list.add(map);
    map = new HashMap<String, String>() {{ put("ch", "121"); put("name", "KBSN 스포츠"); put("category", "스포츠"); } };
    list.add(map);

	
    String what = request.getParameter("what");
    
	//이렇게 비슷한 화면에서 어떤 부분만 바뀔때는 한페이지로 모두 표현이 가능하다.
%>
	<div id="wrap">
		<header class="d-flex justify-content-center align-items-center"><h1 class="text-danger">SK broadband IPTV</h1></header>
		<nav class="main-manu bg-danger">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="/jsp/test/test09.jsp?" class="text-white">전체</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?what=지상파" class="text-white">지상파</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?what=드라마" class="text-white">드라마</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?what=예능" class="text-white">예능</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?what=영화" class="text-white">영화</a></li>
				<li class="nav-item"><a href="/jsp/test/test09.jsp?what=스포츠" class="text-white">스포츠</a></li>
			</ul>
		</nav>
		<section class=" contents">
			<table class="table text-center"><%--아하 이 아이템이 위에 nav들을 꽉 채울 아이템들을 얘기하는구나 --%>
				<thead>
					<tr>
						<th>채널</th>
						<th>채널명</th>
						<th>카테고리</th>
					<tr>
				</thead>
				<tbody>
					<% for(Map<String, String>broadcastStation:list){ %>
						<% if( what == null || what.equals(broadcastStation.get("category")) ){ %>
					<tr>       <%-- 이렇게 what에 안에 들은 값이 없을때는 == 으로 null로 표현 (equals가 아님) --%>
						<td><%= broadcastStation.get("ch") %></td>
						<td><%= broadcastStation.get("name") %></td>
						<td><%= broadcastStation.get("category") %></td>
					</tr>
						<% } %>
					<% } %>
				</tbody>
			</table>
		</section>
		<footer class="text-center">
			<div>copyright</div>
		</footer>	
	</div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>