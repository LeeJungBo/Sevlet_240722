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
	
	int box = Integer.parseInt(request.getParameter("box"));
	
	String[]unitArray = request.getParameterValues("unit");
	
	String result = "";// 하나의 문자열로 만들라는게 result하나가 나오게끔 하라는 것이었고
	for(int i = 0; i < unitArray.length; i++){
		if(unitArray[i].equals("in")){
			double in = box / 2.54; // in은 변수이고 ""이걸 붙이게 되면 결국 html에서 나타나는 일반 문자열이 탄생하게 된다.
			result += in + "in<br>";//어쨋든 구성은 html이어서 자바코드인 \n이 아닌 <hr>
		}
		else if(unitArray[i].equals("yd")){//else를 넣어주는건 차례대로 넣어서 아닌거니깐
			double yd = box / 91.44;
			result += yd + "yd<br>";// 왜 else if냐 (여기서 else가 나오는것은 차례 i번째일때 조건식안에 있는 4가지의 모든 식을 다 이행해주는것이 아니라)
		}							// 차례 i당 먼저 in를 실행하고 "다시 처음으로 돌아가서(이게 중요한 포인트)" in를 실행해보고 in가 아니면(else) 다음 yd를 실행한다는 의미로써 else if가 나와야한다.
		else if(unitArray[i].equals("ft")){
			double ft = box / 30.48;
			result += ft + "ft<br>";
		}
		else if(unitArray[i].equals("m")){
			double m = box / 100.0;
			result += m + "m<br>";//문자열을 포함한 변수를 만들어줘야한다.
		}
	}
	
	%>

	<div>변환 결과</div>
	<h3><%= box %>cm<h3>
	<h3>
		<%= result %>
	</h3>
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>