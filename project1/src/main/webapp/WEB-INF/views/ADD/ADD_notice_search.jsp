<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	.notice-table{
		width: 70%;
		margin: 20px auto;
		border-collapse: collapse;
		border-top: 2px solid #008165;
	}
	th,td{
		padding: 8px;
		text-align: center;
	}
	th{
		background-color: #f2f2f2;
	}
	tr td{
		border-bottom: 1px solid #ddd;
	}
	tr:last-child {
		border-bottom: 1px solid #ddd;
	}
	.noticeSubject {
		text-align: left;
	}
	.subject-detail {
		text-decoration: none;
		color: black;
	}
	.highlight {
		background-color: #99CC66;
	}
	.subject-detail:hover{
		text-decoration: underline;
		color: #666666;
	}
	.search-container {
    	width: 70%;
    	margin: 20px auto 0;
    	display: flex;
    	align-items: center;
	}
	.search-container input[type="text"] {
    	flex-grow: 1;
    	padding: 10px;
    	font-size: 16px;
    	border: 1px solid #ddd;
    	border-radius: 5px;
    	outline: none;
    	box-sizing: border-box;
    	min-width: 0;
	}
	.search-container button {
    	padding: 10px 20px;
    	font-size: 16px;
    	background-color: #008165;
    	color: white;
    	border: none;
    	border-radius: 5px;
    	margin-left: 10px;
    	cursor: pointer;
    	flex-shrink: 0;
    	transition: background-color 0.3s ease;
	}
	.search-container button:hover {
    	background-color: #007f3b;
	}
	.logo-img{
		cursor: pointer;
	}
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
        transition: background-color .3s;
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
        display: block;
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
</style>
</head>
<body>
	<div class="container">
		<div class="header-wrap">
			<img alt="" src="<c:url value='/resources/images/logo.png' />"
				class="logo-img" style="width: 250px; height: 50px;" onclick="location.href='/'" />
			<p class="notice-title" style="text-align: center;">공지사항</p>
			<hr color="008615">
		</div>
		
		<div class="tab-container">
            <ul class="tab-menu">
                <li class="tab-button active"><a href="/add_notice" class="tab-notice-menu">공지사항</a></li>
                <li class="tab-button"><a href="/add_faq" class="tab-notice-menu">자주 묻는 질문</a></li>
                <li class="tab-button"><a href="/add_qna" class="tab-notice-menu">나의 질문</a></li>
            </ul>
        </div>
		
		<div class="notice-container">
			<div id="notice-content" class="notice-content">
				<table id="notice-table" class="notice-table">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty searchResults }">
								<tr>
									<td colspan="2"><h3>검색 결과가 없습니다.</h3></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${searchResults }" var="k">
									<tr>
										<td class="noticeSubject" style="background-color: #99CC99"><a href="/add_notice_detail?noticeIdx=${k.noticeIdx }" class="subject-detail">${k.noticeSubject }</a></td>
										<td class="noticeReg" style="background-color: #99CC99"	>${k.noticeReg.substring(0, 10)}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
			
			<div class="search-container">
				<form action="/add_notice_search">
					<input type="text" name="keyword" value="${keyword}">
					<button type="submit" id="search_btn">검색</button>
				</form>
			</div>
			
			<div class="pagination">
                <a class="btn-mark" href="#">&laquo;</a>
                <a class="btn-mark" href="#">&lsaquo;</a>
                <a class="btn-page active" href="#">1</a>
                <a class="btn-mark" href="#">&rsaquo;</a>
                <a class="btn-mark" href="#">&raquo;</a>
            </div>
		</div>
	</div>
</body>
</html>