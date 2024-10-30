<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
.content_box{
	width: 100%;
	height: 100px;
	border: 0.5px solid gray;
	background-color: #ddf7d8;
}
.content{
	width: 80%;
	height: 80%;
}


</style>
<script type="text/javascript">
	function tourTalk_write() {
		location.href = "/tourTalk_write";
	}
</script>
</head>
<body>
			<div class="tourTalk" id="tourTalk">
				<div class="title">여행톡</div>
				<div class="content_box">
					<div class="content" id="content">summernote</div>
					<c:choose>
						<c:when test="${empty userIdx}">
							<!-- <span>로그인 안했으면 로그인 버튼</span>
							<input type="button" value="로그인"> -->
						</c:when>
						<c:otherwise>
							<span>로그인 했으면 등록 버튼</span>					
							<input type="hidden" name="userIdx" value="${userIdx}">
							<input type="button" value="등록" onclick="tourTalk_write()">
						</c:otherwise>
					</c:choose>
				</div>
				<hr>
				<div class="note_list">
					${bvo.content}최신순으로 정렬하여 작성된 내용 보기
					<div>${list.userIdx} | ${list.tourTalkReg}</div>
				</div>
			</div>




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"
		crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js"></script>
	<script src="resources/js/lang/summernote-ko-KR.js"></script>
	<script type="text/javascript">
		$(function() {
			$("#content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "최대 3000자까지 쓸 수 있습니다.",
				callbacks : {
					onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
				}
			});
		});

		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , jQuery가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data : frm,
				method : "post",
				contentType : false,
				processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					console.log(path, fname);
					$("#content").summernote("editor.insertImage",
							path + "/" + fname);
				},
				error : function() {
					alert("읽기실패");
				}
			});
		}
	</script>
	<script type="text/javascript">
		function tourTalk_write_ok(f) {
			f.action = "/tourTalk_write_ok";
			f.submit();
		}
		function tourTalk_list(f) {
			location.href = "/tourTalk_list";
		}
	</script>
</body>
</html>