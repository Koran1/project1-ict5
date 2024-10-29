<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#container{margin: 0px auto;}
	#logo{width: 200px; height: 70px; margin-bottom: 0px; display: block}
	#title{text-align: center; font-size: 60px; margin: 0px auto; margin-bottom: 0px;}
	#profile_container{text-align: center; position: relative; margin-top: 20px;}
	span{display: inline-block; font-size: 60px; position: relative; top: -30px;}
	#flex_container{display: flex;  text-align: center; justify-content: center; margin-top: 100px; height: 200px; }
	#flex1{width: 25%; border-right: 1px solid lightgray; }
	#flex2{width: 25%; border-right: 1px solid lightgray;}
	#flex3{width: 25%; border-right: 1px solid lightgray;}
	#flex4{width: 25%;}
	a {text-decoration: none; color: black}
	
</style>
</head>
<body>
<script type="text/javascript">
<c:if test="${result == '1'}">
	alert("회원정보 수정이 완료되었습니다.");
</c:if>
</script>
<div id="container">
	<a href="/go_main"><img id="logo" alt="" src="resources/project_images/logo.png"></a>
	<br>
	<p id="title">마이페이지</p>
	
	<div id="profile_container">
		<img id="profile" alt="" src="resources/project_images/profile.png">
		<span>홍길동님</span>
	</div>
	<hr>
	<div id="flex_container">
		
	
		<section class="flexbox" id="flex1"><a href="/go_identify?cmd=go_my_comment">
		<img alt="" src="resources/project_images/my_comment.png" style="float: left;">
			<p> 내 댓글 관리</p>
			<p>내 댓글을 확인하고, 삭제할 수 있습니다.</p>
		</a></section> 
		<section class="flexbox" id="flex2"><a href="/go_identify?cmd=go_update">
		<img alt="" src="resources/project_images/update.png" style="float: left;">
			<p>	회원정보 수정</p>
			<p>아이디, 관심지역 등 내 정보를 수정하세요.</p>
		</a></section>
		<section class="flexbox" id="flex3"><a href="/go_identify?cmd=go_pw_change">
		<img alt="" src="resources/project_images/change_pw.png" style="float: left;">
			<p>비밀번호 변경</p> 
			<p>주기적인 변경으로 내 정보를 보호하세요.</p>
		</a></section>
		<section class="flexbox" id="flex4"><a href="/go_identify?cmd=go_user_out">
		<img alt="" src="resources/project_images/member_out.png" style="float: left;">
			<p>회원탈퇴</p>
		</a></section>
	</div>
	</div>

	

</body>
</html>
