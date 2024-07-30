<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	<%
		List<Map<String, Object>> list = new ArrayList<>();
	    Map<String, Object> map = new HashMap<String, Object>() {
	        { 
	            put("id", 1000);
	            put("title", "아몬드"); 
	            put("author", "손원평"); 
	            put("publisher", "창비");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/267/x9788936434267.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1001);
	            put("title", "사피엔스"); 
	            put("author", "유발 하라리"); 
	            put("publisher", "김영사");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/464/x9788934972464.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1002);
	            put("title", "코스모스"); 
	            put("author", "칼 세이건"); 
	            put("publisher", "사이언스북");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/892/x9788983711892.jpg");
	        } 
	    };
	    list.add(map);
	
	    map = new HashMap<String, Object>() {
	        { 
	            put("id", 1003);
	            put("title", "나미야 잡화점의 기적"); 
	            put("author", "히가시노 게이고"); 
	            put("publisher", "현대문학");
	            put("image", "http://image.kyobobook.co.kr/images/book/xlarge/194/x9788972756194.jpg");
	        } 
	    };
	    list.add(map);
	    
	    String name = request.getParameter("title");
	    
	    for(Map<String, Object>book:list){
	    	if(book.get("title").equals(name)){
	    		
	    	}
	    }
	    
	   String title = request.getParameter("title");// 이거 아이디로 받아와도 됨 // 정수로 변환
	   // int id = Integer.parseInt(request.getParameter("id")); 이렇게도 가능
	    
	    
	%>
	
	<% for(Map<String, Object> book: list) { %>
		<% if(title.equals(book.get("title"))){ %> <%-- int id = (Integer)book.get("id") --%>
	<div class="d-flex">
		<div>
			<div><img src="<%= book.get("image") %>"></div>
		</div>
		<div class="ml-4">
			<div class="d-none"><%= book.get("id") %></div><%--  --%>
			<div class="display-1 font-weight-bold"><%= book.get("title") %></div>
			<div class="display-2 text-info"><%= book.get("author") %></div>
			<div class="display-4"><%= book.get("publisher") %></div>
		</div>
	</div>
		 <% } %>
	<% } %>
	
	<li class="nav-item"><a href="/jsp/test/test09.jsp?what=<%=  %>" class="text-white">지상파</a></li>
			<li class="nav-item"><a href="/jsp/test/test09.jsp?what=<%=  %>" class="text-white">드라마</a></li>
			<li class="nav-item"><a href="/jsp/test/test09.jsp?what=<%=  %>" class="text-white">예능</a></li>
			<li class="nav-item"><a href="/jsp/test/test09.jsp?what=<%=  %>" class="text-white">영화</a></li>
			<li class="nav-item"><a href="/jsp/test/test09.jsp?what=<%=  %>" class="text-white">스포츠</a></li>
	

	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>