<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관광지 상세 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/header.css">
<link rel="stylesheet" href="resources/css/footer.css">
<style type="text/css">

/* 메뉴 컨테이너 스타일 */
.menu_container {
	width: 100%;
	margin: 120px 10px 0 0;
	display: flex;
	justify-content: center;
	background-color: white;
	border: 0.5px solid #ddd;
	padding: 10px 0;
	position: fixed;
	z-index: 5; /* 다른 요소들 위에 위치 */
}

.menu_container ul {
	display: flex;
	list-style-type: none; /* 목록 스타일 제거 */
	justify-content: center;
	list-style-type: none;
}
/* 메뉴 항목 스타일 */
.menu_container ul li {
	padding: 10px 50px;
	border-left: 1px solid rgb(211, 209, 209);
	border-right: 1px solid rgb(211, 209, 209);
}

.menu_container ul li:first-child {
	border-left: none;
}

.menu_container ul li:last-child {
	border-right: none;
}

/* 메뉴 버튼 스타일 */
.menu-btn {
	background-color: white;
	color: black;
	font-weight: bold;
	border: none;
	padding: 10px 20px;
	cursor: pointer;
	font-size: 1.2rem;
}

/* 전체 컨테이너 */
.main_wrapper {
	width: 100%;
	padding-top: 200px;
}

.main_left {
	flex: 1 1 10%;
	background-color: red; /* 디버깅용 */
}

.main_center {
	flex: 1 1 80%; /* 중앙을 넓게 사용 */
	padding: 20px;
	box-sizing: border-box;
	height: 100%; /* 부모 높이에 맞춤 */
	align-content: center;
	justify-content: center;
}

.main_right {
	flex: 1 1 10%;
	background-color: red; /* 디버깅용 */
}

/* 관광지 이름 컨테이너 */
.trrname {
	text-align: center;
	font-size: 28px;
	color: rgb(100, 50, 15, 10);
	font-weight: bold;
	margin: 30px 0;
	text-decoration: underline;
	text-decoration-color: rgba(255, 249, 196, 0.6); /* 줄의 색을 노란색으로 */
	text-decoration-thickness: 10px; /* 줄 두께 */
}
/* 사진 갤러리 */
.photo_gallery {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
	justify-content: center;
}

.photo_big {
	width: 600px;
	height: 400px;
}

.photo_small {
	display: flex;
	justify-content: space-between;
	flex-direction: column;
}

.small {
	width: 140px;
	height: 95px;
}

/* 상세정보 */
.travel_info {
	width: 65%;
	margin: 10px auto;
	padding: 20px;
	/* box-sizing: border-box; */
}

.details_box {
	line-height: 1.5;
	padding: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #ddd;
}

/* 지도 섹션 */
.kakaoMap {
	width: 100%;
	align-items: center;
	justify-content: center;
}
.maps{
	line-height: 1.5;
	padding: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #ddd;
}


