<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	table{
		width: 70%;
		margin: 20px auto;
		border-collapse: collapse;
		border-top: 2px solid #708090;
	}
	tr{
		border-bottom: 1px solid #ddd;
	}
	td{
		padding: 15px;
		text-align: left;
	}
	.faq-question{
		cursor: pointer;
	}
	.faq-answer{
		display: none;
		color: #222222;
		background: #f9f9f9;
	}
	.faq-answer.visible{
		display: table-row;
	}
	.toggle-btn{
		cursor: pointer;
		color: #2c3e50;
		text-align: right;
	}
	.logo-img{
		cursor: pointer;
	}
	/*
	.pagination {
		margin: 0 auto ; 
		display: table; 
		text-align: center; 
		margin-bottom: 30px;
	}
	.pagination a {
		 color: #555; 
		 float: left; 
		 padding: 8px 16px; 
		 text-decoration: none; 
		 transition: background-color .3s;
		 background: #eee;
	}
	.pagination a.btn-mark{
		margin: 5px;
	}
	.pagination a.active {
		background: #008165;
		margin: 5px;
		color: white;
	}
	*/
	ul.tab-menu {
        list-style-type: none;
        margin: 0;
        padding: 0;
        border-bottom: 2px solid #008165;
        width: 70%;
        margin: 0 auto;
        display: flex;
    }
    ul.tab-menu::after {
        content: '';
        display: block;
        clear: both;
    }
    .tab-button {
        flex: 1;
        padding: 10px 0; 
        text-align: center;
        color: gray;
        text-decoration: none;
        cursor: pointer;
    }
    .tab-button.active {
        background-color: #f5f5f5;
        color: #008165;
    }
    .tab-button:hover {
        background-color: #f0f0f0;
        color: black;
    }
    .tab-notice-menu {
        text-decoration: none;
        color: inherit;
    }
    .tab-button a {
    	display: block;
    	text-decoration: none;
    	color: inherit;
	}
    /* paging */
	.pagination {
		margin: 0 auto; 
		display: table; 
		text-align: center; 
		margin-bottom: 30px;
	}

	.pagination a {
		color: #555; 
		float: left; 
		padding: 8px 16px; 
		text-decoration: none; 
		transition: background-color 0.3s;
		background: #eee;
	}

	.pagination a.btn-mark {
		margin: 5px;
	}

	.pagination a.active {
		background: #008165;
		margin: 5px;
		color: white;
	}

	/* 페이징 스타일 */
	table tfoot ol.paging {
		margin: 0 auto;
		display: table;
		text-align: center;
		margin-bottom: 30px;
		list-style: none;
		padding: 0;
	}

	table tfoot ol.paging li {
		display: inline-block;
		margin: 5px;
	}

	table tfoot ol.paging li a,
	table tfoot ol.paging li.disable,
	table tfoot ol.paging li.now {
		color: #555;
		padding: 8px 16px;
		text-decoration: none;
		transition: background-color 0.3s;
		background: #eee;
		border-radius: 4px;
	}

	table tfoot ol.paging li.disable {
		background: #ddd;
		color: #bbb;
	}

	table tfoot ol.paging li a:hover {
		background: #ccc;
	}

	table tfoot ol.paging li.now {
		background: #008165;
		color: white;
		border: none;
	}
	
	table tfoot,
	table tfoot tr,
	table tfoot td,
	table tfoot ol.paging,
	table tfoot ol.paging li {
		border: none;
	}
