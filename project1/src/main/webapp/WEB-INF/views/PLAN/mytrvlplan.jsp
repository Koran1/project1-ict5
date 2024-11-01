<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan - index</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet" />
<style type="text/css">
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
}

/* Hide items with display: none smoothly */
.image-item {
	transition: opatest2 0.3s ease;
}

.image-item img {
	width: 80%;
	height: 80%;
}
.image-item:hover{
	border: 5px solid pink;
}
</style>
</head>
<body>

	<div id="header">
		<a href="/index"><img id="logo" alt="logo"
			src="../resources/images/logo.png"></a>
		<h2>right side</h2>
	</div>

	<div id="container">
		<div id="button_container">
			<button style="color: red" onclick="location.href='/mytrvlplan'">나의
				관심지 관리</button>
			<button onclick="location.href='/mytrvlplan_create'">여행 계획
				짜기</button>
			<button onclick="location.href='/mytrvlplan_list'">여행 계획 관리</button>
		</div>

		<div id="main_container">
			<select id="region-filter">
				<option value="all">All</option>
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


			<div class="image-grid">
				<c:choose>
					<c:when test="${empty list}">
						<h2>자료가 존재하지 않습니다</h2>
					</c:when>
					<c:otherwise>
					<c:forEach var="k" items="${list}">
						<div class="image-item" data-category="${k.region}" data-idx="${k.travelIdx}">
							<img src="${k.placeImg01}" alt="test1">
							<p><input type="checkbox"><a href="/main_detail?travelIdx=${k.travelIdx}">${k.trrsrtNm}</a></p>
						</div>
					</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<br>
			<br>
			<button id="unlike-item" onclick="unlikeItem()">관심해제</button>
		</div>

	</div>

	<script type="text/javascript">
		document.getElementById('region-filter').addEventListener('change', function () {
		    const selectedCategory = this.value;
		    const imageItems = document.querySelectorAll('.image-item');
			console.log(selectedCategory);
		
		    imageItems.forEach((item) => {
		        const itemCategory = item.getAttribute('data-category');
		        if (selectedCategory === 'all' || itemCategory === selectedCategory) {
		            item.style.display = 'block';
		        } else {
		            item.style.display = 'none';
		        }
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
		
		function unlikeItem() {
			const selectedItems = document.querySelectorAll('.image-item input[type="checkbox"]:checked');
			const travelIdxes = Array.from(selectedItems).map(item=>
				item.closest('.image-item').getAttribute('data-idx'));
			if(travelIdxes.length === 0){
				alert('관심 해제할 항목을 선택하세요.');
		        return;
			}
			const query = travelIdxes.map(item => "travelIdx="+item).join('&');
			location.href = "/mytrvlplan_unlike?"+query;
		}
	</script>

</body>
</html>