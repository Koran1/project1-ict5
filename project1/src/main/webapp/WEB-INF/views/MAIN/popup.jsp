<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 로그인 안된 상태 (쿠키에 userID이 저장되지 않은 상태)-->
	<c:if test="${userId == null }">
		<form action="" method="post" class="form">
			<input type="submit" value="로그인">
			<input type="hidden" name="cmd" value="c_login">
		</form>
		<form action="" method="post" class="form">
			<input type="submit" value="회원가입">
			<input type="hidden" name="cmd" value="c_join">
		</form>
	</c:if>
	<!-- 로그인 된 상태 (쿠키에 userID이 저장된 상태)-->
	<c:if test="${userId != null}">
		<span>${userId}님 환영합니다.</span>
		<form action="" method="post" class="form">
			<input type="submit" value="마이페이지">
			<input type="hidden" name="cmd" value="c_profile">
		</form>
		<form action="" method="post" class="form">
			<input type="submit" value="로그아웃">
			<input type="hidden" name="cmd" value="c_logout">
		</form>
	</c:if>	
</body>
</html>