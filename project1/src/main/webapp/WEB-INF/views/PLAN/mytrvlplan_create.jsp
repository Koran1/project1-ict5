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

.travelplans {
	display: flex;
	flex-direction: column;
	width: 40%;
	border: 1px solid black;
	align-items: center;
}

.travelplans #create-plan {
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
				<div class="travelplans">
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
										data-lat="${k.latitude}"
										data-lng="${k.longitude}"
										data-index="${k.travelIdx}">
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
        let polyline;
        
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
		
        
        
        // Region filtering
        document.getElementById('region-filter').addEventListener('change', function () {
            const selectedCategory = this.value;
            const imageItems = document.querySelectorAll('.image-item');
            document.querySelector("#create-plan").disabled = (selectedCategory === '0');

            imageItems.forEach(item => {
                item.style.display = (item.getAttribute('data-category') === selectedCategory) ? 'block' : 'none';
            });
        });
		
        // Items check toggle
        document.querySelectorAll('.image-item').forEach(item => {
            item.addEventListener('click', function (e) {
                if (e.target.tagName !== 'INPUT') {
                    const checkbox = this.querySelector('input[type="checkbox"]');
                    checkbox.checked = !checkbox.checked;
                }
            });
        });

        // Modal features
        function openModal() {
            document.querySelector("#popupModal").style.display = "block";
        }

        function closeModal() {
            document.querySelector("#popupModal").style.display = "none";
            document.querySelectorAll('.image-item input[type="checkbox"]').forEach(cb => cb.checked = false);
        }
        
        document.querySelector(".close").addEventListener('click', closeModal);
        window.onclick = e => { 
        	if (e.target === document.querySelector("#popupModal")) closeModal(); 
        };
		
        let addedItems = [];
        
        // Check items from Modal
        
        document.getElementById('add-item').addEventListener('click', function () {
           const selectedItems = document.querySelectorAll('.image-item input[type="checkbox"]:checked');
           try{
	           selectedItems.forEach(item => {
	            	const region = document.getElementById('region-filter').selectedOptions[0].text;
	                const name = item.getAttribute('data-name');
	                const imgSrc = item.getAttribute('data-img');
	                const dataindex = item.closest('.image-item').getAttribute('data-index');
	                const lat = parseFloat(item.closest('.image-item').getAttribute('data-lat'));
	                const lng = parseFloat(item.closest('.image-item').getAttribute('data-lng'));
					
	                
	                if(addedItems.includes(name)){
	                	throw new Error(name+'은 중복입니다!');
	                }
	                
	                addedItems.push(name);
	                
	                if (!isMapInit) {
	                    initMap(lat, lng);
	                    isMapInit = true;
	                }
	                
	                let iwcontent = '<p>'+name+'</p>'
	                addMarker(lat, lng, iwcontent);
	                
	                const travelPlan = document.createElement('div');
	                travelPlan.classList.add('travelplan');
	                travelPlan.setAttribute('draggable', "true");
	                travelPlan.setAttribute('data-name', name);
	                travelPlan.setAttribute('data-index', dataindex);
	                travelPlan.setAttribute('data-img', imgSrc);
	                travelPlan.setAttribute('data-lng', lng);
	                travelPlan.setAttribute('data-lat', lat);
	                travelPlan.innerHTML ='<p>'+region+'</p><p>'+name+'</p><img src="'+imgSrc+'" alt="img"><p>- km</p><p>- 분</p>'+
	                '<button class="delete-btn" onclick="deleteTravelplan(this)">-</button>';
	                document.querySelector('.travelplans').insertBefore(travelPlan, null);
	            });

            	closeModal();
            	dragDrop();
            	
	           } catch(error){
	        	   selectedItems.forEach(cb => cb.checked = false);
	        	   alert(error);
	           }
        });
        

        
        // Drag & Drop
        function dragDrop(){
	        const draggables = document.querySelectorAll('.travelplan');

            draggables.forEach(travelplan => {
            	travelplan.addEventListener('dragstart', () => {
            		travelplan.classList.add('dragging');
               });

            	travelplan.addEventListener('dragend', () => {
            		travelplan.classList.remove('dragging')
               });
            });

            function getDragAfterElement(container, y) {
               const draggableElements = [...container.querySelectorAll('.travelplan:not(.dragging)')]

               return draggableElements.reduce((closest, child) => {
                  const box = child.getBoundingClientRect() //해당 엘리먼트에 top값, height값 담겨져 있는 메소드를 호출해 box변수에 할당
                  const offset = y - box.top - box.height / 2 //수직 좌표 - top값 - height값 / 2의 연산을 통해서 offset변수에 할당
                  if (offset < 0 && offset > closest.offset) { // (예외 처리) 0 이하 와, 음의 무한대 사이에 조건
                     return { offset: offset, element: child } // Element를 리턴
                  } else {
                     return closest
                  }
               }, { offset: Number.NEGATIVE_INFINITY }).element
            };

	        const container = document.querySelector('.travelplans');
            container.addEventListener('dragover', e => {
               e.preventDefault()
               const afterElement = getDragAfterElement(container, e.clientY);
               const draggable = document.querySelector('.dragging')
               container.insertBefore(draggable, afterElement)
            })
         }
        
        // Delete
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
                        infowindow.close(); 
                        return false; 
                    }
                    return true;
                });
                if(polyline !== undefined){
	                polyline.setMap(null);
                }
                
                const name = travelPlan.getAttribute('data-name');
				addedItems = addedItems.filter((element) => element !== name);
             }
		}
        
		function getRoadLine() {
			let linePath = [];
			let positions = [];
			let idx_container = [];
			if(polyline !== undefined){
                polyline.setMap(null);
            }
			
			document.querySelectorAll('.travelplan').forEach(item =>{
				const data_idx = item.getAttribute('data-index');
	            const lng = parseFloat(item.getAttribute('data-lng'));
				const lat = parseFloat(item.getAttribute('data-lat'));
				positions.push(lng);
			    positions.push(lat);
			    idx_container.push(data_idx);
			})
			$.ajax({	
				url : "/kakaoRoadLine",
				method : "get",
				data : {positions : positions, idx_container : idx_container},
				dataType : "json",
				success : function(data) {
					console.log(data);
					
			        const data_container = document.querySelectorAll('.travelplan');
			        console.log(data_container);
			        
			        const container = document.querySelector('.travelplans');
			     	// Clear previous plans
			        container.innerHTML = ''; 
			        
			        
					
			        const region = document.getElementById('region-filter').selectedOptions[0].text;
	                const name = data_container[0].getAttribute('data-name');
	                const imgSrc = data_container[0].getAttribute('data-img');
	                
	                const createBtn = document.createElement('button');
		            createBtn.textContent = '+';
		            createBtn.onclick = openModal; // Set the onclick function
		            createBtn.id = 'create-plan'; // Set the ID
		            container.appendChild(createBtn);
			        
			        // First is fixed
			        const travelPlan = document.createElement('div');
		            travelPlan.classList.add('travelplan');
		            travelPlan.setAttribute('draggable', "true");
		            travelPlan.setAttribute('data-name', name);
		            travelPlan.setAttribute('data-index', data[0].routes[0].summary.origin.name);
		            travelPlan.setAttribute('data-img', imgSrc);
		            travelPlan.setAttribute('data-lat', data_container[0].getAttribute('data-lat')) ;
		            travelPlan.setAttribute('data-lng', data_container[0].getAttribute('data-lng')) ;
		            travelPlan.innerHTML = '<p>'+region+'</p><p>'+name+'</p><img src="'+imgSrc+'" alt="img"><p>시작지점</p><button class="delete-btn" onclick="deleteTravelplan(this)">-</button>';
		            container.appendChild(travelPlan);
			        
					data.forEach(plan => {
						for (let i = 0; i < data_container.length; i++) {
							if(plan.routes[0].summary.destination.name === data_container[i].getAttribute('data-index')){
					        	let name = data_container[i].getAttribute('data-name');
					        	let imgSrc = data_container[i].getAttribute('data-img');
					        	
					            const travelPlan = document.createElement('div');
					            travelPlan.classList.add('travelplan');
					            travelPlan.setAttribute('draggable', "true");
					            travelPlan.setAttribute('data-name', name);
					            travelPlan.setAttribute('data-index', plan.routes[0].summary.destination.name);
					            travelPlan.setAttribute('data-img', imgSrc);
					            travelPlan.setAttribute('data-lat', data_container[i].getAttribute('data-lat')) ;
					            travelPlan.setAttribute('data-lng', data_container[i].getAttribute('data-lng')) ;
					            travelPlan.innerHTML = '<p>'+region+'</p><p>'+name
								+'</p><img src="'+imgSrc+'"alt="img"><p>'
								+Math.ceil(plan.routes[0].sections[0].distance/10)/100+'km</p><p>'
								+Math.ceil(plan.routes[0].sections[0].duration/60)+' 분</p><button class="delete-btn" onclick="deleteTravelplan(this)">-</button>';
					            container.appendChild(travelPlan);
							}
						}
			        });
	                	
					
			        // Re-enable drag-and-drop
			        dragDrop();
					
		            // Drawing part
					data.forEach(route => {
						route.routes[0].sections[0].roads.forEach(item => {
							  item.vertexes.forEach((vertex, index) => {
								if (index % 2 === 0) {
									linePath.push(new kakao.maps.LatLng(item.vertexes[index + 1], item.vertexes[index]));
								}
							});
						});
					})
					  
					polyline = new kakao.maps.Polyline({
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
		
		function addPlan() {
			alert("추가")
			location.href='/mytrvlplan_list';
		}
        
        function resetPlan() {
        	if(confirm("취소하시겠습니까?")) location.href='/mytrvlplan';
		}
    </script>
</body>
</html>
