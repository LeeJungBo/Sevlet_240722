<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>

	<%
		double firstBox  = Integer.parseInt(request.getParameter("firstBox"));
		String secondBox = request.getParameter("secondBox");
		double thirdBox = Integer.parseInt(request.getParameter("thirdBox"));
		
		double result = 0;
		// String sign = null; 이런식으로 기호를 따로 받아도 됨 sign = "+";이런식으로 밑에 조건쪽에 추가해줘도 된다
		if(secondBox.equals("X")){
			result = firstBox * thirdBox;
		}else if(secondBox.equals("+")){
			result = firstBox + thirdBox;
		}else if(secondBox.equals("-")){
			result = firstBox - thirdBox;
		}else{
			result = firstBox / thirdBox;
		}
	
	
	%>
	<div class="container">
		<h2>계산 결과</h2>
		<div class="display-4"><%= firstBox %> <%= secondBox %> <%= thirdBox %> = <span class="text-primary"><%= result %></span></div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>