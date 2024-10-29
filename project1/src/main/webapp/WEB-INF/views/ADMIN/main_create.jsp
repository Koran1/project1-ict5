<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main Create</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	tr{
		
	}
</style>
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
			<button onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button style="color: red" onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
	
		<div id="main_container">
			<form action="/admin_main_create_OK" method="post" enctype="multipart/form-data">
				<table>
					<tr align="center">
						<td>관광지명</td>
						<td><input type="text" name="main_name" size ="20" required></td>
					</tr>
					<tr align="center">
						<td>주소</td>
						<td><input type="text" name="main_addr" size ="20" required></td>
					</tr>
					<tr align="center">
						<td>상세설명</td>
						<td><input type="text" name="main_desc" size ="20" required></td>
					</tr>
					<tr align="center">
						<td>이미지 첨부</td>
						<td><input type="file" name="main_img" size ="20"></td>
					</tr>
				</table>
				<input type="submit" value="저장">
				<input type="reset" value="취소">
			</form>
		</div>
	</div>
	
</body>
</html>