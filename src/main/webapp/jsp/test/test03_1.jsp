<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%--이건 연습용 즉, 숫자_1 이런 제목이면 이건 연습용이라는거 --%>
	<% 
	
		Date today = new Date(); 
		
		SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy년 M월 d일"); 
		SimpleDateFormat timeFormatter = new SimpleDateFormat("HH시 m분 s초");
	
		String dateString = dateFormatter.format(today);
		String timeString = timeFormatter.format(today);
		
		
//여기다가 두개의 값을 넣게 되면 무조건 이 두개 값이 입력이 되어야만 페이지가 뜰텐데 지금 문제는 링크하나
//만 누르게끔 되어있단 말이지 그러면 결국 이런 구성이 되면 안돼
//또한 하나의 get메소드에는 한개의 값만 들어가야하므로 두개 이상은 또 못들어가
		
		// String date = request.getParameter("date");
		// String time = request.getParameter("time");
		
		// 한개의 값만 입력이 되게끔 구성이 되어있다(input페이지에 링크 두개중 한개만 클릭 가능) 
		// 즉 get메소드 하나가 등장해야하고
		// 그 값에 따라서 페이지에 뜨는 html이 달라져야한다.
		// 결국 get메소드는 하나여야 한다.
		String what = request.getParameter("what");
		//what은 결국 어떤 경우에는 1번을 어떤 경우에는 2번을 띄어야한다.
		//즉 어떤 조건하에 이걸 실행 시킬꺼야
		String result = "";
		if(what.equals("date")){//변수 하나로 이렇게 두개의 다른 값이 나오게끔 가능하다.
			result = "오늘 날짜는" + dateString;
		}else if(what.equals("time")){//여기 timeString이 나올수가없지 왜냐하면 현재 분,초 까지 다 적어야하는데 초는 넣어줄수있는값이  아니다.(매초마다 바뀌니)
			result = "오늘 시간은" + timeString;
		}
	%>
	
	<%-- <div>오늘 날짜 <%= dateString %></div>
		 <div>오늘 시간 <%= timeString %></div> 애초에 화면에 이렇게 두개가 떠있으면 안돼
	--%>
	
	<%-- 두개의 화면을 띄울수 없으니 한개의 문구만 뜨게끔 구성 --%>
	<div class="container">
		<div class="display-4"><%= result %></div>
	</div>
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>