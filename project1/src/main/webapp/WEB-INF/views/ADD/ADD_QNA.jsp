<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	.write-cotainer{
		display: flex;
		margin: 20px auto;
		width: 70%;
	}
	.write-cotainer > button{
		margin-left: auto;
		padding: 10px 30px;
		background-color: #02B08A;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.qna-table{
		width: 70%;
		margin: 20px auto;
		border-collapse: collapse;
		border-top: 2px solid #708090;
	}
	th, td{
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
	.qnaSubject{
		text-align: left;
	}
	.qnaReg{
		text-align: center;
	}
	.subject-detail{
		text-decoration: none;
		color: black;
	}
	.subject-detail:hover{
		text-decoration: underline;
		color: #666666;
	}
	.logo-img{
		cursor: pointer;
	}
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
				<li class="tab-button"><a href="/add_notice" class="tab-notice-menu">공지사항</a></li>
				<li class="tab-button"><a href="/add_faq" class="tab-notice-menu">자주 묻는 질문</a></li>
				<li class="tab-button active"><a href="/add_qna" class="tab-notice-menu">나의 질문</a></li>
			</ul>
		</div>
		<div class="write-cotainer">
			<button class="write_btn" onclick="location.href='/add_qna_ask';">질문하기</button>
		</div>
		<div class="qna-container">
			<div id="qna-content" class="qna-content">
				<table id="qna-table" class="qna-table">
					<thead>
						<tr>
							<th>제목</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${empty qna_list }">
								<tr>
									<td colspan="2"><h3>나의 문의 내역이 존재하지 않습니다.</h3></td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${qna_list }" var="k">
									<tr>
										<td class="qnaSubject"><a href="add_qna_detail?qnaIdx=${k.qnaIdx }" class="subject-detail">${k.qnaSubject }</a></td>
										<td class="qnaReg">${k.qnaReg.substring(0, 10) }</td>
									</tr>
									<c:if test="${not empty k.qnaReSubject }">
										<tr>
											<td class="qnaSubject"><a href="add_qna_detail_admin?qnaIdx=${k.qnaIdx }" class="subject-detail">${k.qnaReSubject }</a></td>
											<td class="qnaReg">${k.qnaReRegdate != null ? k.qnaReRegdate.substring(0, 10) : '-'}</td>
											<%-- <td class="qnaReg">${k.qnaReRegdate.substring(0, 10) }</td>	 --%>
										</tr>
									</c:if>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="pagination">
					<a class="btn-mark" href="#">&laquo;</a>
					<a class="btn-mark" href="#">&lsaquo;</a>
					<a class="active" href="#">1</a>
					<a class="btn-mark" href="#">&rsaquo;</a>
					<a class="btn-mark" href="#">&raquo;</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>