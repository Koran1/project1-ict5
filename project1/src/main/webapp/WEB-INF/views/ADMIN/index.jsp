<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	#main_container{
		flex-direction: row;
	}
	#dashboard{
		display: flex;
		flex-direction: column;
		width: 300px;
	}
	#dashboard p{
		width: 80%;
		font-size: 20px;
		border: 1px solid black;
		border-top: 2px solid red;
		margin: 10px auto;
		padding: 10px 20px;
	}
	#graph {
		width: 500px;
		height: 500px;
		margin-left: 50px;
	}
</style>
<script type="text/javascript">
	<c:if test="${result == '1'}">
		alert("날씨 불러오기 성공");
	</c:if>
	<c:if test="${result == '0'}">
		alert("날씨 불러오기 실패");
	</c:if>
</script>
</head>
<body>
	<div id="header">
		<a href="/admin_index">
		<img id="logo" alt="logo" src="../resources/images/logo.png" style="width: 250px">
		</a>
		<h2>admin index</h2>
	</div>
	<div id="container">
		<div id="button_container">
			<button onclick='location.href ="/admin_members"'>회원정보관리</button>
			<button onclick='location.href ="/admin_notice"'>공지사항관리</button>
			<button onclick='location.href ="/admin_faq"'>FAQ관리</button>
			<button onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
		
		<div id="main_container">
			<div id="dashboard">
				<p>오늘 방문자 수 : 32</p>
				<p>추가된 댓글 수 : 12</p>
				<p>신규 가입 수 : 8</p>
				<a href="/load_weather">날씨 정보 최신화하기</a>
			</div>
			<div id="graph">
				<img alt="" src="../resources/images/test.jpg">
			</div>
		</div>
	</div>

</body>
</html>