/* 여행톡 섹션 */
#tourTalk {
	background-color: #fff3e0;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	height: 100%;
}
.title{
	font-size: 20px;
	color: rgb(100, 50, 15, 10);
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- 고정된 메뉴 섹션 -->
	<div class="menu_container">
		<ul>
			<li class="select_tab on">
				<button class="menu-btn" onclick="scrollToSection('photos')">사진보기</button>
			</li>
			<li class="select_tab">
				<button class="menu-btn" onclick="scrollToSection('details')">상세보기</button>
			</li>
			<li class="select_tab">
				<button class="menu-btn" onclick="scrollToSection('map')">지도보기</button>
			</li>
			<li class="select_tab">
				<button class="menu-btn" onclick="scrollToSection('tourTalk')">여행톡</button>
			</li>
		</ul>
	</div>

	<!-- 본문 내용 -->
	<div class="main_wrapper" id="photos">
		<div class="main_left"></div>

		<!-- 메인 센터 -->
		<div class="main_center">
			<div class="trrname">${list.trrsrtNm}</div>
			<!-- 사진 섹션 -->
			<div class="photo_gallery">
				<img src="${list.placeImg01}" alt="관광지 이미지01" class="photo_big">
				<div class="photo_small">
					<img src="${list.placeImg01}" alt="관광지 이미지01" class="small">
					<img src="${list.placeImg02}" alt="관광지 이미지02" class="small">
					<img src="${list.placeImg03}" alt="관광지 이미지03" class="small">
					<img src="${list.placeImg04}" alt="관광지 이미지04" class="small">
				</div>
			</div>
			<!-- 상세보기 섹션 -->
			<div id="details"></div>
			<div class="travel_info">
				<div class="title">상세정보</div>
				<hr>
				<div class="details_box">
					<ul>
						<li><b>관광지 소개: ${list.trrsrtIntrcn}</b></li>
						<li>
							<!-- rdnmadr와 lnmadr 둘 다 없는 경우 --> 
							<c:if
								test="${empty list.rdnmadr and empty list.lnmadr}">
								<!-- 아무것도 출력하지 않음 -->
							</c:if> <!-- rdnmadr만 있는 경우 --> 
							<c:if
								test="${not empty list.rdnmadr and empty list.lnmadr}">
								<p>주소: ${list.rdnmadr}</p>
							</c:if> <!-- lnmadr만 있는 경우 --> 
							<c:if
								test="${empty list.rdnmadr and not empty list.lnmadr}">
								<p>주소: ${list.lnmadr}</p>
							</c:if> <!-- rdnmadr와 lnmadr 둘 다 있는 경우 --> 
							<c:if
								test="${not empty list.rdnmadr and not empty list.lnmadr}">
								<p>주소: ${list.rdnmadr}</p>
							</c:if>
						</li>
						<li>시설정보: ${list.cnvnncFclty} ${list.recrtClturFclty}
							${list.mvmAmsmtFclty} ${list.hospitalityFclty} ${list.sportFclty}</li>
						<li>숙박시설: ${list.stayngInfo}</li>
						<li>수용인원: <fmt:formatNumber value="${list.aceptncCo}" pattern="#,##0" />명</li>
						<li>주차대수: <fmt:formatNumber value="${list.prkplceCo}" pattern="#,##0" />대</li>
						<li>관리사무소 Tel: ${list.phoneNumber}</li>
						<li>업데이트 일자: ${list.referenceDate}</li>
					</ul>
				</div>
			

			<!-- 카카오 지도 섹션 -->
			<div class="title">지도보기</div><br>
			<div class="kakaoMap" id="kakaoMap">

				<div id="map" class="map" style="width: 100%; height: 450px;"></div>
				<!-- travelIdx 검색해서 ${list.latitude}, ${list.longitude} 정보를 통해 아래 마커 위치를 지정 -->
			</div>

			<!-- 여행톡 섹션 -->
			<%-- <jsp:include page="tourTalk.jsp" /> --%>
		</div>

		</div>

		<div class="main_right">
			<jsp:include page="scroll.jsp" />
		</div>
	</div>

	<jsp:include page="footer.jsp" />

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=590d5be37368c91772ba5516b2944ed1"></script>
	<script type="text/javascript">
	    // Controller로부터 전달된 데이터를 자바스크립트 변수에 할당
	    const lat = ${list.latitude};
	    const lng = ${list.longitude};
	
	    // 지도 생성 함수 호출
	    geo_map(lat, lng);

        function geo_map(lat, lng) {
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = {
                center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 2 // 지도의 확대 레벨 (1~14)
            };

            // 지도를 생성합니다
            var map = new kakao.maps.Map(mapContainer, mapOption);

            // 마커 위치 설정
            var markerPosition = new kakao.maps.LatLng(lat, lng);

            // 마커를 생성하고 지도에 표시합니다
            var marker = new kakao.maps.Marker({
                position: markerPosition
            });
            marker.setMap(map);

            // 인포윈도우 설정
            var iwContent = '<div style="padding:5px;">${list.trrsrtNm}</div>',
                iwPosition = new kakao.maps.LatLng(lat, lng);

            var infowindow = new kakao.maps.InfoWindow({
                position: iwPosition,
                content: iwContent
            });

            // 마커에 인포윈도우를 표시합니다
            infowindow.open(map, marker);
        }
        </script>
        
	<script type="text/javascript">
		// 섹션으로 부드럽게 스크롤하는 함수
		function scrollToSection(sectionId) {
			// 섹션 ID에 해당하는 요소를 찾음
			const section = document.getElementById(sectionId);
			// 해당 섹션의 화면 위치를 계산
			// 고정된 메뉴의 높이를 계산
	        const menuHeight = document.querySelector('.menu_container').offsetHeight;

	        // 추가로 100px 오프셋 설정
	        const additionalOffset = 160;

	        // 스크롤 위치 조정 (고정 메뉴 높이 + 추가 오프셋)
	        const sectionPosition = section.getBoundingClientRect().top + window.scrollY - menuHeight - additionalOffset;

	        window.scrollTo({ top: sectionPosition, behavior: 'smooth' });
	    }

		// 사진보기 버튼 클릭 시 photo_gallery 섹션으로 이동
		function goToPhotoGallery() {
			scrollToSection('#photo_gallery');
		}

		// 상세보기 버튼 클릭 시 details_box 섹션으로 이동
		function goToDetailsBox() {
			scrollToSection('#details');
		}

		// 지도보기 버튼 클릭 시 kakaoMap 섹션으로 이동
		function goToKakaoMap() {
			scrollToSection('#kakaoMap');
		}

		// 여행톡 버튼 클릭 시 tourTalk 섹션으로 이동
		function goToTourTalk() {
			scrollToSection('#tourTalk');
		}
	</script>
</body>
</html>
