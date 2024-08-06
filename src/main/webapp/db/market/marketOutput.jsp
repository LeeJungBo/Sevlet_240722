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
<link rel="stylesheet" href="style.css">
</head>
<body>

<%
		MysqlService mysqlService = MysqlService.getInstance();
		mysqlService.connect();

		
		//이렇게 커리를 변수로 만들어주고 select메소드에 넣어도 됨
		String query = "SELECT used_goods.title, used_goods.price, seller.nickname, seller.profileImage FROM `seller` JOIN `used_goods` ON seller.id = used_goods.sellerId;";
		List<Map<String, Object>> sellerList = mysqlService.select(query);// 이전까지 seller.sellerId까지 들어가있어서 행 43행에서 자꾸 오류가 떠서 브라우저에 안떴었음
																		  // 즉, 잘 판단해서 쓸데없는 데이터는 넣지말것
		
	
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
		<section class="mt-4 d-flex justify-content-center">
			<div class="d-flex d-flex justify-content-between">
				<% for(Map<String, Object>goods:sellerList) { %>	
					<div class="goods-box mb-3">
						<div class="img-box">
					<% if( goods.get("profileImage") == null || goods.get("profileImage") ==""){ %>
						<div class="d-flex h-100 justify-content-center align-items-center">	
							<h4>이미지 없음</h4>
						</div>
					<% } else { %>
							<img class="w-100" src="<%= goods.get("profileImage") %>">
					<% } %>
						</div>
						<div class="title mt-1"><%= goods.get("title") %></div>
						<div class="price mt-1"><%= goods.get("price") %></div>
						<div class="seller mt-1"><%= goods.get("nickname") %></div>
					</div>
				<% } %>
			</div>
		</section>
		<footer>
		</footer>
		
		
		
	</div>


	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>