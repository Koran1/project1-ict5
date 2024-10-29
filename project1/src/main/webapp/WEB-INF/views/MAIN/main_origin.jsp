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
<link rel="stylesheet" href="resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style type="text/css">

/* main */
.main_container {
	width: 100%;
	display: flex;
	height: 100vh;
	justify-content: space-between; /* 섹션 사이에 여유 공간 분배 */
	align-items: center;
	padding-top: 50px;
	box-shadow: 0 0 3px gray;
}
/* 공통 섹션 스타일 */
.main_section {
	width: 33.33%; /* 각 섹션의 너비 */
	height: 100%; /* 섹션 높이를 100%로 */
	display: flex;
	justify-content: center; /* 내용의 가로 중앙 정렬 */
	align-items: center; /* 내용의 세로 중앙 정렬 */
	font-size: 22px;
	color: white;
	text-align: center;
}

.main_left {
	flex: 1 1 10%; /* 왼쪽 영역: 20% */
}

.main_center {
	flex: 1 1 80%; /* 중앙 영역: 60% */
}
/* travel_box 컨테이너 */
.main_wrapper {
	display: flex; /* Flexbox로 가로 정렬 */
	flex-wrap: wrap; /* 화면 크기에 따라 자동 줄바꿈 */
	justify-content: space-between; /* 박스 사이에 공간 균등 분배 */
	gap: 20px; /* 각 박스 간격 */
	padding: 20px;
}

/* travel_box 스타일 */
.travel_box {
	flex: 1 1 calc(32% - 40px); /* 각 박스를 3등분 */
	height: 450px;
	border: 1px solid #7bbe6e; /* 테두리 설정 */
	border-radius: 12px; /* 모서리 둥글게 */
	overflow: hidden; /* 넘치는 내용 숨기기 */
	margin: 10px;
	text-align: center;
	display: flex;
	flex-direction: column; /* 위-아래 정렬 */
	padding: 8px;
	box-shadow: 1px 1px 3px 0 gray;
}
/* 이미지 스타일 */
.travel_image img {
	width: 340px; /* 부모의 너비에 맞춤 */
	height: 300px; /* 비율 유지 */
	display: block; /* 불필요한 여백 제거 */
	border-radius: 12px 12px 0 0; /* 모서리 둥글게 */
}
/* 날씨 정보 스타일 */
.travel_weather {
	height: 120px;
	margin-top: 7px;
	padding: 15px;
	background-color: #ddf7d8;
	text-align: center;
	border-radius: 0 0 12px 12px; /* 모서리 둥글게 */
	font-size: 24px;
}
/* ul과 li의 가로 정렬 */
.travel_weather ul {
	list-style: none; /* 불릿 제거 */
	padding: 0;
	margin: 5px 0;
	display: flex; /* 가로 정렬 */
	justify-content: space-around; /* 요소 간 공간 분배 */
}

.travel_weather li {
	text-align: center;
	margin: 0 5px;
}

.travel_weather a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 요소의 텍스트 색상과 동일하게 설정 */
}

.travel_location_region {
	font-size: 40px;
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: 550;
}

.travel_temp {
	margin-left: 120px;
}

.main_right {
	flex: 1 1 10%; /* 오른쪽 영역: 10% */
}

/* footer */
footer {
	border-top: 1px solid #7bbe6e; /* 구분선 추가 */
	padding-top: 10px; /* 내용과 구분선 사이에 패딩 */
}

.footer_container {
	width: 100%;
	display: flex;
	align-items: center; /* 세로 중앙 정렬 */
	justify-content: center; /* 가로 중앙 정렬 */
	padding: 10px;
	background-color: white;
}

.footer_wrapper {
	height: 100px;
	padding: 0px 16px; /* 상하 좌우 */
}

.footer_left {
	
}

.footer_center, a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 요소의 텍스트 색상과 동일하게 설정 */
	flex: 1 1 40%;
}

.footer_center_top {
	display: flex;
	margin: 10px 20px 30px 20px; /* 상하좌우 */
	text-align: center;
	font-family: "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: 550;
	font-style: normal;
}

.footer_center_bottom {
	
}

