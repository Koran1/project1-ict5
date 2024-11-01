<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, 그리고 Bootstrap 기여자들">
    <meta name="generator" content="Hugo 0.88.1">
    <title>My travelList</title>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.1/examples/carousel/">
    <!-- Bootstrap core CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <style type="text/css">
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .container{
      	padding-top: 150px;
      }
      
      
/* 여행지 이미지 스타일: travel_box 내부 이미지 */
.travel_image img {
    justify-content: center; /* 가로 가운데 정렬 */
    width: 100%; /* 이미지의 너비 */
    height: 300px; /* 이미지의 높이 */
    object-fit: cover; /* 이미지 비율을 유지하며 박스에 맞춤 */
    border-radius: 12px 12px 0 0; /* 상단 모서리 둥글게 */
}
      /* 날씨 정보 스타일: 여행지 정보 하단 날씨 박스 */
.travel_weather {
    height: 120px; /* 날씨 정보의 높이 */
    margin-top: 7px; /* 상단 여백 */
    padding: 15px; /* 내부 여백 */
    background-color: #ddf7d8; /* 연한 초록색 배경 */
    text-align: center; /* 텍스트 가운데 정렬 */
    border-radius: 0 0 12px 12px; /* 하단 모서리 둥글게 */
    font-size: 24px; /* 텍스트 크기 설정 */
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
    font-size: 40px; /* 텍스트 크기 */
    font-family: "Noto Sans KR", sans-serif; /* 폰트 설정 */
    font-optical-sizing: auto; /* 텍스트 크기에 따른 최적화 */
    font-weight: 550; /* 폰트 두께 설정 */
}

/* 온도 정보 스타일: 온도 리스트 위치 조정 */
.travel_temp {
    margin-left: 120px; /* 왼쪽 여백 */
}
    </style>
    <!-- Custom styles for this template -->
    <link href="carousel.css" rel="stylesheet">
  </head>
  <body>
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="/main_go">My travelList</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="navbar-nav me-auto mb-2 mb-md-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">NOTICE</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="#">Travel Plan</a>
          </li>
        </ul>
        <form class="d-flex">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-outline-success" type="submit">Search</button>
        </form>
      </div>
    </div>
  </nav>
</header>

<main>
  <!-- Marketing messaging and featurettes
  ================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div class="container marketing">

    <!-- Three columns of text below the carousel -->
    <div class="row featurette">
      <div class="col-lg-4 col-md-7">
      	<div id="travel_list"></div>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
<!-- 
    START THE FEATURETTES
    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">First featurette heading. <span class="text-muted">It’ll blow your mind.</span></h2>
        <p class="lead">Some great placeholder content for the first featurette here. Imagine some exciting prose here.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Oh yeah, it’s that good. <span class="text-muted">See for yourself.</span></h2>
        <p class="lead">Another featurette? Of course. More placeholder content here to give you an idea of how this layout would work with some actual real-world content in place.</p>
      </div>
      <div class="col-md-5 order-md-1">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">And lastly, this one. <span class="text-muted">Checkmate.</span></h2>
        <p class="lead">And yes, this is the last block of representative placeholder content. Again, not really intended to be actually read, simply here to give you a better view of what this would look like with some actual content. Your content.</p>
      </div>
      <div class="col-md-5">
        <svg class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 500x500" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em">500x500</text></svg>

      </div>
    </div>

    <hr class="featurette-divider">
 -->
    /END THE FEATURETTES

  </div>/.container


  <!-- FOOTER -->
  <footer class="container">
    <p class="float-end"><a href="#">Back to top</a></p>
    <p>&copy; 2017–2022 Company, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
  </footer>
</main>


    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
          
      <script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
		    // 페이지 로드 시 리스트 초기 렌더링
		    loadTravelList();

		    // 5초마다 리스트 갱신
/* 		    setInterval(() => {
		        loadTravelList();
		    }, 20000); 
		    }, 20000);  */
		    
		    function loadTravelList() {
		    	$("#travel_list").empty()
		    	$.ajax({
		    	    url: "/random_location",
		    	    method: "post",
		    	    dataType: "json",
		    	    success: function (data) {
		    	        // console.log("응답 데이터:", data);
		    	        if (data.length === 0) {
		    	            console.warn("받아온 데이터가 없습니다.");
		    	            return;
		    	        }
		    	        
		    	        let table = '';
		    	        data.forEach(function(item) {
		    	            let travelIdx = item.travelIdx;
		    	            let placeImg01 = item.placeImg01;
		    	            let trrsrtNm = item.trrsrtNm;
		    	            let region = item.region;
		    	            
		    	            table += "<img class='bd-placeholder-img rounded-circle' width='140' height='140' xmlns='" + placeImg01 + "' role='img' aria-label='Placeholder: 140x140' preserveAspectRatio='xMidYMid slice' focusable='false'><title>Placeholder</title>";
		    	            table += "<text x='50%' y='50%' fill='#777' dy='.3em'>140x140</text>";
		    	            table += "<h2>" + trrsrtNm + "Heading</h2>";
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
		    	            table += "</div>";
		    	            table += "<p><a class='btn btn-secondary' href='/travelDetail_go?travelIdx=" + travelIdx + "'>View details &raquo;</a></p>";
		    	        });

		    	        $("#travel_list").html(table); // HTML 주입
		    	    },
		    	    error: function (xhr, status, error) {
		    	        console.error("데이터를 가져오는 데 실패했습니다:", error);
		    	    }
		    	});
		    }
		}); 
    </script>
  </body>
</html>
