<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색결과 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="resources/css/reset.css">
<style type="text/css">

/* 메인 레이아웃 */
.main_container {
	flex: 1;
	width: 100%;
	display: flex;
	justify-content: space-between;
	padding-top: 50px;
	box-shadow: 0 0 3px #8f8f8f;
	text-align: left;
}

.main_left {
	flex: 1 1 10%;
	margin-top: 110px;
}

.travel_result {
	font-size: 20px;
	margin-left: 10px;
}

.main_center {
	flex: 1 1 80%;
	margin-top: 105px;
}

/* 지역 선택 메뉴 */
.region_menu {
	width: 150px;
	height: 40px;
	text-align: center;
	border-radius: 5px;
	background-color: #ddf7d8;
	font-weight: bold;
}

/* 여행 박스 컨테이너 */
.main_wrapper {
	margin-left: 110px;
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	gap: 40px;
	padding: 20px;
}

/* 여행 박스 */
.travel_box {
	width: 300px;
	height: 350px;
	border: 1px solid #7bbe6e;
	border-radius: 12px;
	overflow: hidden;
	text-align: center;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 8px;
	box-shadow: 1px 1px 3px 0 gray;
}

/* 여행 이미지 */
.travel_image {
	display: flex;
	justify-content: center;
	align-items: center;
	width: 100%;
	overflow: hidden;
	border-radius: 5px;
}

.travel_image img {
	max-width: 100%;
	max-height: 100%;
	object-fit: cover;
	border-radius: 8px;
	height: 250px;
}

/* 날씨 정보 */
.travel_info {
	width: 100%;
	text-align: left;
	padding-left: 10px;
	display: flex;
	flex-direction: column;
	justify-content: space-between;
	height: 120px;
	margin-top: 20px;
}

.travel_location {
	margin: 0 auto;
}

.travel_location_title {
	font-size: 20px;
	margin-bottom: 12px;
	font-weight: bold;
}

.travel_location_addr, .travel_location_phone {
	font-size: 17px;
	margin-bottom: 12px;
}

/* 오른쪽 영역 */
.main_right {
	flex: 1 1 10%;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>

	<!-- 메인 컨텐츠 -->
	<!-- main -->
	<div class="main_container">
		<div class="main_left">
			<div class="travel_result">
				<p>검색결과</p>
				<p>: ${keyword} ${list.size()}건</p>
			</div>
		</div>

		<div class="main_center">
			<c:choose>
				<c:when test="${empty list}">
					<h2>검색 결과가 존재하지 않습니다</h2>
				</c:when>
				<c:otherwise>
					<section class="searchs">
						<form id="regionForm" action="/region_search" method="get">
							<input type="hidden" name="keyword" value="${keyword}" /> <select
								class="region_menu" name="region"
								onchange="document.getElementById('regionForm').submit();">
								<option value="">:: 지역 선택 ::</option>
								<c:forEach var="k" begin="1" end="16">
									<option value="${k}">
										<c:if test="${region == k}">selected</c:if>
										<c:choose>
											<c:when test="${k == 1}">서울</c:when>
											<c:when test="${k == 2}">부산</c:when>
											<c:when test="${k == 3}">대구</c:when>
											<c:when test="${k == 4}">인천</c:when>
											<c:when test="${k == 5}">광주</c:when>
											<c:when test="${k == 6}">대전</c:when>
											<c:when test="${k == 7}">울산</c:when>
											<c:when test="${k == 8}">경기</c:when>
											<c:when test="${k == 9}">강원</c:when>
											<c:when test="${k == 10}">충북</c:when>
											<c:when test="${k == 11}">충남</c:when>
											<c:when test="${k == 12}">전북</c:when>
											<c:when test="${k == 13}">전남</c:when>
											<c:when test="${k == 14}">경북</c:when>
											<c:when test="${k == 15}">경남</c:when>
											<c:otherwise>제주</c:otherwise>
										</c:choose>
									</option>
								</c:forEach>
							</select>
						</form>

						<div class="main_wrapper">
							<c:forEach var="k" items="${list}">
								<div class="travel_box">
									<div class="travel_image">
										<a href="/detail_go?trrsrtNm=${k.trrsrtNm}"> <img
											alt="관광지 이미지" src="${k.placeImg01}">
										</a>
									</div>
									<div class="travel_info">
										<div class="travel_location">
											<p class="travel_location_title">${k.trrsrtNm}</p>
											<c:choose>
												<c:when test="${empty k.rdnmadr}">
													<p class="travel_location_addr">${k.lnmadr}</p>
												</c:when>
												<c:otherwise>
													<p class="travel_location_addr">${k.rdnmadr}</p>
												</c:otherwise>
											</c:choose>
											<p class="travel_location_phone">☎: ${k.phoneNumber}</p>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</section>
				</c:otherwise>
			</c:choose>
		</div>

		<div class="main_right">
			<jsp:include page="scroll.jsp"/>
		</div>
	</div>

	<jsp:include page="footer.jsp"/>

</body>

</html>
