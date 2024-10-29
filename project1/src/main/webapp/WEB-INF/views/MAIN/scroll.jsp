<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>검색결과 페이지</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<link rel="stylesheet" href="resources/css/reset.css">
<style type="text/css">
/* 스크롤 탑 버튼 */
.scroll-top-btn {
	position: fixed;
	bottom: 20px;
	right: 20px;
	background-color: #deebe1;
	border: none;
	padding: 15px;
	border-radius: 50%;
	font-size: 30px;
	font-weight: bold;
	cursor: pointer;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	display: block;
}
</style>
</head>
<body>
	<button class="scroll-top-btn" id="scrollTopBtn" onclick="scrollToTop()">△</button>
	
	<script type="text/javascript">
		function handlePlaceholder(input, isFocused) {
			input.placeholder = isFocused ? '' : '지금 당신을 위한 여행지를 검색 해보세요';
		}

		function scrollToTop() {
			window.scrollTo({
				top : 0,
				behavior : 'smooth'
			});
		}
	</script>
</body>
</html>