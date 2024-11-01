<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-나의정보수정</title>
 <style type="text/css">
	#container{display: flex;}
	#flex_left{width: 15%;  background-color: Whitesmoke;}
	#flex_write{width: 85%;}
	#logo{width: 200px; height: 70px;} 
	#name{font-size: 50px; font-weight: bold;}
	#article_container{display: flex; flex-direction: column;}
	article{font-size: 30px; padding: 20px; margin: 10px;}
	#title{font-size: 50px; margin-left: 20px;}
	#msg{margin-left: 100px;  font-size: 30px;}
	a {text-decoration: none; color: black}
	#update_form{width: 1000px; min-height: 1000px; margin: 0 auto;}
	#modal{
		border: 1px solid lightgray; 
	    position:fixed; 
	    left: 750px; 
	    top: 100px; 
	    display: none;
	    background-color: #F0F8FF;
	    width: 1200px;
	 }
    .write {width: 60%;  padding: 25px; margin-left: 20px; margin-bottom: 20px;}
    input[type="text"], input[type="email"] {font-size: 20px;}
    input[type="submit"] {width: 130px; height: 60px;}
    input[type="button"] {width: 130px; height: 60px;}
    .btn_action{
    	margin-right: 100px;
    	width: 130px; height: 60px;
    }
    span {font-size: 20px;}
    i {font-size: 20px;}
    td{
	    margin: 100px;  
	    border: 1px solid black; 
	    background-color: white;
	    width: 300px; 
	    height: 50px;
	    text-align: center;
	    
	 }
	 #buttons{display: flex; justify-content: center; margin-top: 20px; } 
	 #region_table{margin: 32px auto; border-collapse: separate; border-spacing: 8px;}
	 .clicked{background-color: #4682B4; color: white}
	 td:hover{background-color: #4682B4; color: white}
	 input[name="userName"], input[name="userId"] {background-color: lightgray;}
</style>
</head>
<body>
<div id="container">
		<section id="flex_left">
			<a href="/go_main"><img id="logo" alt="" src="resources/images/logo.png"></a>
			<p id="name">홍길동님</p>
			<div id="article_container">
			<article><a href="/go_my_comment">
				<img alt="" src="resources/images/my_comment.png" style="float: left;">
				내 댓글 관리
			</a></article>
			<article style="background-color: lightgray">
				<img alt="" src="resources/images/update.png" style="float: left;">
				회원정보 수정
			</article>
			<article><a href="go_pw_change">
				<img alt="" src="resources/images/change_pw.png" style="float: left;">
				비밀번호 변경
			</a></article>
			<article><a href="/go_user_out">
				<img alt="" src="resources/images/member_out.png" style="float: left;">
				회원 탈퇴
			</a></article>
			</div>

		</section>
			 
		<section id="flex_write">
			 <p id="title">회원정보 수정</p>
			 <hr>
			 <form  id="update_form" method="post">
				<fieldset>
					<legend>개인정보 수정</legend>
			 			
			 			<label for="userName">이름 <input type="text" name="userName" id="userName" class="write" value="${detail.userName }"readonly> </label><br>
				 		<label for="userId">아이디 <input type="text" name="userId" id="userId"  class="write" value="${detail.userId }" readonly></label><br>
			 			<label for="userMail">이메일 
			 				<input type="email" name="userMail"  id="userMail" class="write" value="${detail.userMail }" 
			 					   pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식"  required>
			 			</label><br>
				 		<label for="userAddr">주소(시/군/구) 
				 			<input type="text" name="userAddr"  id="userAddr" class="write" value="${detail.userAddr }" required>
				 		</label>
				 		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br> 
			 			<label>내 관심지역:
			 				<span>1. <i id="userFavor01">${detail.userFavor01}</i> &nbsp; &nbsp;</span> 
			 				<span>2. <i id="userFavor02">${detail.userFavor02}</i> &nbsp; &nbsp;</span> 
			 				<span>3. <i id="userFavor03">${detail.userFavor03}</i>  &nbsp; &nbsp;</span> 
			 				<input type="button" id="change_flavor" value="변경하기" onclick="changeFlavor()">
			 			</label>
			 			<input type="hidden" name="userFavor01" value="${detail.userFavor01}">
			 			<input type="hidden" name="userFavor02" value="${detail.userFavor02}">
			 			<input type="hidden" name="userFavor03" value="${detail.userFavor03}">
				</fieldset>
				<div id="buttons">
				<input type="button"  id="btn_cancel" class="btn_action" value="취소" onclick="location.href='/go_my_page'">
				<input type="submit" id="btn_update" class="btn_action" value="수정" onclick="goUpdate(this.form)">
				</div>
			 </form>
		<div id="modal">
				<table id="region_table">
					<tbody>
					<tr><td>강원도</td><td>경기도</td><td>경상북도</td></tr>
					<tr><td>경상남도</td><td>광주광역시</td><td>대구광역시</td></tr>
					<tr><td>대전광역시</td><td>부산광역시</td><td>서울특별시</td></tr>
					<tr><td>울산광역시</td><td>인천광역시</td><td>전라남도</td></tr>
					<tr><td>전라북도</td><td>제주특별자치도</td><td>충청남도</td></tr>
					<tr><td>충청북도</td></tr>
					</tbody>
				</table>
				<div id="buttons">
					<input type="button" id="modal_close" class="btn_action" value="닫기" >
					<input type="button" id="modal_confirm" class="btn_action" value="확인">
				</div>
		</div>
		</section>				
	</div>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
           function sample6_execDaumPostcode() { // 주소 api
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
           
           function goMyPage(f) {
				f.action = "";
				f.submit();
			}
           function goUpdate(f) {
        	   f.action = "/go_update_ok";
		   }
           function changeFlavor() {
				let modal = document.querySelector("#modal");
				modal.style.display = "block";
		   }
           
          // 모달창 닫을 때 클래스 초기화
           let closeBtn = document.querySelector("#modal_close");
           closeBtn.addEventListener("click", function() {
				let modal = document.querySelector("#modal");
				modal.style.display = "none";
			    let tds = document.querySelectorAll("td");
			    Array.from(tds).map(item => item.classList.remove("clicked"));
           });
			
         
           // td 클릭할때마다 토클형식으로 clicked  클래스 추가하기
           let tds = document.querySelectorAll("td"); // td들을 tds에 모아서 
           Array.from(tds).forEach((td)=>{ // td마다 접근해서 
              td.addEventListener("click", function() { // td가 각각 클릭될때 마다
            	  if (this.classList.contains("clicked")) {
						this.classList.remove("clicked");
				  }else{
					let clicked = document.querySelectorAll(".clicked");
            		  if (clicked.length < 3) {
            			  console.log(clicked.length)
	            		  this.classList.add("clicked");	        
						}
				  }
				});
          });
           

			  
           let modal_confirm = document.querySelector("#modal_confirm"); 
           modal_confirm.addEventListener("click", function() {
        	  let clicked = document.querySelectorAll(".clicked");
        	  if (clicked.length != 3) {
				alert("관심 지역을 반드시 3곳 선택해 주세요.");
			}else {
	        	  let clicked_region = Array.from(clicked).map(item => item = item.innerText);
	        	  
	        	  let userFavor01 = document.querySelector("#userFavor01"); 
	        	  let userFavor02 = document.querySelector("#userFavor02"); 
	        	  let userFavor03 = document.querySelector("#userFavor03");
	        	  
	        	  userFavor01.innerText = clicked_region[0];
	        	  userFavor02.innerText = clicked_region[1];
	        	  userFavor03.innerText = clicked_region[2];
	        	  
	        	  let hidden1 = document.querySelector("input[name='userFavor01']"); 
	        	  let hidden2 = document.querySelector("input[name='userFavor02']"); 
	        	  let hidden3 = document.querySelector("input[name='userFavor03']"); 
	        	  
	        	  hidden1.value = clicked_region[0];
	        	  hidden2.value = clicked_region[1];
	        	  hidden3.value = clicked_region[2];
	        	  
				  let modal = document.querySelector("#modal");
				  modal.style.display = "none";
			      let tds = document.querySelectorAll("td");
			      Array.from(tds).map(item => item.classList.remove("clicked"));
			}
           });

		   

           
    </script>

</body>
</html>