<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - MyTravelList</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	body{
		margin: 0;
		padding: 0;
	}
	.main-container{
		width: 50%;
		margin: 50px auto;
		padding: 20px;
	}
	.agreement-table{
		width: 100%;
		border-spacing: 0 10px;
	}
	.agreement-table td{
		padding: 5px 0px;
	}
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 5% auto;
        padding: 30px;
        border-radius: 5px;
        width: 80%; 
        max-width: 1000px;
        height: 70%;
        max-height: 600px; 
        overflow-y: hidden;
    }
	.modal-in-title{
		color: #333;
		border-bottom: 2px solid #008165;
		padding-bottom: 5px;
	}
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
    }
    .agree-list{
    	list-style-type: none;
    }
    .button-container{
    	display: flex;
    	justify-content: center;
    	flex-direction: row;
    	gap: 20px;
    	margin-top: 30px;
    }
	.disabled{
		margin: 20px 0px 0px;
		padding: 10px 30px;
		background-color: #88B0AB;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.enabled{
		margin: 20px 0px 0px;
		padding: 10px 30px;
		background-color: #008165;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.logo-img{
		cursor: pointer;
	}	body{
		margin: 0;
		padding: 0;
	}
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 5% auto;
        padding: 30px;
        border-radius: 5px;
        width: 80%; 
        max-width: 1000px;
        height: 70%;
        max-height: 600px; 
        overflow-y: hidden;
    }
	.modal-in-title{
		color: #333;
		border-bottom: 2px solid #008165;
		padding-bottom: 5px;
	}
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }
    .close:hover, .close:focus {
        color: black;
        text-decoration: none;
    }
    .agree-list{
    	list-style-type: none;
    }
	.disabled{
		margin: 20px 0px 0px;
		padding: 10px 30px;
		background-color: #88B0AB;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.enabled{
		margin: 20px 0px 0px;
		padding: 10px 30px;
		background-color: #008165;
		color: white;
		border: none;
		border-radius: 5px;
		cursor: pointer;
	}
	.logo-img{
		cursor: pointer;
	}
</style>
</head>
<body>
<div class="container">
	<div class="header-wrap">
    	<img alt="" src="<c:url value='/resources/images/logo.png' />" 
         	class="logo-img" style="width: 250px; height: 50px;" 
         	onclick="location.href='/'" />
		<p class="agreement-title" style="text-align: center;">회원가입 약관 동의</p>
		<hr color="008615">
	</div>
	
	<div class="main-wrap">
		<div class="main-container">
			<p class="agreement-content" style="text-align: center;">회원가입을 위해<br>약관 내용에 먼저 동의해 주세요.</p>
			<form action="/mem_joinPage" method="post" id="agreement-form">
				<div>
					<table class="agreement-table">
						<thead>
							<tr>
								<td><label><input type="checkbox" name="agreements" value="전체 동의하기" id="selectAll">전체 동의하기</label></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label><input type="checkbox" name="agreements" value="필수 약관 동의" class="agree-item">
								(필수) My TravelList 이용약관 동의</label></td>
								<td><button type="button" id="btn-modal1" class="btn btn-modal">내용 보기</button></td>
							</tr>
							<tr>
								<td><label><input type="checkbox" name="agreements" value="필수 개인정보 수집 및 이용 동의" class="agree-item">
								(필수) My TravelList 개인정보 수집 및 이용 동의</label></td>
								<td><button type="button" id="btn-modal2" class="btn btn-modal">내용 보기</button></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="button-container">
					<button type="submit" id="proceed" class="disabled">다음</button>			
				</div>
			</form>
		</div>
	</div>
	<!-- 모달 1 -->
	<div id="modal1" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close" data-modal="modal1">&times;</span>
				<h2 class="modal-in-title">My TravelList 이용약관</h2>
			</div>
			<iframe src="<c:url value='/resources/html/terms.html' />"
				width="100%" height="100%" style="border: none;"> </iframe>
		</div>
	</div>

	<!-- 모달 2 -->
	<div id="modal2" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<span class="close" data-modal="modal2">&times;</span>
				<h2 class="modal-in-title">My TravelList 개인정보 수집 및 이용 동의</h2>
			</div>
			<iframe src="<c:url value='/resources/html/privacy.html' />"
				width="100%" height="100%" style="border: none;"> </iframe>
		</div>
	</div>

	<!-- 체크박스 스크립트 -->
	<script type="text/javascript">
 			document.addEventListener('DOMContentLoaded', ()=>{
 			const myForm = document.querySelector("#myForm");
 			const selectAll = document.querySelector("#selectAll");
 			const checkboxs = document.querySelectorAll(".agree-item");
 			const proceed = document.querySelector("#proceed");
 		
 			// 체크박스 상태 확인 후 버튼 활성화/비활성화
 			function updateProceed() {
 				//객체를 배열로 만든 후 true만 추출
				const anyChecked = Array.from(checkboxs).some(item => item.checked);
 				if (anyChecked) {
					proceed.classList.remove('disabled');	// 클래스 제거
 					proceed.classList.add('enabled');		// 클래스 추가
 					proceed.disabled = false;	//버튼 활성화
				} else {
					proceed.classList.remove('enabled');
 					proceed.classList.add('disabled');
 					proceed.disabled = true;	//버튼 비활성화
				}
			}
 		
 			// 전체 선택 체크박스 제어
 			selectAll.addEventListener("change", (e)=>{
 				checkboxs.forEach(item => item.checked = selectAll.checked);
 				updateProceed();
 			});
 		
 			// 개별 체크박스 제어
 			checkboxs.forEach(item => {
 				item.addEventListener("change", (e)=>{
 					// 객체를 배열로 만든 후 주어진 조건을 만족하는 지 확인
 					const chk = Array.from(checkboxs).every(item => item.checked);
 					selectAll.checked = chk;
 					updateProceed();
 				});
 			});
 		});
 	</script>
 	
 	<!-- 모달창 스크립트 -->
 	<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', () => {
        // 모달 열기 버튼
        const openModal1 = document.getElementById('btn-modal1');
        const openModal2 = document.getElementById('btn-modal2');

        // 모달 요소
        const modal1 = document.getElementById('modal1');
        const modal2 = document.getElementById('modal2');

        // 모달 닫기 버튼 (X 버튼)
        const closeButtons = document.querySelectorAll('.close');

        // 모달 열기 함수
        function openModal(modal) {
            modal.style.display = 'block';
        }

        // 모달 닫기 함수
        function closeModal(modal) {
            modal.style.display = 'none';
        }

        // 외부 클릭 시 모달 닫기
        function outsideClick(event, modal) {
            if (event.target === modal) {
                closeModal(modal);
            }
        }

        // 이벤트 리스너 등록
        openModal1.addEventListener('click', () => openModal(modal1));
        openModal2.addEventListener('click', () => openModal(modal2));

        closeButtons.forEach(button => {
            button.addEventListener('click', (event) => {
                const modalId = event.target.getAttribute('data-modal');
                const modal = document.getElementById(modalId);
                closeModal(modal);
            });
        });

        modal1.addEventListener('click', (event) => outsideClick(event, modal1));
        modal2.addEventListener('click', (event) => outsideClick(event, modal2));
    });
	</script>
</div>
</body>
</html>