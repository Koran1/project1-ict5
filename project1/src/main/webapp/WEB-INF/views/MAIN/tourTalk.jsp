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
	background-color: lightgray;
	margin: 0 auto;
	justify-content: center;
	align-items: center;
}
#content{
	margin: 0 auto;
	justify-content: center;
	align-items: center;
	width: 90%;
	height: 100px;
}


</style>
<script type="text/javascript">
	function tourTalk_write() {
		location.href = "/tourTalk_write";
	}
</script>
</head>
<body>
	<div class="title">여행톡</div><br>
    <form action="/tourTalk_write_ok" method="post" enctype="multipart/form-data">
        <textarea id="content" name="content"></textarea>
        <input type="submit" value="등록">
    </form>

    <script>
        $(document).ready(function() {
            $("#content").summernote({
                lang: 'ko-KR',
                height: 300,
                placeholder: "최대 3000자까지 입력 가능합니다.",
                callbacks: {
                    onImageUpload: function(files) {
                        for (let i = 0; i < files.length; i++) {
                            uploadImage(files[i]);
                        }
                    }
                }
            });
        });

        function uploadImage(file) {
            let formData = new FormData();
            formData.append("file", file);
            $.ajax({
                url: "/saveImg",
                data: formData,
                method: "POST",
                contentType: false,
                processData: false,
                success: function(data) {
                    $('#content').summernote('insertImage', data.url);
                },
                error: function() {
                    alert("이미지 업로드 실패");
                }
            });
        }
    </script>
</body>
</html>