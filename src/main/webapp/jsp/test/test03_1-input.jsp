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
	<h1>날짜,시간 링크</h1>
	<div class="d-flex">	<%-- 어차피 우리는 링크를 타고 페이지를 이동시키는거다 이말은 그냥 링크에다 그대로 때려박고 그 페이지를 띄우고 값을 보이면 된다. --%>
		<a href="/jsp/test/test03_1.jsp?what=time" class="btn btn-info">현재 시간 확인</a><%--둘중에 한키만 누르게 되어있다. --%>
		<a href="/jsp/test/test03_1.jsp?what=date" class="btn btn-success">현재 날짜 확인</a><%--이거 자체가 어떤 값을 고유하게 갖는게 아니다. 또한 get메소드는 하나의 값을 갖는데 여기는 what이 2개 --%>
	</div>					<%--애초에 a태그의 링크는 그값으로 바로 이동이 가능하게끔 할수 있기에 form태그가 필요가 없다. --%>
						    <%--이렇게 get메소드는 주소를 통째로 보이기에 보안에는 취약 --%>
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>