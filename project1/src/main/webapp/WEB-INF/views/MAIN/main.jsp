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
.main_left {
	flex: 1 1 10%; 
}
.main_center {
	flex: 1 1 80%;
}
.main_right {
	flex: 1 1 10%;
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
	display: flex;
	height: 450px;
	border: 1px solid #7bbe6e; /* 테두리 설정 */
	border-radius: 12px; /* 모서리 둥글게 */
	box-shadow: 1px 1px 3px 0 gray;
	flex-direction: column; /* 위-아래 정렬 */
	text-align: center;
	margin: 10px;
	padding: 8px;
	overflow: hidden; /* 넘치는 내용 숨기기 */
}

/* 이미지 스타일 */
 .travel_image img {
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



</style>
</head>
<body>
	<jsp:include page="header.jsp"/>

	<!-- 바디 -->
    <div class="main_container">
    
	    <div class="main_left"></div>
	    
	    <div class="main_center">
	    	<div class="main_wrapper">
	    		<div id="travel-list"></div>
	    	</div>
	    </div>
	    
	    <div class="main_right"></div>
	</div>
	
	<jsp:include page="footer.jsp"/>
	
	<script type="text/javascript">
        
	/*	 setInterval(()=>{
			timer1()
		}, 5000);
		
		function timer1() {
			$("#travel-list").empty()
			$.ajax({
				url : "/random_location",
				method : "post",
				dataType: "json",
				success : function(data){
					let div = "";
					$.each(data, function(index, obj){
						div += "<img src='" + obj.placeImg01+"'>"
					});
					
					$("#travel-list").append(div);
					
				}, 
				error : function(){
					alert("가져오기 실패에요")
				}
			})
		}
		
		*/
		
	document.addEventListener("DOMContentLoaded", function () {
		    // 페이지 로드 시 리스트 초기 렌더링
		    loadTravelList();

		    // 5초마다 리스트 갱신
		    setInterval(() => {
		        loadTravelList();
		    }, 35000); 
		    
		    function loadTravelList() {
		    	$("#travel-list").empty()
		    	$.ajax({
		    	    url: "/random_location",
		    	    method: "post",
		    	    dataType: "json",
		    	    success: function (data) {
		    	        console.log("응답 데이터:", data);
		    	        if (data.length === 0) {
		    	            console.warn("받아온 데이터가 없습니다.");
		    	            return;
		    	        }
		    	        
		    	        let table = '';
		    	        data.forEach(function(item) {
		    	            let travelIdx = item.travelIdx;
		    	            let placeImg01 = item.placeImg01;
		    	            let trrsrtNm = item.trrsrtNm;

		    	            table += "<section class='travel_box'>";
		    	            table += "<a href='" + travelIdx + "' class='travel_image'>";
		    	            table += "<img src='" + placeImg01 + "' alt='" + trrsrtNm + "' style='width:340px; height:300px; display:block;'></a>";
		    	            table += "<div class='travel_weather'>";
		    	            table += "<div class='travel_location'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_location_region'>서울</li>";
		    	            table += "<li class='travel_location_eng'>Seoul</li>";
		    	            table += "<li class='travel_location_date'>11/1</li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "<div class='travel_temp'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_high_title'>오전</li>";
		    	            table += "<li class='travel_temp_high_icon'>☀️</li>";
		    	            table += "<li class='travel_temp_high'>9°C</li>";
		    	            table += "</ul>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_low_title'>오후</li>";
		    	            table += "<li class='travel_temp_low_icon'>🌧️</li>";
		    	            table += "<li class='travel_temp_low'>20°C</li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "</div>";
		    	            table += "</section>";
		    	        });

		    	        $("#travel-list").html(table); // HTML 주입
		    	    },
		    	    error: function (xhr, status, error) {
		    	        console.error("데이터를 가져오는 데 실패했습니다:", error);
		    	    }
		    	});
		    }
		}); 
    </script>
    
	<script type="text/javascript">
			function clearPlaceholder(input) {
				input.placeholder = ''; // 클릭 시 placeholder 제거
			}
	
			function resetPlaceholder(input) {
				input.placeholder = '지금 당신을 위한 여행지를 검색 해보세요'; // 포커스 해제 시 placeholder 복원
			}
	</script>
</body>
</html>

