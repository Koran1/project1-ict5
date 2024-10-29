<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
	<h3>region 14 경북</h3>
	
	<div id="region1">
		<select name="region" id="region">
			<option value="14" selected>경북</option>
		</select>
	</div>
	<h3>region 15 경남</h3>
	
	<script type="text/javascript">
		
		setInterval(()=>{
			timer1()
		},1000);
		
		function timer1() {
			$("#region1").empty()
			$.ajax({
				url : "/renew_main",
				method : "post",
				data : "region="+${region1},
				dataType: "json",
				success : function(data){
					let div = "";
					console.log(data);
					div += "<img src=" + data.placeImg01+">"
					div += "<p>" + data.trrsrtNm + "</p>"
					div += "<p>" + data.rdnmadr + "</p>"
					$("#region1").append(div);
					
				}, 
				error : function(){
					alert("가져오기 실패에요")
				}
			})
		}
		timer1();
	</script>
</body>
</html>