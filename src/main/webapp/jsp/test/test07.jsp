<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>배탙의 민족</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	
	
	<%
	List<Map<String, Object>> list = new ArrayList<>();
    Map<String, Object> map = new HashMap<String, Object>() {{ put("name", "버거킹"); put("menu", "햄버거"); put("point", 4.3); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "BBQ"); put("menu", "치킨"); put("point", 3.8); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "교촌치킨"); put("menu", "치킨"); put("point", 4.1); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "도미노피자"); put("menu", "피자"); put("point", 4.5); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "맥도날드"); put("menu", "햄버거"); put("point", 3.8); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "BHC"); put("menu", "치킨"); put("point", 4.2); } };
    list.add(map);
    map = new HashMap<String, Object>() {{ put("name", "반올림피자"); put("menu", "피자"); put("point", 4.3); } };
    list.add(map);
    
    String menu = request.getParameter("menu");
    String point = request.getParameter("point");
   
    
	%>
	
	<%-- String point = request.getParameter("point"); 이값이 어떻게 나오는지 궁금하면 response로 출력을해서 한번 확인해보고 하자
		그러면 체크박스를 클릭 안했을때는 null이 뜸	--%>
	<div class="container">	
		<h2 class="text-center">검색 결과</h2>
		<table border="1" class="table text-center">
			<thead>
				<tr>
					<th>메뉴</th>
					<th>상호</th>
					<th>별점</th>
				</tr>
			</thead>
			<tbody> <%-- Map의 제너릭의 타입이 왜 object인지 생각해볼것 :  --%>
				<% for(Map<String, Object>goods:list){ %>
					<% if(menu.equals(goods.get("menu"))){ %> <%-- Object point = goods.get("point") Object는 모든 클래스틔 부모클래스 즉 위 데이터는 현재 '업 캐스팅' 되어있는거--%>
<%-- Double은 랩핑 클래스 --%>	<% double score = (Double)goods.get("point"); %> <%--여기서 알아갈것 타입이 object트면 그것을 다른 타입을 적용시키기 위해선 다운캐스팅으로써 ()로 표시해줘야한다. --%>
<%--double도 되지만 실제
저정되어있는건 Double이여서		if(option == null || (option != null && point >= 4)
랩핑클래스로 해준거 --%>		<% if( point == null || score > 4.0 ){ %> <%--만약에 체크박스가 체크가 들어가면 조건에만 부합하게 뜬다 그렇지 않으면  --%>
							<tr>	<%-- or은 결국 앞에꼐 아니고 뒤에꺼만 충족시켜도 되니깐 또한 이미 null이기만 하면 어차피 모든값을 다 띄어놓으니깐 --%>
								<td><%= goods.get("menu") %></td> <%-- <%=는 태그사이에다가 값을 채워넣을때 하는것이다. --%>
								<td><%= goods.get("name") %></td> <%-- 전에는 이 3개의 태그가 있었고 어차피 똑같은 태그이면 줄일 생각을 한번쯤 해볼수있고 조건이 하나 있으면 그것도 한번 합칠 생각을 해볼것  --%>
								<td><%= goods.get("point") %></td>
							</tr>
							<% } %>
						<% } %>
					<% } %>
			</tbody>
		</table>
	</div>
	
	
	
	






	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>