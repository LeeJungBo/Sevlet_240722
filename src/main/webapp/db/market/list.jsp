<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.jung.servlet.common.MysqlService" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HONG당무 마켓</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="style.css">
</head>
<body>
	<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();

		
		//이렇게 커리를 변수로 만들어주고 select메소드에 넣어도 됨
		String query = "SELECT * FROM `seller`";
		List<Map<String, Object>> sellerList = mysqlService.select(query);
	
		
	
	%>
	
	
	<div id="wrap">
		<header class="d-flex bg-danger justify-content-center font-weight-bold">
			<h1 class="align-content-center text-white">HONG당무 마켓</h1>
		</header>
		<nav class="main-manu bg-danger align-content-center">
			<ul class="nav nav-fill">
				<li class="nav-item"><a href="#" class="nav-link"><h4 class="font-weight-bold text-white">리스트</h4></a></li>
				<li class="nav-item"><a href="#" class="nav-link"><h4 class="font-weight-bold text-white">물건 올리기</h4></a></li>
				<li class="nav-item"><a href="#" class="nav-link"><h4 class="font-weight-bold text-white">마이 페이지</h4></a></li>
			</ul>
		</nav>
		<section class="align-content-center">
			<h1 class="m-3">물건 올리기</h1>
			<form method="get" action="/db/test/test03market">
				<div class="d-flex justify-content-around">
					<select class="form-control col-2" name="nickName"><!-- 여기는 seller데이터를 활용 따라서 여기서는 어쩌면 join이 쓰일수있음 -->
						<option class="selected">-아이티 선택-</option>
					<% for(Map<String, Object>goods:sellerList) { %> 
						<option><%= goods.get("nickname") %></option>
					<% } %>	
					</select>
					<input type="text" name="title" class="form-control col-5">
					<div class="d-flex col-2"><input type="text" name="price" class="form-control w-75"><div class="bg-info form-control align-content-center text-center w-25">원</div></div>
				</div><%-- 아래꺼 높이는 textarea에서 결국 div에 갖혀져 있어서 높이조절이 직접적으로 안됨 따라서 div에서 높이 조절을 해줘야 함 --%>
				<div class="d-flex justify-content-center h-50 mt-3"><textarea  class="form-control col-11" name="description"></textarea><br></div>
				<div class="d-flex justify-content-center mt-3"><label class="form-control col-1">이미지 url</label><input type="text" class="form-control col-10" name="image"></div>
				<button type="submit" class="form-control mt-3">저장</button>
			</form>
		</section>
		<footer class="text-center small align-content-center">
		copyright 2019.HONG All Rights Reserved
		</footer>
	</div>
	
	<%-- usedgoods의 title 
		 usedgoods의 price
		 seller 의 nickname 
		 seller 의 profileImg--%>


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>