<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 - MyTravelList</title>
<link type="text/css" href="/resources/css/style.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style type="text/css">
	body {
		margin: 0;
		padding: 0;
	}
	.join-container {
		width: 50%;
		margin: 50px auto;
		padding: 20px;
	}
	.logo-img {
		cursor: pointer;
	}
	.join-table {
		width: 70%;
		border-spacing: 0 10px;
		margin: 50px auto;
	}
	.join-table td {
		padding: 5px 0px; 
	}
	table input[type="text"], input[type="password"], input[type="email"] {
		width: 70%;
		padding: 10px;
	}
	.select-area {
		text-align: center;
		margin-top: 20px;
	}
	.select-area div {
		display: inline-block;
		margin: 5px;
	}
	input[type="button"] {
		width: 100px;
		padding: 8px 0;
		font-size: 15px;
		border-radius: 5px;
		background-color: #008165;
		color: white;
		cursor: pointer;
		border: none;
		text-align: center;
	}
	input[type="button"]:hover{
		background-color: #02B08A;
	}
	.interest-table {
  		width: 70%;
  		border-collapse: collapse;
  		margin: 20px auto;
	}
	#interest-subject{
		text-align: left;
	}
	.interest-table td {
  		padding: 10px;
  		text-align: center;
	}
	.interest-btn {
  		padding: 8px 15px;
  		margin: 2px;
  		background-color: #f0f0f0;
  		border: 2px solid #ccc;
  		border-radius: 5px;
  		font-size: 14px;
  		cursor: pointer;
  		transition: background-color 0.3s ease, color 0.3s ease;
  		width: 80%;
	}
	.interest-btn.selected {
  		background-color: #007bff;
  		color: white;
	}
	.interest-btn:hover {
  	background-color: #e0e0e0;
	}
	.button-container {
    	display: flex;
    	justify-content: center;
    	flex-direction: row;
    	gap: 20px;
    	margin-top: 30px;
	}
	.join_btn, .cancel_btn {
	    width: 150px;
	    padding: 10px 0;
	    font-size: 16px;
	    border-radius: 5px;
	    cursor: pointer;
	    border: none;
	    text-align: center;
	}
	.join_btn {
		background-color: #008615;
		color: white;
	}
	.join_btn:disabled {
		background-color: #88B0AB;
		cursor: pointer;
	}
	.join_btn:hover:not(:disabled) {
		background-color: #006a12;
	}
	.cancel_btn {
		background-color: #008165;
		color: white;
	}
	.cancel_btn:hover {
		background-color: #02B08A;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="header-wrap">
			<img alt="" src="<c:url value='/resources/images/logo.png' />"
				class="logo-img" style="width: 250px; height: 50px;"
				onclick="location.href='/'" />
			<p class="agreement-title" style="text-align: center;">회원가입</p>
			<hr color="008615">
		</div>
		<div class="join-container">
			<form action="/mem_joinPage_OK" method="post" name="joinForm">
				<table id="join-table" class="join-table">
					<tbody>
						<!-- 이름 -->
						<tr>
							<td><label for="userName"><span class="span-subject">*</span> 이름</label></td>
							<td><input type="text" id="userName" name="userName" placeholder="이름 입력" required></td>
						</tr>
						
						<!-- 아이디 -->
						<tr>
							<td><label for="userId"><span class="span-subject">*</span> 아이디</label></td>
							<td>
								<input type="text" id="userId" name="userId" placeholder="아이디 입력(6~10자, 영문자, 숫자 포함)" required>
								<div class="id_regex" id="id_chkMsg"></div>
							</td>
						</tr>
						
						<!-- 비밀번호 -->
						<tr>
							<td><label for="userPw"><span class="span-subject">*</span> 비밀번호</label></td>
							<td>
								<input type="password" id="userPw" name="userPw" placeholder="비밀번호 입력(8~15문자, 영문자, 숫자, 특수문자 포함)" required>
								<div class="pw_regex" id="pw_regex"></div>
							</td>
						</tr>
						
						<!-- 비밀번호 확인 -->
						<tr>
							<td><label for="userPw2"><span class="span-subject">*</span> 비밀번호 확인</label></td>
							<td>
								<input type="password" id="userPw2" name="userPw2" placeholder="비밀번호 확인 입력" required>
								<div class="pw_equal" id="pw_equal"></div>
							</td>
						</tr>
						
						<!-- 이메일 -->
						<tr>
							<td><label for="userMail"><span class="span-subject">*</span> 이메일</label></td>
							<td>
								<input type="email" id="userMail" name="userMail" placeholder="이메일 입력" required>
							</td>
						</tr>
						
						<!-- 주소 -->
						<tr>
							<td><label for="userAddr"><span class="span-subject">*</span> 주소</label></td>
							<td>
								<input type="text" id="userAddr" name="userAddr" placeholder="주소 입력" required>
								<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기">
							</td>
						</tr>
					</tbody>
				</table>
				 
				<!-- 관심지 -->
				<table class="interest-table">
					<tbody>
						<tr>
							<td id="interest-subject">관심지</td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="1" data-city="서울특별시">서울특별시</button></td>
							<td><button type="button" class="interest-btn" name="2" data-city="부산광역시">부산광역시</button></td>
							<td><button type="button" class="interest-btn" name="3" data-city="대구광역시">대구광역시</button></td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="4" data-city="인천광역시">인천광역시</button></td>
							<td><button type="button" class="interest-btn" name="5" data-city="광주광역시">광주광역시</button></td>
							<td><button type="button" class="interest-btn" name="6" data-city="대전광역시">대전광역시</button></td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="7" data-city="울산광역시">울산광역시</button></td>
							<td><button type="button" class="interest-btn" name="8" data-city="경기도">경기도</button></td>
							<td><button type="button" class="interest-btn" name="9" data-city="강원특별자치도">강원특별자치도</button></td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="10" data-city="충청북도">충청북도</button></td>
							<td><button type="button" class="interest-btn" name="11" data-city="충청남도">충청남도</button></td>
							<td><button type="button" class="interest-btn" name="12" data-city="전라북도">전라북도</button></td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="13" data-city="전라남도">전라남도</button></td>
							<td><button type="button" class="interest-btn" name="14" data-city="경상북도">경상북도</button></td>
							<td><button type="button" class="interest-btn" name="15" data-city="경상남도">경상남도</button></td>
						</tr>
						<tr>
							<td><button type="button" class="interest-btn" name="16" data-city="제주특별자치도">제주특별자치도</button></td>
						</tr>
					</tbody>
				</table>

- 				<div class="button-container">
					<div class="join-ok-button" id="join-ok-button">
						<!--<input type="hidden" name="이름" value="서버로 넘길 값"/>-->
						<input type="hidden" value="join_OK">
						<!--추가로 위 필드 모두 입력과 조건 만족 시에 회원가입 버튼 활성화하는 코드 추가해야함-->
						<input type="submit" class="join_btn" disabled value="회원가입">
					</div>
					<div class="cancel-button">
						<button type="button" class="cancel_btn" onclick="location.href='/';">취소</button>
					</div>
				</div>
			</form>
		</div>
		
		<!-- 아이디, 비밀번호 스크립트 -->
		<script type="text/javascript">
		// 아이디 정규식(6~10자, 영문자, 숫자 포함 여부 체크)
		$("#userId").on("keyup", function() {
		    const userId = $(this).val();
		    const idchkMsg = $("#id_chkMsg");

		    // 영문자와 숫자로만 구성되어 있는지 확인하는 정규 표현식
		    const isValidFormat = /^[a-zA-Z0-9]+$/.test(userId);

		    if (userId.length < 6 || userId.length > 10) {
		    	idchkMsg.html("아이디는 6자 이상 10자 이하로 입력해 주세요.").css("color", "red");
		    } else if (!isValidFormat) {
		    	idchkMsg.html("아이디는 영문자와 숫자로만 구성되어야 합니다.").css("color", "red");
		    } else {
		    	idchkMsg.html(""); // 조건 충족 시, 메세지 초기화
		    }
		});

	    // 비밀번호 정규식: 영문자, 숫자, 특수문자 포함 여부 체크
	    const pwRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{8,15}$/;

		// 비밀번호 유효성 검증 함수
	    function validatePassword() {
	        const pw = $("#userPw").val();
	        const pwMsg = $("#pw_regex"); // 메시지 표시할 span

	        if (!pwRegex.test(pw)) {
	            pwMsg.html("비밀번호는 8~15자, 영문자, 숫자, 특수문자를 포함해야 합니다.").css("color", "red");
	            return false;
	        } else {
	            pwMsg.html(""); // 조건 만족 시, 초기화
	            return true;
	        }
	    }

	    // 비밀번호 입력하는 곳에서 입력할 때마다 유효성 검증 수행
	    $("#userPw").on("input", function() { 
	        validatePassword();
	    });


	 	// 비밀번호 확인 입력하는 곳에서 포커스 시 값 초기화 및 메세지 초기화
	    $("#userPw2").on("focus", function() {
	        $(this).val(""); // 비밀번호 확인 입력하는 곳 초기화
	        $("#pw_equal").html(""); // 메세지 초기화
	    });

	    // 비밀번호 일치 여부
	    function pwChkOk() {
	        const pw1 = $("#userPw").val();
	        const pw2 = $("#userPw2").val();
	        const pwMsg = $("#pw_equal");

	        if (pw1 && pw2) { // value가 모두 있을 때 메세지
	            if (pw1 === pw2) {
	                if (validatePassword()) {
	                    pwMsg.html("비밀번호가 일치합니다.").css("color", "green");
	                }
	            } else {
	                pwMsg.html("비밀번호가 일치하지 않습니다.").css("color", "red");
	            }
	        } else {
	            pwMsg.html(""); // value가 모두 없을 때 메세지 없음
	        }
	    }

	    // 비밀번호 확인 입력하는 곳에 포커스 시 값 초기화
	    $("#userPw2").on("focus", function() {
	        $(this).val(""); // 비밀번호 확인 입력하는 곳 초기화
	    });

	    // 비밀번호 확인 입력하는 곳에서 블러 이벤트 시 일치 여부 확인
	    $("#userPw, #userPw2").on("blur", function() {
	        pwChkOk();
	    });
	</script>

	<!-- 주소 api 스크립트 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
   		function sample6_execDaumPostcode() {
        	new daum.Postcode({
           	 oncomplete: function(data) {
                var addr = ''; // 주소 변수
                
                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 지번 주소를 선택했을 경우
                    addr = data.jibunAddress;
                }

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("userAddr").value = addr;
            	}
        	}).open();
   		 }
	</script>
	
	<!-- 관심지 스크립트 -->
	<script type="text/javascript">
		$(document).ready(function() {
	    	let selectedCount = 0; // 최대 3개 선택지 선택 가능
	    
	    	$('.interest-btn').on('click', function(event) {
	        	event.preventDefault(); // 폼 제출 막기

	        	if ($(this).hasClass('selected')) {
	            	$(this).removeClass('selected');
	            	selectedCount--;
	        	} else { // 선택하지 않은 관심지를 선택할 때
	            	if (selectedCount < 3) {
	                	$(this).addClass('selected');
	                	selectedCount++;
	            	} else {
	                	alert('최대 3개까지만 선택 가능합니다.');
	            	}
	        	}
	    	});
		});
	</script>
	
	<!-- 회원가입 버튼 활성화 스크립트 -->
	<script type="text/javascript">
		
	</script>
	</div>
</body>
</html>