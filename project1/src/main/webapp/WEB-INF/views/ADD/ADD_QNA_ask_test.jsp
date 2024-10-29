<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QNA - MyTravelList</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
	body{
		margin: 0;
		padding: 0;	
	}
	.qna-ask-table{
		width: 50%;
		margin: 50px auto;
		padding: 20px;
	}
	.note-btn-group{width: auto;}
	.note-toolbar{width: auto;}
</style>
</head>
<body>
	<div class="container">
		<div class="header-wrap">
    		<img alt="" src="<c:url value='/resources/images/logo.png' />"
				class="logo-img" style="width: 250px; height: 50px;"
				onclick="location.href='/'" />
			<p class="agreement-title" style="text-align: center;">공지사항</p>
			<hr color="008615">
		</div>
		
		<div class="qna-ask-container">
			<form action="/add_qna_ask_ok_test" method="get" name="qnaAskForm">
				<table class="qna-ask-table">
					<tbody>
						<tr>
							<td><label for="qnaSubject">제목</label></td>
							<td><input type="text" name="qnaSubject" size="20" required></td>
						</tr>
						
						<!-- DB에서 가져오기 -->
						<tr>
							<td><label for="userId">아이디</label></td>
							<td><input type="text" name="userId" size="20" required></td>
						</tr>
						
						<tr>
							<td><label for="qnaFile">첨부파일</label></td>
							<td><input type="file" name="qnaFile" size="20"></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<textarea name="qnaContent" id="qnaContent" required></textarea>
							</td>
						</tr>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="2">
								<input type="submit" value="저장" class="save_btn">
								<button type="button" class="cancel_btn" onclick="location.href='/add_qna';">취소</button>
							</td>
						</tr>
					</tfoot>
				</table>
			</form>	
		</div>
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js" ></script>
	<script src="resources/js/lang/summernote-ko-KR.js" ></script>
   	<script type="text/javascript">
    	$(function() {
        	$("#qnaContent").summernote({
            	lang : 'ko-KR',
            	height : 300,
            	focus : true,
            	placeholder : "최대 3000자까지 쓸 수 있습니다.",
            	callbacks : {
            		omImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
            	}
         	});
      	});
      
      	function sendImage(file, editer) {
    		// FormData 객체를 전송할 때, jQuery가 설정
			let frm  = new FormData();
        	frm.append("s_file", file); // 같은 이름 있으면 위로 증가시켜야 함
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
        			console(path);
        			console(fname);
        			$("#qnaContent").summernote("editor.insertImage", path+"/"+fname);
        		},
        		error : function() {
					alert("읽기 실패");
				}
			});
		}
	</script>
</body>
</html>