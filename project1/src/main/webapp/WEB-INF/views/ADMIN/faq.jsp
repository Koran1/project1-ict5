<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin FAQ</title>
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
	.faqSubject{
    	color: blue;
    	text-decoration: underline;
    }
    .faqSubject:hover, #noticeSubject:focus{
    	cursor: pointer;
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
			<button style="color: red" onclick='location.href ="/admin_faq"'>FAQ관리</button>
			<button onclick='location.href ="/admin_qa"'>Q&A관리</button>
			<button onclick='location.href ="/admin_main"'>게시판관리</button>
		</div>
	
		<div id="main_container">
			<div class="main_button"><button onclick='location.href ="/admin_faq_create"'>작성하기</button></div>
			<table id="table">
				<thead>
					<tr>
						<th>등록번호</th><th>FAQ</th><th>등록일</th><th>게시글보이기</th>
					</tr>
				</thead>
				<tbody id="data">
					<tr>
						<td>1</td><td><p class="faqSubject" onclick='faq_detail()'>FAQ에요1</p></td><td>20241016</td><td id=visible>ON</td>
					</tr>
					<tr>
						<td>2</td><td><p class="faqSubject" onclick='faq_detail()'>FAQ에요2</p></td><td>20241016</td><td id=visible>OFF</td>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr><td colspan="4">"자료가 존재하지 않습니다"</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="k" items="${list}">
								<tr>
									<td>${k.faqIdx}</td>
									<td><p class="faqSubject" onclick='faq_detail()'>${k.faqSubject}</p></td>
									<td>${k.faqReg}</td>
									<td>${k.faqStatus}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
			<div class="main_button"><button>업데이트</button></div>
		</div>
	</div>
	<script type="text/javascript">
		function faq_detail() {
			
			location.href ="/admin_faq_create";
		}
	</script>
</body>
</html>