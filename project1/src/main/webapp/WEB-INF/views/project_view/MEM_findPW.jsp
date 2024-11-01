<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기 - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	.logo-img{
		cursor: pointer;
	}
</style>
</head>
<body>
<div class="header-wrap">
    <img alt="" src="<c:url value='/resources/images/logo.png' />" 
         class="logo-img" style="width: 250px; height: 50px;" 
         onclick="location.href='/'" />
	<p class="agreement-title" style="text-align: center;">비밀번호 찾기</p>
	<hr color="008615">
</div>
	<div>
	<form action="/mem_findPW_change" method="post" name="findPwForm">
		<label for="userName">이름</label>
			<input type="text" id="userName" name="userName" placeholder="이름 입력" required>
		<label for="userMail">이메일</label>
			<input type="email" id="userMail" name="userMail" placeholder="이메일 입력" required>

		<input type="hidden" value="findPW">
		<button type="submit" class="btn btn-primary" onclick="location.href='/mem_login'">비밀번호 찾기</button>

		<div>
			<button type="submit" class="cancel_btn">취소</button>
		</div>
	</form>
	</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			let form_findID = $("form[name='findPwForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href="/mem_login";
			});
		});
	</script>
</body>
</html>