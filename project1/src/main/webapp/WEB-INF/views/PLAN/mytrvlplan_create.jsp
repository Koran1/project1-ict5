<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan - create</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet" />

<style type="text/css">
/* Modal Styles */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5);
}

.modal-content {
	background-color: white;
	margin: 15% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 70%;
	height: 70%;
	text-align: center;
	overflow: scroll;
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

/* Grid and Item Styles */
.image-grid {
	display: grid;
	grid-template-columns: repeat(3, 1fr);
	gap: 20px;
	margin-top: 10px;
}

.image-item {
	text-align: center;
	border: 2px solid pink;
	border-radius: 8px;
	padding: 5px;
	width: 200px;
	height: 200px;
	transition: opacity 0.3s ease;
}

.image-item:hover {
	border: 5px solid pink;
}

.image-item img {
	width: 80%;
	height: 80%;
}

/* Layout Styles */
#top-bar {
	display: flex;
	flex-direction: row;
	width: 100%;
}

#top-bar input, select {
	margin-right: 20px;
	margin-bottom: 20px;
}

#main-content {
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 600px;
}

#travelplans {
	display: flex;
	flex-direction: column;
	width: 40%;
	border: 1px solid black;
	align-items: center;
}

#travelplans #create-plan {
	width: 80%;
	height: 15%;
	border: 1px solid black;
	margin-top: 20px;
	font-size: 64px;
}

.travelplan {
	width: 80%;
	height: 15%;
	margin-top: 20px;
	border: 1px solid black;
	display: flex;
	justify-content: space-around;
	align-items: center;
}

.travelplan img {
	height: 50px;
	width: 50px;
}

.delete-btn {
	width: 20px;
	height: 20px;
	font-size: 10px;
	font-weight: bold;
	text-align: center;
}

.delete-btn:hover {
	background-color: gray;
}

#map-content {
	width: 60%;
	border: 1px solid black;
	display: flex;
}

#map {
	width: 100%;
	height: 100%;
}

#bottom-bar {
	display: flex;
	justify-content: flex-end;
	width: 100%;
}

#bottom-bar button {
	margin-left: 20px;
	margin-top: 20px;
	padding: 10px;
}
</style>
</head>

