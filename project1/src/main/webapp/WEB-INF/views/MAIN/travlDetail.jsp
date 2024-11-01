<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

/* 고정된 헤더 스타일 */
.fixed-header {
	position: fixed;
	margin: 120px 10px 0 0;
	width: 100%;
	background-color: white;
	z-index: 5; /* 다른 요소들 위에 위치 */
	align-items: center;
	justify-content: center;
}

/* 관광지 이름 컨테이너 */
.trr-name-container {
	text-align: center;
	font-size: 28px;
	color: rgb(100, 50, 15);
	font-weight: bold;
	margin-bottom: 15px;
}

/* 메뉴 컨테이너 스타일 */
.menu-container {
	width: 100%;
	margin: 0 auto; /* 가로 중앙 정렬 */
	display: flex;
	justify-content: center;
	background-color: white;
	border: 0.5px solid #ddd;
	padding: 10px 0;
	border-left: none;
	border-right: none;
}

.menu-container ul {
	list-style-type: none; /* 목록 스타일 제거 */
	display: flex;
	justify-content: center;
	padding: 0;
	margin: 0;
}

/* 메뉴 항목 스타일 */
.menu-container ul li {
	padding: 10px 50px;
	border-left: 1px solid rgb(211, 209, 209);
	border-right: 1px solid rgb(211, 209, 209);
}

.menu-container ul li:first-child {
	border-left: none;
}

.menu-container ul li:last-child {
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
.container {
	display: flex;
	flex-direction: row;
	height: 100vh; /* 화면 전체 높이 사용 */
	margin: 0 auto;
}

/* 좌우 영역 */
.main-left, .main-right {
	width: 10%;
	background-color: red; /* 디버깅용 */
	min-width: 100px;
	height: 100%; /* 부모 높이에 맞춤 */
}

/* 메인 센터 */
.main-center {
	width: 80%; /* 중앙을 넓게 사용 */
	background-color: #f0f0f0;
	padding: 20px;
	box-sizing: border-box;
	height: 100%; /* 부모 높이에 맞춤 */
}

/* 사진 갤러리 */
.photo-gallery {
	display: flex;
	gap: 10px;
	flex-wrap: wrap;
	justify-content: center;
}

/* 지도 및 여행톡을 위한 그리드 */
.info-grid {
	display: grid;
	grid-template-columns: 1fr 1fr; /* 두 개의 열로 나눔 */
	gap: 20px;
	margin-top: 30px;
	height: calc(100% - 300px); /* 사진 섹션을 제외한 영역을 계산하여 사용 */
}

/* 지도 섹션 */
#map {
	background-color: #e9f7ef;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100%;
}

/* 여행톡 섹션 */
#travelTalk {
	background-color: #fff3e0;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
	height: 100%;
}

/* 지도 이미지 */
#kakaoMap img {
	width: 100%;
	height: auto;
	object-fit: contain;
	border-radius: 8px;
}

/* 스크롤 맨 위로 이동 버튼 */
.scroll-top-btn {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #deebe1;
	color: #2d2b2b;
	border: none;
	padding: 15px;
	border-radius: 50%;
	font-size: 30px;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>

	<!-- 헤더 섹션 -->
	<header>
		<div class="header_container">
			<div class="header_wrapper">
				<!-- 로고 -->
				<div class="header_start">
					<a href="#"> <img src="resources/images/MyTravelist.png"
						alt="My Travel List 로고" width="110%">
					</a>
				</div>

				<!-- 검색 폼 -->
				<div class="header_center">
					<form class="header_form" action="/search_go" method="get"
						autocomplete="on">
						<input class="header_input_text" type="text" name="keyword"
							placeholder="지금 당신을 위한 여행지를 검색 해보세요"
							onfocus="handlePlaceholder(this, true)"
							onblur="handlePlaceholder(this, false)" value="${keyword}">
						<button class="header_input_button" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>

				<!-- 메뉴 항목 -->
				<div class="header_end">
					<a class="header_menu" href="notice.html">공지사항</a> <a
						class="header_menu" href="plan.html">여행계획</a> <a
						class="header_menu login_mypage" href="login.html"> <img
						src="resources/images/profile-m.png" alt="로그인 아이콘">로그인
					</a>
				</div>
			</div>
		</div>
	</header>

	<!-- 고정된 메뉴 섹션 -->
	<div class="fixed-header">
		<div class="trr-name-container">${place.trrsrtNm}</div>
		<div class="menu-container">
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
					<button class="menu-btn" onclick="scrollToSection('travelTalk')">여행톡</button>
				</li>
			</ul>
		</div>
	</div>

	<!-- 본문 내용 -->
	<div class="container" id="photos">
		<div class="main-left"></div>

		<!-- 메인 센터 -->
		<div class="main-center">
			<!-- 사진 섹션 -->
			<div class="content-section">
				<div class="photo-gallery">
					<img src="${place.placeImg01}" alt="관광지 이미지01" class="photo_big">
					<img src="${place.placeImg01}" class="small small1" alt="관광지 이미지01">
					<img src="${place.placeImg02}" class="small small2" alt="관광지 이미지02">
					<img src="${place.placeImg03}" class="small small3" alt="관광지 이미지03">
					<img src="${place.placeImg04}" class="small small4" alt="관광지 이미지04">
				</div>
			</div>


			<div class="main-right">
				<button class="scroll-top-btn" id="scrollTopBtn"
					onclick="scrollToTop()">△</button>
			</div>
		</div>

		<!-- 풋터 섹션 -->
		<footer>
			<div class="footer_container">
				<div class="footer_wrapper">
					<div class="footer_left"></div>

					<!-- 중간 풋터 내용 -->
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
</body>

<script type="text/javascript">
	function handlePlaceholder(input, isFocused) {
		input.placeholder = isFocused ? '' : '지금 당신을 위한 여행지를 검색 해보세요';
	}

	function scrollToTop() {
		window.scrollTo({
			top : 0,
			behavior : 'smooth'
		});
	}
        function scrollToSection(sectionId) {
            const section = document.getElementById(sectionId);
            const offset = document.querySelector('.fixed-header').offsetHeight;
            const sectionPosition = section.getBoundingClientRect().top + window.scrollY - offset;
            window.scrollTo({ top: sectionPosition, behavior: 'smooth' });
        }

        function scrollToTop() {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }

        window.addEventListener('scroll', function () {
            const scrollTopBtn = document.getElementById('scrollTopBtn');
            if (window.scrollY > 300) {
                scrollTopBtn.style.display = 'block';
            } else {
                scrollTopBtn.style.display = 'none';
            }
        });

        function displaySrc() {
            let big = document.querySelector(".photo_big");
        }

        let smallpics = document.querySelectorAll(".small");
        for (let k of smallpics) {
            k.addEventListener("click", changePic);
        }

        function changePic() {
            let newPic = this.src;
            document.querySelector(".photo_big").setAttribute("src", newPic);
        }
    </script>

</body>
</html>
