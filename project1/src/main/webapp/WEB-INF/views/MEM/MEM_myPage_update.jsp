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
</style>
</head>
<body>
<div id="container">
		<section id="flex_left">
			<a href="/go_main"><img id="logo" alt="" src="resources/project_images/logo.png"></a>
			<p id="name">홍길동님</p>
			<div id="article_container">
			<article><a href="/go_my_comment">
				<img alt="" src="resources/project_images/my_comment.png" style="float: left;">
				내 댓글 관리
			</a></article>
			<article style="background-color: lightgray">
				<img alt="" src="resources/project_images/update.png" style="float: left;">
				회원정보 수정
			</article>
			<article><a href="go_pw_change">
				<img alt="" src="resources/project_images/change_pw.png" style="float: left;">
				비밀번호 변경
			</a></article>
			<article><a href="/go_user_out">
				<img alt="" src="resources/project_images/member_out.png" style="float: left;">
				회원 탈퇴
			</a></article>
			</div>

		</section>
			 
		<section id="flex_write">
			 <p id="title">회원정보 수정</p>
			 <hr>
			 <form  id="update_form">
				<fieldset>
					<legend>개인정보 수정</legend>
			 			
			 			<label for="userName">이름 <input type="text" name="userName" id="userName" value="${oneList.userName }이름"readonly> </label><br>
				 		<label for="userId">아이디 <input type="text" name="userId" id="userId" value="${oneList.userId }아이디" readonly></label><br>
			 			<label for="userMail">이메일 
			 				<input type="email" name="userMail"  id="userMail" value="${oneList.userMail }" 
			 					   pattern="[a-zA-Z0-9]+[@][a-zA-Z0-9]+[.]+[a-zA-Z]+[.]*[a-zA-Z]*" title="이메일 양식"  required>
			 			</label><br>
				 		<label for="userAddr">주소(시/군/구) 
				 			<input type="text" name="userAddr"  id="userAddr" value="${oneList.userAddr }" required>
				 		</label>
				 		<input type="button" onclick="sample6_execDaumPostcode()" value="주소 찾기"><br> 
			 			<label>내 관심지역
			 				<span id="userFavor01">1 ${oneList.userFavor01 } &nbsp; &nbsp;</span> 
			 				<span id="userFavor02">2 ${oneList.userFavor02 }  &nbsp; &nbsp;</span> 
			 				<span id="userFavor03">3 ${oneList.userFavor03 }  &nbsp; &nbsp;</span> 
			 				<input type="button" id="change_flavor" value="변경하기" onclick="changeFlavor()">
			 			</label>
				</fieldset>
				<input type="button"  id="btn_cancel" value="취소" onclick="goMyPage(this.form)">
				<input type="button" id="btn_update" value="수정" onclick="goUpdate(this.form)">
	<%-- 			<input type="hidden" name="userIdx" value="${oneList.userIdx }"> --%>
				<input type="hidden" name="userIdx" value="1">
			 </form>
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
				f.action = "/go_my_page";
				f.submit();
			}
           function goUpdate(f) {
        	   f.action = "/go_update_ok";
        	   f.submit();
		   }
           
			

		   

           
    </script>

</body>
</html>