<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	.logo-img{
		cursor: pointer;
	}
	.login-container{
		width: 50%;
		max-width: 400px;
		background-color: #ffffff;
		padding: 20px;
		margin: 50px auto;
	}
	.login_table{
		margin: 10px auto;
	}
	input[type="text"], input[type="password"] {
    	width: 320px;
    	padding: 15px;
    	margin: 10px auto;
    	display: inline-block;
   	 border: 1px solid #ccc;
    	border-radius: 4px;
    	box-sizing: border-box;
	}
	input[type="text"]:focus, input[type="password"]:focus {
    	border-color: #008615;
    	outline: none;
	}
	button.login_btn {
   		width: 100%;
    	background-color: #008615;
    	color: white;
    	padding: 12px;
    	border: none;
    	border-radius: 5px;
    	cursor: pointer;
    	font-size: 16px;
	}
	button.login_btn:hover {
    	background-color: #006b12;
	}
	.button-container {
    	margin-top: 20px;
    	text-align: center;
	}
	.button-container a {
    	margin: 0 5px;
    	text-decoration: none;
	}
	button.search_id_btn, button.search_pw_btn, button.join_btn{
    	background-color: #6B8E23;
    	color: white;
    	padding: 10px 20px;
    	border: none;
    	border-radius: 4px;
    	cursor: pointer;
   		font-size: 14px;
	}
	button.search_id_btn:hover, button.search_pw_btn:hover, button.join_btn:hover {
    	background-color: #006b12;
	}
</style>
</head>
<body>
<div class="container">
	<div class="header-wrap">
    	<img alt="" src="<c:url value='/resources/images/logo.png'/>" 
         	class="logo-img" style="width: 250px; height: 50px;" 
         	onclick="location.href='/'" />
		<p class="agreement-title" style="text-align: center;">로그인</p>
		<hr color="008615">
	</div>
	
	<!-- 로그인 영역 -->
	<div class="login-container">
		<form action="/mem_login_ok" method="post">
			<table class="login-table">
				<tbody>
					<tr>
						<td><label for="userId">아이디</label></td>
						<td><input type="text" id="userId" name="userId" placeholder="아이디 입력" required></td>
					</tr>
					<tr>
						<td><label for="userPw">비밀번호</label></td>
						<td><input type="password" id="userPw" name="userPw" placeholder="비밀번호 입력" required></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="hidden" value="login">
							<button type="submit" class="btn login_btn">로그인</button>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
		<!-- 버튼 영역 -->
		<div class="button-container">
			<a href="/mem_findID"><button type="submit" class="btn search_id_btn">아이디 찾기</button></a>
			<a href="/mem_findPW"><button type="submit" class="btn search_pw_btn">비밀번호 찾기</button></a>
			<a href="/mem_joinAgree"><button type="submit" class="btn join_btn">회원가입</button></a>
		</div>
	</div>
</div>
</body>
</html>