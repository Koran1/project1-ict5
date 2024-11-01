<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경 - MyTravelList</title>
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
	<p class="agreement-title" style="text-align: center;">비밀번호 변경</p>
	<hr color="008615">
</div>
	<div>
	<h3>주기적으로 비밀번호를 변경하여<br>
	개인정보를 안전하게 보호하세요.</h3>
	<form action="/mem_findPW_OK" method="post" name="findPwChangeForm">
		<label for="userPW">새 비밀번호</label>
			<input type="password" id="userPw" name="userPw" placeholder="새 비밀번호 입력" required>
		<label for="userPW2">새 비밀번호 확인</label>
			<input type="password" id="userPw2" name="userPw2" placeholder="새 비밀번호 확인 입력" required>
			
		<input type="hidden" value="findPW_Change">
		<button type="submit" class="btn btn-primary">변경</button>
		
		<div>
			<button type="button" class="cancel_btn" onclick="location.href='/mem_login';">취소</button>
		</div>
	</form>
	</div>
	<!--
	<script type="text/javascript">
		$(document).ready(function(){
			let form_findID = $("form[name='findPwChangeForm']");
			
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href="/mem_login";
			});
		});
	</script>
	-->
</body>
</html>