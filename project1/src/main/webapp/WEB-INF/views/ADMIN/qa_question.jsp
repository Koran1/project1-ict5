<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Notice</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
</head>
<body>
	<div id="header">
		<img id="logo" alt="logo" src="../resources/images/logo.png" onclick='location.href ="/admin_index"'>
		<h2>admin index</h2>
	 </div>
	 
	<div id="container">
		<div id="button_container">
			<button onclick='location.href ="/admin_members"'>회원정보관리</button>
			<button onclick='location.href ="/admin_notice"'>공지사항관리</button>
			<button onclick='location.href ="/admin_faq"'>FAQ관리</button>
			<button style="color: red" onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
	
		<div id="main_container">
			<div id="question">
				<h3>질문 제목</h3>
				<textarea rows="20" cols="80"></textarea>
			</div>
			<div id="answer">
				<h3>Re : 질문 제목</h3>
				<textarea rows="20" cols="80"></textarea>
			</div>
			<button>저장</button>
			<button>취소</button>
		</div>
	</div>
	
	
</body>
</html>