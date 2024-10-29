<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin LoginPage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script type="text/javascript">
	<c:if test="${!empty errorMsg}">
		alert("${errorMsg}")
	</c:if>
</script>
</head>
<body>
	<div id=container>
		<form action="/admin_index" method="post">
			<label>ID : <input type="text" name="adminID" placeholder="아이디 입력" required></label>
			<br>
			<label>PW : <input type="password" name="adminPW" placeholder="패스워드 입력" required> </label>
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>