.footer_right {
	
}
</style>
</head>
<main>
	<!-- 헤더 -->
	<header class="container">
		<div class="header_container">
			<div class="header_wrapper">
				<div class="header_start">
					<a href="/main"><img src="resources/images/MyTravelist.png"
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
							<img src="resources/images/profile-m.png" alt="로그인 아이콘">${userId}님</a>
					 	</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</header>

		<!-- 바디 -->
        <div class="main_container">
                <div class="main_left"></div>
                <div class="main_center">
                        <div class="main_wrapper" id="travel-list">
                        	<%-- <c:forEach var="k" items="${list}"> --%>
                            <section class="travel_box">
                                <a href="/detail_go" class="travel_image">
                                    <%-- <img alt="관광지 이미지" src="${k.placeImg01}" width="340px" height="300px"> --%>
                                </a>
                                <div class="travel_weather">
                                   <!--  <a href="#"> -->
                                    <div class="travel_location">
                                        <ul>
                                            <li class="travel_location_region">서울</li>
                                            <li class="travel_location_eng">Seoul</li>
                                            <li class="travel_location_date">10/22</li>
                                        </ul>
                                    </div>
                                    <div class="travel_temp">
                                        <ul>
                                            <li class="travel_temp_high_title">오전</li>
                                            <li class="travel_temp_high_icon">☀️</li>
                                            <li class="travel_temp_high">20°C</li>
                                        </ul>
                                        <ul>
                                            <li class="travel_temp_low_title">오후</li>
                                            <li class="travel_temp_low_icon">🌧️</li>
                                            <li class="travel_temp_low">9°C</li>
                                        </ul>
                                    </div>
                                <!-- </a> -->
                                </div>
                            </section>
                            <%-- </c:forEach> --%>
                            <!-- <section class="travel_box">
                                <div class="travel_image">
                                    <a href="detail.html">
                                        <img alt="관광지 이미지" src="resources/images/photo-5.jpg" width="340px" height="300px">
                                    </a>
                                </div>
                                <div class="travel_weather">
                                    <a href="#">
                                    <div class="travel_location">
                                        <ul>
                                            <li class="travel_location_region">제주</li>
                                            <li class="travel_location_eng">Jeju</li>
                                            <li class="travel_location_date">10/22</li>
                                        </ul>
                                    </div>
                                    <div class="travel_temp">
                                        <ul>
                                            <li class="travel_temp_high_title">오전</li>
                                            <li class="travel_temp_high_icon">☀️</li>
                                            <li class="travel_temp_high">23°C</li>
                                        </ul>
                                        <ul>
                                            <li class="travel_temp_low_title">오후</li>
                                            <li class="travel_temp_low_icon">☀️</li>
                                            <li class="travel_temp_low">15°C</li>
                                        </ul>
                                    </div>
                                    </a>
                                </div>
                            </section>
                            <section class="travel_box">
                                <div class="travel_image">
                                    <a href="detail.html">
                                        <img alt="관광지 이미지" src="resources/images/photo-6.jpg" width="340px" height="300px">
                                    </a>
                                </div>
                                <div class="travel_weather">
                                    <a href="#">
                                    <div class="travel_location">
                                        <ul>
                                            <li class="travel_location_region">부산</li>
                                            <li class="travel_location_eng">Busan</li>
                                            <li class="travel_location_date">10/22</li>
                                        </ul>
                                    </div>
                                    <div class="travel_temp">
                                        <ul>
                                            <li class="travel_temp_high_title">오전</li>
                                            <li class="travel_temp_high_icon">🌧️</li>
                                            <li class="travel_temp_high">22°C</li>
                                        </ul>
                                        <ul>
                                            <li class="travel_temp_low_title">오후</li>
                                            <li class="travel_temp_low_icon">🌧️</li>
                                            <li class="travel_temp_low">12°C</li>
                                        </ul>
                                    </div>
                                </a>
                                </div>
                            </section> -->
                        </div>
                </div>
                <div class="main_right"></div>
            </div>

	<!-- 풋터 -->
	<footer>
		<div class="footer_container">
			<div class="footer_wrapper">
				<div class="footer_left"></div>
				<div class="footer_center">
					<div class="footer_center_top">
						<a href="privacy.html">개인정보처리방침</a> <a href="terms.html">서비스
							이용약관</a> <a href="contact.html">Contact Us</a>
					</div>
					<div class="footer_center_bottom">
						<p>서울시 마포구 백범로 23 3층 한국ICT인재개발원 (우)04108 | Email:
							ictgroup5@ictgroup5.com</p>
						<p>대표번호: 02-739-7235 | Copyright ⓒ 2024 ictgroup5 All rights
							reserved.</p>
					</div>
				</div>
				<div class="footer_right"></div>
			</div>
		</div>
	</footer>
	
	<script type="text/javascript">
        
		setInterval(()=>{
			timer1()
		},5000);
		
		function timer1() {
			$(".travel_image").empty()
			$.ajax({
				url : "/renew_main",
				method : "post",
				dataType: "json",
				success : function(data){
					let div = "";
					$.each(data, function(index, obj){
						div += "<img src='" + obj.placeImg01+"'>"
					});
					
					$(".travel_image").append(div);
					
				}, 
				error : function(){
					alert("가져오기 실패에요")
				}
			})
		}
	
	
	

        
    </script>
	<script type="text/javascript">
			function clearPlaceholder(input) {
				input.placeholder = ''; // 클릭 시 placeholder 제거
			}
	
			function resetPlaceholder(input) {
				input.placeholder = '지금 당신을 위한 여행지를 검색 해보세요'; // 포커스 해제 시 placeholder 복원
			}
	</script>

</main>
</html>

