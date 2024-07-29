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
	
	int number1 = Integer.parseInt(request.getParameter("number1"));
	
	String[] unit = request.getParameterValues("unit");
	
	String result = "";
	for(int i = 0; i < unit.length; i++ ){	// 반복문은 먼저 그과정에서 딱 하나만 처리하는거 그 과정을 i(여러번)번 한다는거고 그렇게 되면 결국 여러개가 합쳐져서 나올거니
		if(unit[i].equals("in")){			// 즉 첫번째 과정에서 in가 있는지 찾아보고 있으면 첫번째과정을 끝내는거!!!!! 
			double inch = number1 / 2.54;	// 그리고 두번째과정에서 in가 아니고 만약 yard이면 yard만 담아두는거 이런이유로 else if가 나오는 거임
			result += inch + "in<br>";//얘네를 전체 이어줘야한다. 그럴라면 html에다가 값도 없는데 변수를 따로 써주는것은 이상한 값이 나온다.
		}
		else if(unit[i].equals("yard")){
			double yard = number1 / 91.44;
			result += yard + "yd<br>";
		}
		else if(unit[i].equals("feet")){
			double feet = number1 / 30.48;
			result += feet + "ft<br>";
		}
		if(unit[i].equals("meter")){
			double meter = number1 / 100;
			result += meter + "m<br>";
		}
	}
		
		
		
	%>
	
	
	<h1>변환 결과</h1>
	
	

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>