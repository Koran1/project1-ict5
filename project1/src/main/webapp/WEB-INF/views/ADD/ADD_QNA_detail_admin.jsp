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
		background-color: #f9f9f9;
	}
	.qna-detail-table{
		width: 70%;
		margin: 20px auto;
		border-collapse: collapse;
		margin-bottom: 20px;
		border-top: 2px solid #708090;
	}
	.qnaReSubject{
		font-size: 20px;
		text-align: left;
		padding: 10px;
		background-color: #f1f1f1;
		font-weight: bold;
		border-bottom: 1px solid #ddd;
	}
	.userId{
		font-size: 15px;
		text-align: right;
		padding: 10px;
		background-color: #f1f1f1;
		border-bottom: 1px solid #ddd;
	}
	.qnaReRegdate{
		font-size: 15px;
		text-align: right;
		padding: 10px;
		background-color: #f1f1f1;
		border-bottom: 1px solid #ddd;
	}
	.qnaFile{
		font-size: 15px;
		text-align: left;
		padding: 10px;
		border-bottom: 1px solid #ddd;
		text-decoration: none;
		color: black;
		cursor: pointer;
	}
	.qnaFile:hover{
		text-decoration: underline;
		color: #666666;
	}
	.qnaReContent{
		padding: 20px;
		font-size: 16px;
		line-height: 1.6;
		border-bottom: 1px solid #ddd;
	}
	.list_btn{
		margin: 20px auto;
		padding: 10px 30px;
		background-color: #008165;
		color: white;
		border: none;
		border-radius: 5px;
		display: block;
		cursor: pointer;
		width: fit-content;
	}
	.list-button:hover{
		background-color: #006b12;
	}
	.logo-img{
		cursor: pointer;
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
		<div class="qna-detail-container">
				<table class="qna-detail-table">
					<thead>
						<tr>
							<th class="qnaReSubject">${qnavo.qnaReSubject }</th>
							<th class="userId">관리자</th>
							<th class="qnaReRegdate">${qnavo.qnaReRegdate.substring(0, 10) }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="3" class="qnaFile">${qnavo.qnaFile }</td>
						</tr>
						<tr>
							<td colspan="3" class="qnaReContent">${qnavo.qnaReContent }</td>
						</tr>
					</tbody>
				</table>
			<button class="list_btn" onclick="location.href='/add_qna';">목록</button>
		</div>
	</div>
</body>
</html>