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

/* 메인 컨테이너: 화면 전체 레이아웃을 잡는 최상위 요소 */
.main_container {
	display: flex; /* 내부 요소들을 플렉스박스로 배치 */
	justify-content: space-between; /* 좌우 요소 간 공간을 균등하게 분배 */
	align-items: center; /* 세로 방향으로 가운데 정렬 */
	padding-top: 20px; /* 상단 여백 */
	box-shadow: 0 0 3px gray; /* 외곽 그림자 */
}

/* 메인 화면의 좌측 영역: 비율 10% */
.main_left {
	width: 10%; /* 좌측 레이아웃의 비율 설정 */
}

/* 메인 화면의 중앙 영역: 비율 80% */
.main_center {
	width: 80%; /* 중앙 레이아웃의 비율 설정 */
}

/* 메인 화면의 우측 영역: 비율 10% */
.main_right {
	width: 10%; /* 우측 레이아웃의 비율 설정 */
}

/* 메인 컨테이너의 래퍼: 스크롤 없이 고정된 레이아웃 */
.main_wrapper {
	margin: 100px 0;
	display: flex;
	justify-content: center; /* 중앙 정렬 */
	gap: 20px; /* 각 박스 사이의 간격 */
	width: 100%; /* 부모 요소의 전체 너비 사용 */
	box-sizing: border-box; /* 패딩 포함 너비 계산 */
	padding: 20px;
	overflow: hidden; /* 스크롤 제거 */
}

/* travel_box 스타일: 각각의 여행지 박스 */
.travel_box {
	width: 30%;
	height: 450px; /* 고정된 높이 */
	border: 1px solid #7bbe6e;
	border-radius: 12px;
	box-shadow: 1px 1px 3px 0 gray;
	overflow: hidden;
	display: flex;
	flex-direction: column;
	text-align: center;
	margin: 10px 0; /* 세로 여백 */
	padding: 8px; /* 내부 여백 */
}

.travel_name{
	text-align: center;
	align-items: center;
	font-size: 27px;
	font-weight: bold;
	margin-bottom: 15px;
	color: rgb(100, 50, 15, 10);
}
/* travel_box 크기 비율 유지 */
.travel_box {
	transform: scale(1);
	transform-origin: 0 0;
	width: 30%; /* 비율로 설정 */
	height: auto; /* 높이도 비율에 맞춰 자동 설정 */
}
/* 여행지 이미지 스타일: travel_box 내부 이미지 */
.travel_image {
    width: 100%;
    height: 270px; /* 고정 높이 설정 */
    background-color: white; /* 이미지가 없을 경우 표시될 배경색 */
    display: flex;
    justify-content: center;
    align-items: center;
}

.travel_image img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지 비율을 유지하며 박스에 맞춤 */
    border-radius: 12px 12px 0 0; /* 상단 모서리 둥글게 */
}
/* 날씨 정보 스타일: 여행지 정보 하단 날씨 박스 */
.travel_weather {
	height: 150px !important; /* 날씨 정보의 높이 */
	margin-top: 7px; /* 상단 여백 */
	padding: 15px; /* 내부 여백 */
	background-color: #ddf7d8; /* 연한 초록색 배경 */
	text-align: center; /* 텍스트 가운데 정렬 */
	border-radius: 0 0 12px 12px; /* 하단 모서리 둥글게 */
	font-size: 20px; /* 텍스트 크기 설정 */
}

/* ul과 li의 가로 정렬: 날씨 정보를 리스트로 표현 */
.travel_weather ul {
	list-style: none; /* 리스트 불릿 제거 */
	padding: 0; /* 리스트 내부 여백 제거 */
	margin: 5px 0; /* 리스트 상하 여백 */
	display: flex; /* 리스트를 가로 정렬 */
	justify-content: space-around; /* 리스트 항목 간 공간 균등 분배 */
}

/* 날씨 리스트 항목 스타일 */
.travel_weather li {
	text-align: center; /* 텍스트 가운데 정렬 */
	margin: 0 5px; /* 좌우 여백 */
}

/* 링크 스타일: 날씨 항목에 링크가 포함된 경우 */
.travel_weather a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 부모 요소의 텍스트 색상과 동일하게 설정 */
}

/* 지역명 스타일: 여행지의 한글 이름 */
.travel_location_region {
	font-size: 27px; /* 텍스트 크기 */
	font-family: "Noto Sans KR", sans-serif; /* 폰트 설정 */
	font-optical-sizing: auto; /* 텍스트 크기에 따른 최적화 */
	font-weight: 550; /* 폰트 두께 설정 */
}
.travel_location_date {
	font-size: 24px;
}

/* 온도 정보 스타일: 온도 리스트 위치 조정 */
.travel_temp {
	margin-left: 120px; /* 왼쪽 여백 */
}

