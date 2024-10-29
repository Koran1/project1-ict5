<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MyTravelList</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/header.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<!-- 헤더 -->
	<header class="container">
		<div class="header_container">
			<div class="header_wrapper">
				<div class="header_start">
					<a href="/main"><img src="resources/images/logo.png"
						alt="HOME" width="110%"></a>
				</div>
				<div class="header_center">
					<form class="header_form" action="/search_go" method="get"
						autocomplete="on">
						<input class="header_input_text" type="text" name="keyword"
							placeholder="지금 당신을 위한 여행을 검색 해보세요" value="${keyword}"
							onclick="clearPlaceholder(this)" onblur="resetPlaceholder(this)">
						<button class="header_input_button" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>
				<div class="header_end">
					<a class="header_menu" href="/notice_go">공지사항</a> 
					<c:choose>
					 	<c:when test="${empty userId}">
					 		<a class="header_menu" href="/login_go">여행계획</a>
					 		<a class="header_menu login_mypage" href="/login_go"> 
							<img src="resources/images/profile-m.png" alt="로그인 아이콘">로그인	</a>
					 	</c:when>
					 	<c:otherwise>
					 		<a class="header_menu" href="/trvlPlan_go">여행계획</a>
					 		<a class="header_menu login_mypage" href="/mypage_go"> 
							<img src="resources/images/profile.png" alt="로그인 아이콘">${userId}님</a>
					 	</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</header>
</body>
</html>