</style>
</head>
<body>
<div class="container">
	<div class="header-wrap">
		<img alt="" src="<c:url value='/resources/images/logo.png' />" class="logo-img" style="width: 250px; height: 50px;" onclick="location.href='/'" />
		<p class="notice-title" style="text-align: center;">공지사항</p>
		<hr color="008615">
	</div>
	<div class="tab-container">
		<ul class="tab-menu">
			<li class="tab-button"><a href="/add_notice" class="tab-notice-menu">공지사항</a></li>
			<li class="tab-button active"><a href="/add_faq" class="tab-notice-menu">자주 묻는 질문</a></li>
			<li class="tab-button"><a href="/add_qna" class="tab-notice-menu">나의 질문</a></li>
		</ul>
	</div>
	<div class="faq-container">
		<table id="faq-table" class="faq-table">
			<tbody>
				<c:choose>
					<c:when test="${empty faq_list}">
						<tr>
							<td colspan="2"><h3>FAQ가 없습니다.</h3></td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${faq_list}" var="k">
							<tr class="faq-question" onclick="toggleAnswer('answer${k.faqIdx}', 'btn${k.faqIdx}')">
								<td>${k.faqQuestion}</td>
								<td id="btn${k.faqIdx}" class="toggle-btn">∨</td>
							</tr>
							<tr class="faq-answer" id="answer${k.faqIdx}">
								<td colspan="2">${k.faqAnswer}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td	colspan="4">
						<ol class="paging">
							<!-- 맨 첫 페이지로 -->
							<c:choose>
								<c:when test="${paging.nowPage == 1}">
									<li class="disable">&laquo;</li> <!-- 비활성화 상태 -->
								</c:when>
								<c:otherwise>
									<li><a href="/add_faq?cPage=1">&laquo;</a></li>
								</c:otherwise>
							</c:choose>
							<!-- 이전 -->
							<c:choose>
						   		<c:when test="${paging.beginBlock <= paging.pagePerBlock }">
						   		    <li class="disable">&lsaquo;</li>
						   		</c:when>
						   		<c:otherwise>
						   			<li><a href="/add_faq?cPage=${paging.beginBlock - paging.pagePerBlock}">&lsaquo;</a></li>
						   		</c:otherwise>
						    </c:choose>
						    <!-- 블록안에 들어간 페이지번호들 -->
						    <c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
						    	
						    	<%-- 현재페이지 (링크X)와 현재 페이지가 아닌 것을 구분하자. --%>
						    	<c:if test="${k == paging.nowPage }">
						    		<li class="now">${k}</li>
						    	</c:if>
						    	<c:if test="${k != paging.nowPage }">
						    		<li><a href="/add_faq?cPage=${k}">${k}</a></li>
						    	</c:if>
						    </c:forEach>
						    
							<!-- 다음 -->
							<c:choose>
						   		<c:when test="${paging.endBlock >= paging.totalPage }">
						   		    <li class="disable">&rsaquo;</li>
						   		</c:when>
						   		<c:otherwise>
						   			<li><a href="/add_faq?cPage=${paging.beginBlock + paging.pagePerBlock}">&rsaquo;</a></li>
						   		</c:otherwise>
						    </c:choose>
						    
						    <!-- 맨 마지막 페이지로 -->
							<c:choose>
								<c:when test="${paging.nowPage == paging.totalPage}">
									<li class="disable">&raquo;</li>
								</c:when>
								<c:otherwise>
									<li><a href="/add_faq?cPage=${paging.totalPage}">&raquo;</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<!--
 	<div class="pagination">
		<a class="btn-mark" href="#">&laquo;</a>
		<a class="btn-mark" href="#">&lsaquo;</a>
		<a class="active" href="#">1</a>
		<a class="btn-mark" href="#">&rsaquo;</a>
		<a class="btn-mark" href="#">&raquo;</a>
	</div>
	-->
	<script type="text/javascript">
		function toggleAnswer(id, btnId) {
			var answer = document.getElementById(id);
			var button = document.getElementById(btnId);
			if (answer.classList.contains("visible")) {
				answer.classList.remove("visible");
				button.textContent = "∨";
			} else {
				answer.classList.add("visible");
				button.textContent = "∧";
			}
		}
		window.onload = function() {
			var firstAnswer = document.querySelector('.faq-answer');
			var firstButton = document.querySelector('.toggle-btn');
			if (firstAnswer && firstButton) {
				firstAnswer.classList.add("visible");
				firstButton.textContent = "∧";
			}
		};
	</script>
</div>
</body>
</html>