/* 드디어 박스를 가로로 정렬하는데 성공!!*/
#travel-list {
	display: flex;
	justify-content: space-around;
	justify-content: space-between;
	width: calc(370px * 3 + 60px); /* 3개 박스 + 간격 계산 */
	opacity: 1;
	transition: opacity 0.8s ease-in-out; /* 페이드 효과 */
	gap: 30px; /* 각 박스 사이에 20px 간격 추가 */
}
/* 추가 CSs */
.travel_box_detail{
	width: 100%;
	height: 100%
}
.travel_weather_detail{
	width: 100%;
	height: 100%
}
.travel_weather_detail{
	background-color: #ddf7d8; /* 연한 초록색 배경 */
}
.travel_weather_detail table {
    width: 100%; /* 테이블 전체 너비 설정 */
    margin: 0 auto; /* 수평 가운데 정렬 */
    text-align: center; /* 텍스트 가운데 정렬 */
    border-collapse: collapse; /* 테이블 셀 간격 제거 */
}

.travel_weather_detail th,
.travel_weather_detail td {
    padding: 4px 1px;
    width: 15%; /* 5개의 열을 균등하게 분할 */
}
.travel_weather_detail th{
	border-bottom: 1px solid lightgray;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />

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

	<jsp:include page="footer.jsp" />

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
		    // 페이지 로드 시 리스트 초기 렌더링
		    loadTravelList();

 		    setInterval(() => {
		        loadTravelList();
		    }, 200000); 
		    
 		   function countKoreanChars(str) {
 			    if (!str) return 0;  // null 또는 undefined 처리
 			    return str.split('').filter(char => char.match(/[가-힣]/)).length;
 			}
 		    
		    function loadTravelList() {
		    	$("#travel-list").empty();
		    	$.ajax({
		    	    url: "/random_location",
		    	    method: "post",
		    	    dataType: "json",
		    	    async:false,
		    	    success: function (data) {
		    	        // console.log("응답 데이터:", data);
		    	        
		    	        let table = '';
		    	        data.forEach(function(list, i) {
		    	        	let travelIdx = list.travelIdx;
		    	        	let trrsrtNm = list.trrsrtNm;
		    	            placeImg01 = list.placeImg01;
		    	            trrsrtNm = list.trrsrtNm;
		    	            region = list.region;
		    	            regionName = list.touritEtc01;
		    	            
		                    let koreanCharCount = countKoreanChars(trrsrtNm);
		                    let displayTrrsrtNm = (koreanCharCount > 8) ? trrsrtNm.substring(0, 8) + "..." : trrsrtNm;
		                   	let k = load(region);
		    	           	//console.log(k[i].wthrDate); 
			                if (k && k.length > i) {
			                    wthrDate = k[i].wthrDate;
			                    wthrTMin = k[i].wthrTMin;
			                    wthrTMax = k[i].wthrTMax;
			                    wthrSKY = k[i].wthrSKY_PTY;
		    	            
		    	            table += "<div class='travel_box'>";
		    	            table += "<div class='travel_box_detail'>";
		    	            table += "<a href='/travelDetail_go?travelIdx=" + travelIdx + "' class='travel_image'><img src='" + placeImg01 + "' alt='" + trrsrtNm + "'></a>";
		    	            table += "<div class='travel_weather'>";
		                    table += "<div class='travel_name'>" + displayTrrsrtNm + "</div>";
		    	            table += "<div class='travel_location t_weather'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_location_region'>" + regionName + "</li>";
		    	            table += "<li class='travel_location_date'>"+ wthrDate+" </li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "<div class='travel_temp'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_high_title'>최저</li>";
		    	            table += "<li class='travel_temp_high_icon' style='font-size: 17px;'>" +  wthrSKY + "</li>";
		    	            table += "<li class='travel_temp_high'>" + wthrTMin + "°C</li>";
		    	            table += "</ul>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_low_title'>최고</li>";
		    	            table += "<li class='travel_temp_low_icon' style='font-size: 17px;'>" + wthrSKY + "</li>";
		    	            table += "<li class='travel_temp_low'>" + wthrTMax + "°C</li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "</div>";
		    	            table += "</div>";
		                
		    	            table += "<div class='travel_weather_detail' style='display:none;'>";
		    	            table += "<br><div class='travel_name' style='text-align: center;'>" + displayTrrsrtNm + "</div>";
		    	            table += "<div class='travel_location_region'>" + regionName + "</div><br>";
		                	table += "<table>";
		                	table += "<tr><th>일자</th><th>최저</th><th>최고</th><th>하늘</th><th>강수</th></tr>";
		                	table += "<tr><td>"+k[1].wthrDate.substring(5)+"</td><td>"+k[1].wthrTMin+"</td><td>"+k[1].wthrTMax+"</td><td style='font-size: 16px;'>"+k[1].wthrSKY_PTY+"</td><td>"+k[1].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[2].wthrDate.substring(5)+"</td><td>"+k[2].wthrTMin+"</td><td>"+k[2].wthrTMax+"</td><td style='font-size: 16px;'>"+k[2].wthrSKY_PTY+"</td><td>"+k[2].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[3].wthrDate.substring(5)+"</td><td>"+k[3].wthrTMin+"</td><td>"+k[3].wthrTMax+"</td><td style='font-size: 16px;'>"+k[3].wthrSKY_PTY+"</td><td>"+k[3].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[4].wthrDate.substring(5)+"</td><td>"+k[4].wthrTMin+"</td><td>"+k[4].wthrTMax+"</td><td style='font-size: 16px;'>"+k[4].wthrSKY_PTY+"</td><td>"+k[4].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[5].wthrDate.substring(5)+"</td><td>"+k[5].wthrTMin+"</td><td>"+k[5].wthrTMax+"</td><td style='font-size: 16px;'>"+k[5].wthrSKY_PTY+"</td><td>"+k[5].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[6].wthrDate.substring(5)+"</td><td>"+k[6].wthrTMin+"</td><td>"+k[6].wthrTMax+"</td><td style='font-size: 16px;'>"+k[6].wthrSKY_PTY+"</td><td>"+k[6].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[7].wthrDate.substring(5)+"</td><td>"+k[7].wthrTMin+"</td><td>"+k[7].wthrTMax+"</td><td style='font-size: 16px;'>"+k[7].wthrSKY_PTY+"</td><td>"+k[7].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[8].wthrDate.substring(5)+"</td><td>"+k[8].wthrTMin+"</td><td>"+k[8].wthrTMax+"</td><td style='font-size: 16px;'>"+k[8].wthrSKY_PTY+"</td><td>"+k[8].wthrPOP+"%</td></tr>"
		                	table += "<tr><td>"+k[9].wthrDate.substring(5)+"</td><td>"+k[9].wthrTMin+"</td><td>"+k[9].wthrTMax+"</td><td style='font-size: 16px;'>"+k[9].wthrSKY_PTY+"</td><td>"+k[9].wthrPOP+"%</td></tr>"
		                	table += "</table><br><br>";
		    	            table += "</div>";
		    	            table += "</div>";
			                }
		    	        });

		    	        $("#travel-list").html(table); // HTML 주입
		    	    },
		    	    error: function (xhr, status, error) {
		    	        console.error("데이터를 가져오는 데 실패했습니다:", error);
		    	    }
		    	});
		    }
		}); 
	
		enableDetail();
	
		function enableDetail() {
		    document.addEventListener("click", function (event) {
		        const travelBox = event.target.closest('.travel_box');
		        const isImage = event.target.closest('.travel_image'); // 이미지 클릭 여부 확인

		        if (travelBox) {
		            const travelBoxDetail = travelBox.querySelector('.travel_box_detail');
		            const travelWeatherDetail = travelBox.querySelector('.travel_weather_detail');

		            // 이미지 클릭 시 상세 화면으로 이동하고 날씨 상세 화면은 표시하지 않음
		            if (isImage) {
		                // 이미지 클릭 시 상세 페이지로 이동, 날씨 상세 화면은 표시하지 않음
		                window.location.href = event.target.closest('a').href;
		                event.preventDefault(); // 기본 링크 동작을 방지하여 다른 처리 없이 페이지 이동
		            } 
		            // 이미지 외 부분 클릭 시 날씨 상세 화면 토글
		            else if (event.target.closest('.travel_box_detail')) {
		                travelBoxDetail.style.display = 'none';
		                travelWeatherDetail.style.display = 'block';
		            } else if (event.target.closest('.travel_weather_detail')) {
		                travelWeatherDetail.style.display = 'none';
		                travelBoxDetail.style.display = 'block';
		            }
		        }
		    });
		}

		function load(region){
			let result_data;
			$.ajax({
				url : "/test01",
				method : "post",
				data : "region="+region,
				dataType : "json",
				async:false,
				success : function(data){
		            if (data.length > 0) {  // 데이터가 비어 있지 않은 경우에만 접근
		                wthrDate = data[0].wthrDate;
		                wthrTMin = data[0].wthrTMin;
		                wthrTMax = data[0].wthrTMax;
		                wthrSKY = data[0].wthrSKY;
		            }
					result_data = data;
				},
			    error : function(){
			    	alert("날씨정보 가져오기 실패")
			    }
			 });
			return result_data;
		 } 
	</script>
</body>
</html>







































