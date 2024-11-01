<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 안내 - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
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
	<p class="agreement-title" style="text-align: center;">아이디 안내</p>
	<hr color="008615">
</div>
	<div>
	<h2>고객님의 아이디는 ~~~ 입니다.</h2>
	</div>
	
	<a href="/mem_login"><button type="submit" class="btn btn-primary">로그인</button></a>
	<a href="/mem_findPW"><button type="submit" class="btn btn-primary">비밀번호 찾기</button></a>
</body>
</html>