<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지-본인인증</title>
<style type="text/css">
	#container{display: flex;}
	#flex_left{width: 15%;  background-color: Whitesmoke;}
	#flex_write{width: 85%;}
	#logo{width: 200px; height: 70px;} 
	#name{font-size: 50px; font-weight: bold;}
	#article_container{display: flex; flex-direction: column;}
	article{font-size: 30px; padding: 20px; margin: 10px;}
	#title{font-size: 50px; margin-left: 20px;}
	#msg{text-align: center;}
	#check_pw_form{width: 1000px; min-height: 1000px; margin: 0 auto;}
	input {width: 70%;  padding: 30px; margin-left: 20px;}
	button {width: 130px; height: 60px; margin-right: 100px; }
	#buttons{display: flex; justify-content: center; margin-top: 20px; }
</style>
</head>
<body>
	<div id="container">
		<section id="flex_left">
			<a href="/go_main"><img id="logo" alt="" src="resources/images/logo.png"></a>
			<p id="name">홍길동님</p>
			<div id="article_container">
			<article>
				<img alt="" src="resources/images/my_comment.png" style="float: left;">
				내 댓글 관리
			</article>
			<article>
				<img alt="" src="resources/images/update.png" style="float: left;">
				회원정보 수정
			</article>
			<article>
				<img alt="" src="resources/images/change_pw.png" style="float: left;">
				비밀번호 변경
			</article>
			<article>
				<img alt="" src="resources/images/member_out.png" style="float: left;">
				회원 탈퇴
			</article>
			</div>

		</section>				
		
		<section id="flex_write">
			 <p id="title">비밀번호 인증</p>
			 <hr>
			 <p id="msg"> 보안을 위해 본인 확인을 요청합니다. 인증을 완료해야 다음 단계로 진행할 수 있습니다.</p>
			 <form id="check_pw_form" method="post">
			 	<fieldset>
			 		<legend>비밀번호 확인</legend>
			 		<p>아이디 <input type="text"  name="userId" value="${userId}" readonly> </p>
			 		<p>비밀번호 <input type="password" id="userPw"  name="userPw" required> </p>
			 	</fieldset>
				 <div id="buttons">
					 <button  onclick="cancle(this.form)" >취소</button>
				 	 <button  onclick="confirm(this.form)">확인</button>
				 </div>
			 </form>
		</section>				
	</div>
	
	<script type="text/javascript">
		function cancle(f) {
			f.action = "/go_my_page" ;
			f.submit();
		}
		
		function confirm(f) {
			f.action = "/go_pw_chk?cmd=${cmd}";
			f.submit();
		}
			
	</script>
<script type="text/javascript">
	<c:if test="${pwChk == false}">
		alert("비밀번호가 일치하지 않습니다.");
		let pw = document.querySelector("#userPw");
		pw.value = "";
		pw.focus();
	</c:if>
</script>
</body>
</html>