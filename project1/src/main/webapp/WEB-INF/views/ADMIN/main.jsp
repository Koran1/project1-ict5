<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">
	#main_container button{
		width: 100%;
		padding: 10px 20px;
		width: 150px;
	}
	
	#main_container button:hover{
		background-color: black;
		color: white;
		font-weight: bold;
	}
	#main_container .main_button{
		display: flex;
		justify-content: flex-end;
		width: 100%;
		margin: 20px 0;
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
			<div class="main_button"><button onclick='location.href ="/admin_main_create"'>작성하기</button></div>
			<table id="table">
				<thead>
					<tr>
						<th>등록번호</th><th>관광지명</th><th>등록일</th><th>게시글보이기</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>1</td><td><a href="">관광지에요</a></td><td>20241016</td><td id=visible>ON</td>
					</tr>
					<tr>
						<td>2</td><td><a href="">관광지에요2</a></td><td>20241016</td><td id=visible>OFF</td>
					</tr>
				</tbody>
			</table>
			<div class="main_button"><button>업데이트</button></div>
		</div>
	</div>
	
	<%-- DB 연결해서 관광지명 링크타는 거 추가해야함 --%>
	<%-- ON/OFF 저장 기능 추가해야함 --%>
	
	<script type="text/javascript">
	$(document).ready(function() {
	    $('#data tr').each(function() {
	        var visibleText = $(this).find('td#visible').text().trim();

	        if (visibleText === 'ON') {
	            $(this).css('background-color', 'lightgreen');
	        }
	    });
	});
	
	
	</script>
</body>
</html>