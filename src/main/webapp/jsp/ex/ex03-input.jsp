<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form method="post" action="/jsp/ex/ex03.jsp"> <!-- post는 뒤에 주소가 일정부분 가려짐(보안강화) -->
	<label>닉네임 : </label><input type="text" name="nickname">
	
	<!-- 라디오 버튼 -->
	<h3>좋아 하는 동물</h3><%--저 강아지,고양이,사자는 단지 label즉 명찰표같은거일뿐이지 저거 자체가 값은 아니다. --%>
	<label>강아지<input type="radio" name="animal" value="dog"></label>
	<label>고양이<input type="radio" name="animal" value="cat"></label>
	<label>사자<input type="radio" name="animal" value="lion"></label>
	
	<!-- 셀렉트 박스 -->
	<h3>좋아하는 과일 선택</h3>
	<select name="fruit">
		<option value="banana">바나나</option>
		<option value="peach">복숭아</option>
		<option value="strawberry">딸기</option><!-- 얘는 이 옵션 자체가 값이긴 하다(그러나 파라미터로 전달되는 값을 다르게 전달하고 싶으면 밸류값을 따로 넣어주면 된다) -->
	</select>
	
	<!-- 체크박스(얘가 문제다) 얘는 여러개를 입력할수 있는 버튼이다(그러나 get메소는 하나만 값을 가질수 있기에 다른 메소드 등장 다른 파일에서 볼것 -->
	<h3>좋아하는 음식을 모두 고르세요</h3>
	<label>민트초코<input type="checkbox" name="food" value="민트초코"></label>
	<label>하와이안피자<input type="checkbox" name="food" value="하와이안피자"></label>
	<label>번데기<input type="checkbox" name="food" value="번데기"></label>
	
	<button type="submit">입력</button>
	</form>
	
	
</body>
</html>