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
	padding-top: 50px; /* 상단 여백 */
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
	width: 400px;
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

/* 여행지 이미지 스타일: travel_box 내부 이미지 */
.travel_image img {
	justify-content: center; /* 가로 가운데 정렬 */
	width: 100%; /* 이미지의 너비 */
	height: 270px; /* 이미지의 높이 */
	object-fit: cover; /* 이미지 비율을 유지하며 박스에 맞춤 */
	border-radius: 12px 12px 0 0; /* 상단 모서리 둥글게 */
}
.travel_name{
	text-align: left;
	padding-left: 35px;
	align-items: center;
	font-size: 27px;
	font-weight: bold;
	margin-bottom: 15px;
	color: rgb(100, 50, 15, 10);
}

/* 날씨 정보 스타일: 여행지 정보 하단 날씨 박스 */
.travel_weather {
	max-height: 150px; /* 날씨 정보의 높이 */
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
    let travelIdx, placeImg01, trrsrtNm, region, touritEtc01, wthrDate, wthrTMin, wthrTMax, wthrSKY;
    
	document.addEventListener("DOMContentLoaded", function () {
		    // 페이지 로드 시 리스트 초기 렌더링
		    loadTravelList();

 		    setInterval(() => {
		        loadTravelList();
		    }, 200000); 
		    
		    function loadTravelList() {
		    	$("#travel-list").empty();
		    	$.ajax({
		    	    url: "/random_location",
		    	    method: "post",
		    	    dataType: "json",
		    	    async:false,
		    	    success: function (data) {
		    	        // console.log("응답 데이터:", data);
		    	        if (data.length === 0) {
		    	            console.warn("받아온 데이터가 없습니다.");
		    	            return;
		    	        }
		    	        
		    	        let table = '';

		    	        data.forEach(function(list, i) {
		    	        	travelIdx = list.travelIdx;
		    	        	trrsrtNm = list.trrsrtNm;
		    	            placeImg01 = list.placeImg01;
		    	            trrsrtNm = list.trrsrtNm;
		    	            region = list.region;
		    	            regionName = list.touritEtc01;
		    	            
		                   	let k = load(region);
		    	           	//console.log(k[i].wthrDate); 
		                    wthrDate =  k[i].wthrDate;
		    	            wthrTMin = k[i].wthrTMin;
		    	            wthrTMax = k[i].wthrTMax;
		    	            wthrSKY = k[i].wthrSKY_PTY;
		    	            reg_name = k[i].reg_name; 
		    	            
		    	            table += "<div class='travel_box'>";
		    	            table += "<a href='/travelDetail_go?travelIdx=" + travelIdx + "' class='travel_image'><img src='" + placeImg01 + "' alt='" + trrsrtNm + "'></a>";
		                    table += "<a href='#' class='travel_weather' onclick='weatherDetail(this.form)'>";
		                    table += "<div class='travel_name'>" + trrsrtNm + "</div>"
		    	            table += "<div class='travel_location t_weather'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_location_region'>" + regionName + "</li>";
		    	            table += "<li class='travel_location_date'>"+ wthrDate+" </li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "<div class='travel_temp'>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_high_title'>최저</li>";
		    	            table += "<li class='travel_temp_high_icon'>" +  wthrSKY + "</li>";
		    	            table += "<li class='travel_temp_high'>" + wthrTMin + "°C</li>";
		    	            table += "</ul>";
		    	            table += "<ul>";
		    	            table += "<li class='travel_temp_low_title'>최고</li>";
		    	            table += "<li class='travel_temp_low_icon'>" + wthrSKY + "</li>";
		    	            table += "<li class='travel_temp_low'>" + wthrTMax + "°C</li>";
		    	            table += "</ul>";
		    	            table += "</div>";
		    	            table += "</a>";
		    	            table += "</div>";
		                
		    	        });

		    	        $("#travel-list").html(table); // HTML 주입
		                $("#travel-list").fadeIn(800); // 새 리스트 페이드 인
		    	    },
		    	    error: function (xhr, status, error) {
		    	        console.error("데이터를 가져오는 데 실패했습니다:", error);
		    	    }
		    	});
		    }
		}); 
    
		function load(region){
			let result_data;
			$.ajax({
				url : "/test01",
				method : "post",
				data : "region="+region,
				dataType : "json",
				async:false,
				success : function(data){
					wthrDate = data[0].wthrDate;
					wthrTMin = data[0].wthrTMin;
					wthrTMax = data[0].wthrTMax;
					wthrSKY = data[0].wthrSKY;
					result_data = data;
				},
			    error : function(){
			    	alert("날씨정보 가져오기 실패")
			    }
			 });
			return result_data;
		 } 
	</script>
<%-- 	
	<script type="text/javascript">
	function weatherDetail(f) {
	    // form 요소가 아닌 클릭된 `a.travel_weather` 요소의 부모 `travel_box`를 선택합니다.
	    const travelBox = $(f).closest('.travel_box');
	    let travelIdx, trrsrtNm, touritEtc01, wthrDate, region, wthrTMin, wthrTMax, wthrSKY, wthrPOP, wthrPM10;

	    // 기존 데이터를 `data-` 속성 등으로 `a` 태그에 저장한 경우 해당 값을 추출할 수 있습니다.
	    const regionName = travelBox.find('.travel_location_region').text();

	    // weather 섹션 클릭 시 travel_box 영역을 날씨 정보로 변환
        $(document).on('click', '.travel_weather', function () {
            $('.travel_box').each(function () {
                // travellistdb에서 첫 번째 항목의 region 값을 가져와 비교
                const { travelIdx, trrsrtNm, touritEtc01, region } = travellistdb[0];
                
                // pjweather에서 해당 region의 데이터 필터링
                const filteredWeatherData = pjweather.filter(data => data.region === region);

                // HTML 테이블 생성
                let table = "";
                table += "<h2>" + touritEtc01 + "</h2>";
                table += "<p>여행지 이름: " + trrsrtNm + "</p>";
                table += "<p>강수확률: " + wthrPOP : "N/A") + "%</p>";
                table += "<p>미세먼지: " + wthrPM10 : "N/A") + "</p>";

                table += "<table>";
                table += "<thead><tr><th>일자</th><th>최저기온</th><th>최고기온</th><th>날씨</th><th>강수확률</th></tr></thead>";
                table += "<tbody>";

                // 필터링된 날씨 데이터를 통해 배열로 테이블 행 생성
                for (let i = 0; i < filteredWeatherData.length; i++) {
                    let { wthrDate, wthrTMin, wthrTMax, wthrSKY, wthrPOP } = filteredWeatherData[i];
                    
                    table += "<tr>";
                    table += "<td>" + wthrDate[i] + "</td>";
                    table += "<td>" + wthrTMin[i] + "°C</td>";
                    table += "<td>" + wthrTMax[i] + "°C</td>";
                    table += "<td>" + wthrSKY[i] + "</td>";
                    table += "<td>" + wthrPOP[i] + "%</td>";
                    table += "</tr>";
                }

                table += "</tbody></table>";

                // travel_box에 테이블 HTML 삽입
                $(this).html(table);
                $(this).css({
                    backgroundColor: '#ddf7d8', // 배경색
                    textAlign: 'center',
                    color: '#333',
                    padding: '10px'
                });
            });
        });
	}
	
    $(document).ready(function () {
	    let travelIdx, trrsrtNm, touritEtc01, wthrDate, region, wthrTMin, wthrTMax, wthrSKY, wthrPOP, wthrPM10;
    
	    // weather 섹션 클릭 시 travel_box 영역을 날씨 정보로 변환
        $(document).on('click', '.travel_weather', function () {
            $('.travel_box').each(function () {
                // travellistdb에서 첫 번째 항목의 region 값을 가져와 비교
                const { travelIdx, trrsrtNm, touritEtc01, region } = travellistdb[0];
                
                // pjweather에서 해당 region의 데이터 필터링
                const filteredWeatherData = pjweather.filter(data => data.region === region);

                // HTML 테이블 생성
                let table = "";
                table += "<h2>" + touritEtc01 + "</h2>";
                table += "<p>여행지 이름: " + trrsrtNm + "</p>";
                table += "<p>강수확률: " + (filteredWeatherData.length > 0 ? filteredWeatherData[0].wthrPOP : "N/A") + "%</p>";
                table += "<p>미세먼지: " + (filteredWeatherData.length > 0 ? filteredWeatherData[0].wthrPM10 : "N/A") + "</p>";

                table += "<table>";
                table += "<thead><tr><th>일자</th><th>최저기온</th><th>최고기온</th><th>날씨</th><th>강수확률</th></tr></thead>";
                table += "<tbody>";

                // 필터링된 날씨 데이터를 통해 배열로 테이블 행 생성
                for (let i = 0; i < filteredWeatherData.length; i++) {
                    let { wthrDate, wthrTMin, wthrTMax, wthrSKY, wthrPOP } = filteredWeatherData[i];
                    
                    table += "<tr>";
                    table += "<td>" + wthrDate + "</td>";
                    table += "<td>" + wthrTMin + "°C</td>";
                    table += "<td>" + wthrTMax + "°C</td>";
                    table += "<td>" + wthrSKY + "</td>";
                    table += "<td>" + wthrPOP + "%</td>";
                    table += "</tr>";
                }

                table += "</tbody></table>";

                // travel_box에 테이블 HTML 삽입
                $(this).html(table);
                $(this).css({
                    backgroundColor: '#ddf7d8', // 배경색
                    textAlign: 'center',
                    color: '#333',
                    padding: '10px'
                });
            });
        });
    });
	</script>

	table += "<h2>" + regionName + "</h2>";
	<p>강수확률: wthrPOP</p>
	<p>미세먼지: wthrPM10</p>
	<thead><th>일자<td><td>최저기온</td><td>최고기온</td>날씨<td></td><td>강수량</td></th></thead>
	(travellistdb의 region) == (pjweather의 region)인 pjweather 데이터를 가져와라
	for문을 통해 배열로 정렬
	<tbody>
		<tr><td>wthrDate[i]</td><td>wthrTMin[i]</td><td>wthrTMax[i]</td><td>wthrSKY[i]</td><td>wthrPOP[i]</td></tr>
	</tbody> -->
	
	 --%>
	
	
	
	
</body>
</html>







































