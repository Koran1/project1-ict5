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
	#change_pw_form{width: 1300px; min-height: 1000px; margin: 0 auto;}
	input {width: 40%;  padding: 30px; margin-left: 20px;}
	button {width: 130px; height: 60px; margin-right: 100px; }
	#buttons{display: flex; justify-content: center; margin-top: 20px; }
	a {text-decoration: none; color: black}
	input[type="password"]{font-size: 45px;}
	i{font-size: 15px; font-weight: bold; margin-left: 20px;}
	.scLv{display: inline-block; width: 20px; border: 1px solid black; height: 13px; }
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
			<article><a href="/go_update">
				<img alt="" src="resources/images/update.png" style="float: left;">
				회원정보 수정
			</a></article>
			<article style="background-color: lightgray">
				<img alt="" src="resources/images/change_pw.png" style="float: left;">
				비밀번호 변경
			</article>
			<article><a href="/go_user_out">
				<img alt="" src="resources/images/member_out.png" style="float: left;">
				회원 탈퇴
			</a></article>
			</div>

		</section>
		
		<section id="flex_write">
			 <p id="title">비밀번호 변경</p>
			 <hr>
			 <p id="msg"> 변경할 비밀번호를 입력해 주세요.</p>
			 <form id="change_pw_form" method="post">
			 	<fieldset>
			 		<legend>비밀번호 변경</legend>
			 		<p id="changePw">새 비밀번호:  
			 		<input type="password" id="userPw"  name="userPw" required > <i id="pw_msg"></i></p>
			 		<p>비밀번호 확인:  <input type="password" id="confirmPw"  name="confirmPw" required > </p>
			 	</fieldset>
				 <div id="buttons">
					 <button type="button"  onclick="cancle(this.form)" >취소</button>
				 	 <button type="button" onclick="confirm(this.form)">변경</button>
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
			let userPw = document.querySelector("#userPw");
			let confirmPw = document.querySelector("#confirmPw");
			if ((userPw.value).length < 6 || (userPw.value).length > 16) {
				alert("입력조건을 만족하지 않습니다.");
			}else {
				if (userPw.value === confirmPw.value) {
					f.action = "/go_pw_change_ok";
					f.submit();
				}else {
					alert("입력정보가 일치하지 않습니다.");
				}
			}
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
<script type="text/javascript">
	function HaveKorean(value) {
		const korean = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		return korean.test(value);
	}

	function HaveLowEnglish(value) {
		const LowEnglish = /[a-z]/;
		return LowEnglish.test(value);
	}
	function HaveUpEnglish(value) {
		const UpEnglish = /[A-Z]/;
		return UpEnglish.test(value);
	}
	function HaveNumber(value) {
		const Number = /[0-9]/;
		return Number.test(value);
	}
	function HaveSpecial(value) {
		const Number = /[{}[\]\/?.,;:|)*~`!^\-_+<>@#$%&\\=\(\'\"]/;
		return Number.test(value);
	}
	
	let pw = document.querySelector("#userPw");
	pw.addEventListener("keyup", function() {
	let value = pw.value;
	let securityLv = 0;
	let msg = "";
	let pw_msg = document.querySelector("#pw_msg");
		if (HaveKorean(value) || value.length < 6 || value.length > 15 || value.includes(" ")) {
			 msg = "비밀번호는 공백을 제외한 알파벳 대/소문자를 포함한 6~15자여야 합니다.";
			pw_msg.innerText = msg;
			
		}else{
			securityLv++;
			if (HaveLowEnglish(value)) securityLv++;;
			if (HaveUpEnglish(value)) securityLv++;;
			if (HaveSpecial(value)) securityLv++;;
			if (value.length > 11)  securityLv++;;
			
			msg = "<i>보안수준:<i><span><span class='scLv'></span><span class='scLv'></span><span class='scLv'></span><span class='scLv'></span><span class='scLv'></span>";
			pw_msg.innerHTML = msg;
			
			let levels = document.querySelectorAll(".scLv");
			for (let i = 0; i < levels.length; i++) {
				if (i >= securityLv) {
					break;
				}else{
					if (securityLv == 1) levels[i].style.backgroundColor = "#FF0000";
					if (securityLv == 2) levels[i].style.backgroundColor = "#FFA500";
					if (securityLv == 3) levels[i].style.backgroundColor = "#FFFF00";
					if (securityLv == 4) levels[i].style.backgroundColor = "#008000";
					if (securityLv == 5) levels[i].style.backgroundColor = "#0000FF";
				}// 두번째 else
			}// for문
		}// 처음 else꺼
		
	
	});
</script>
</body>
</html>