<body>
	<!-- Header Section -->
	<div id="header">
		<a href="/index"><img id="logo" alt="logo"
			src="../resources/images/logo.png"></a>
		<h2>right side</h2>
	</div>

	<!-- Container Section -->
	<div id="container">
		<div id="button_container">
			<button onclick="location.href='/mytrvlplan'">나의 관심지 관리</button>
			<button style="color: red"
				onclick="location.href='/mytrvlplan_create'">여행 계획 짜기</button>
			<button onclick="location.href='/mytrvlplan_list'">여행 계획 관리</button>
		</div>

		<div id="main_container">
			<!-- Top Bar -->
			<div id="top-bar">
				<input type="date"> <select id="region-filter">
					<option value="0">선택</option>
					<option value="1">서울</option>
					<option value="2">부산</option>
					<option value="3">대구</option>
					<option value="4">인천</option>
					<option value="5">광주</option>
					<option value="6">대전</option>
					<option value="7">울산</option>
					<option value="8">경기</option>
					<option value="9">강원</option>
					<option value="10">충북</option>
					<option value="11">충남</option>
					<option value="12">전북</option>
					<option value="13">전남</option>
					<option value="14">경북</option>
					<option value="15">경남</option>
					<option value="16">제주</option>
				</select>
				<button onclick="getRoadLine()">경로 그리기</button>

			</div>

			<!-- Main Content -->
			<div id="main-content">
				<div id="travelplans">
					<button onclick="openModal()" id="create-plan" disabled>+</button>
				</div>

				<div id="map-content">
					<div id="map"></div>
				</div>
			</div>

			<!-- Bottom Bar -->
			<div id="bottom-bar">
				<button onclick="addPlan()">저장</button>
				<button onclick="resetPlan()">취소</button>
			</div>

			<!-- Modal Popup -->
			<div id="popupModal" class="modal">
				<div class="modal-content">
					<span class="close">&times;</span>
					<h2>내가 찜한 관광지</h2>
					<button id="add-item">추가하기</button>
					<div class="image-grid">
						<c:choose>
							<c:when test="${empty list}">
								<h2>자료가 존재하지 않습니다</h2>
							</c:when>
							<c:otherwise>
								<c:forEach var="k" items="${list}">
									<div class="image-item" data-category="${k.region}"
										data-lat="${k.latitude}" data-lng="${k.longitude}">
										<img src="${k.placeImg01}" alt="img">
										<p>
											<input type="checkbox" class="trrsrtNm"
												data-name="${k.trrsrtNm}" data-img="${k.placeImg01}">${k.trrsrtNm}</p>
									</div>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3ab528374e287b067bf7ce3808786127"></script>
	<script>
        let map;
        let isMapInit = false;

        function initMap(lat, lng) {
            let mapOption = {
                center: new kakao.maps.LatLng(lat, lng),
                level: 8
            };
            map = new kakao.maps.Map(document.getElementById('map'), mapOption);
        }
		
        let markers = [];
        let infowindows = [];
        
        function addMarker(lat, lng, iwcontent) {
            let marker = new kakao.maps.Marker({
                position: new kakao.maps.LatLng(lat, lng),
                map: map
            });
            
        	let infowindow = new kakao.maps.InfoWindow({
                position : new kakao.maps.LatLng(lat, lng), 
                content : iwcontent,
            });
        	infowindow.open(map, marker);
            
        	markers.push({ marker, lat, lng });
            infowindows.push({ infowindow, lat, lng });
        }
		
        
        document.getElementById('region-filter').addEventListener('change', function () {
            const selectedCategory = this.value;
            const imageItems = document.querySelectorAll('.image-item');
            document.querySelector("#create-plan").disabled = (selectedCategory === '0');

            imageItems.forEach(item => {
                item.style.display = (item.getAttribute('data-category') === selectedCategory) ? 'block' : 'none';
            });
        });

        document.querySelectorAll('.image-item').forEach(item => {
            item.addEventListener('click', function (e) {
                if (e.target.tagName !== 'INPUT') {
                    const checkbox = this.querySelector('input[type="checkbox"]');
                    checkbox.checked = !checkbox.checked;
                }
            });
        });

        function openModal() {
            document.querySelector("#popupModal").style.display = "block";
        }

        function closeModal() {
            document.querySelector("#popupModal").style.display = "none";
            document.querySelectorAll('.image-item input[type="checkbox"]').forEach(cb => cb.checked = false);
        }

        document.querySelector(".close").addEventListener('click', closeModal);
        window.onclick = e => { if (e.target === document.querySelector("#popupModal")) closeModal(); };

        document.getElementById('add-item').addEventListener('click', function () {
            const selectedItems = document.querySelectorAll('.image-item input[type="checkbox"]:checked');
            selectedItems.forEach(item => {
            	const region = document.getElementById('region-filter').selectedOptions[0].text;
                const name = item.getAttribute('data-name');
                const imgSrc = item.getAttribute('data-img');
                const lat = parseFloat(item.closest('.image-item').getAttribute('data-lat'));
                const lng = parseFloat(item.closest('.image-item').getAttribute('data-lng'));

                if (!isMapInit) {
                    initMap(lat, lng);
                    isMapInit = true;
                }
                
                let iwcontent = '<p>'+name+'</p>'
                addMarker(lat, lng, iwcontent);
                
                const travelPlan = document.createElement('div');
                travelPlan.classList.add('travelplan');
                travelPlan.setAttribute('data-lng', lng);
                travelPlan.setAttribute('data-lat', lat);
                travelPlan.innerHTML ='<p>'+region+'</p><p>'+name+'</p><img src="'+imgSrc+'" alt="img"><p>1.0 km</p><p>10분</p>'+
                '<button class="delete-btn" onclick="deleteTravelplan(this)">-</button>';
                document.getElementById('travelplans').insertBefore(travelPlan, document.getElementById('create-plan'));
            });

            closeModal();
        });
        
        function deleteTravelplan(button) {
        	const travelPlan = button.closest('.travelplan');
        	const lat = parseFloat(travelPlan.getAttribute('data-lat'));
            const lng = parseFloat(travelPlan.getAttribute('data-lng'));
            
            if (confirm("정말로 삭제하시겠습니까?")) {
                travelPlan.remove();
                markers = markers.filter(({ marker, lat: mLat, lng: mLng }) => {
                    if (mLat === lat && mLng === lng) {
                        marker.setMap(null);
                        return false;
                    }
                    return true;
                });

                infowindows = infowindows.filter(({ infowindow, lat: iwLat, lng: iwLng }) => {
                    if (iwLat === lat && iwLng === lng) {
                        infowindow.close(); // Close the infowindow
                        return false; // Exclude this infowindow from the array
                    }
                    return true;
                });
            }
		}
        
        function addPlan() {
			alert("추가")
			location.href='/mytrvlplan_list';
		}
        
        function resetPlan() {
        	if(confirm("취소하시겠습니까?")) location.href='/mytrvlplan';
		}
        
		function getRoadLine() {
			let linePath = [];
			let positions = [];
			document.querySelectorAll('.travelplan').forEach(item =>{
	            const lng = parseFloat(item.getAttribute('data-lng'));
				const lat = parseFloat(item.getAttribute('data-lat'));
				positions.push(lng);
			    positions.push(lat);
			})
			
			$.ajax({
				url : "/kakaoRoadLine",
				method : "get",
				data : {positions : positions},
				dataType : "json",
				success : function(data) {
					console.log(data);
					const travelPlans = document.querySelector('#travelplans');
					
					// Clear the existing travelPlan divs
		            travelPlans.innerHTML = '';

		            // Rebuild the divs in the correct order
		            data.forEach(route => {
		            	
		                const [lng, lat] = route.routes[0].summary.origin.split(',').map(Number);

		                const matchedDiv = Array.from(travelPlans).find(item =>
		                    parseFloat(item.getAttribute('data-lat')) === lat &&
		                    parseFloat(item.getAttribute('data-lng')) === lng
		                );

		                if (matchedDiv) {
		                	travelPlans.appendChild(matchedDiv);
		                }
		            });
					
		            // drawing part
					data.forEach(route => {
						route.routes[0].sections[0].roads.forEach(item => {
							  item.vertexes.forEach((vertex, index) => {
								if (index % 2 === 0) {
									linePath.push(new kakao.maps.LatLng(item.vertexes[index + 1], item.vertexes[index]));
								}
							});
						});
					})
					  
					var polyline = new kakao.maps.Polyline({
					  path: linePath,
					  strokeWeight: 5,
					  strokeColor: '#0000ff',
					  strokeOpacity: 0.5,
					  strokeStyle: 'solid'
					}); 
					polyline.setMap(map);
					
				}, 
				error : function() {
					alert("읽기 실패!");
				}
			})
			
		}
    </script>
</body>
</html>
