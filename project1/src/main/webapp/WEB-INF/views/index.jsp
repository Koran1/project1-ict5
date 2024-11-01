<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<style type="text/css">
	table, th, td{
		border: 1px solid black;
		border-collapse: collapse;
	}
	th, td{
		text-align: center;
		padding: 5px 10px;
	}
	
</style>
<body>
	<h1>index page</h1>
	<h3><a href="/main_go">MAIN123</a></h3>
	<h3><a href="/mytrvlplan">여행관리</a></h3>
	<h3><a href="/administrator">ADMIN</a></h3>
	<h3><a href="/mem_login">로그인</a></h3>
	<h3><a href="/add_notice">공지사항</a></h3>
	
	<hr>
	<h3>날씨 정보 보기</h3>
	<select name="region" id="region">
		<option value="1" selected>서울</option>
		<option value="2">부산</option>
		<option value="3">대구</option>
		<option value="4">인천</option>
		<option value="5">광주</option>
		<option value="6">대전</option>
		<option value="7">울산</option>
		<option value="8">경기</option>
		<option value="9">강원</option>
		<option value="10">충북</option>
		<option value="11">충남</option>
		<option value="12">전북</option>
		<option value="13">전남</option>
		<option value="14">경북</option>
		<option value="15">경남</option>
		<option value="16">제주</option>
	</select>
	<button onclick="load()">지역 선택</button>
	
	<div>
		<table id="list">
			<thead>
				<tr><th>날짜</th><th>최저기온 ℃</th><th>최고기온 ℃</th><th>SKY+PTY(날씨)</th><th>POP(강수확률)</th><th>pm10</th></tr>
			</thead>
			<tbody id="tbody">
				
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
	function load(){
		$("#tbody").empty();
		$.ajax({
			url : "/test01",
			method : "post",
			data : "region="+$("#region").val(),
			dataType : "json",
			success : function(data){
				let tbody = "";
				$.each(data, function(index, obj){
					tbody += "<tr>";
					tbody += "<td>" + obj.wthrDate +"</td>"
					tbody += "<td>" + obj.wthrTMin +"</td>"
					tbody += "<td>" + obj.wthrTMax +"</td>"
					tbody += "<td>" + obj.wthrSKY_PTY +"</td>"
					tbody += "<td>" + obj.wthrPOP +"</td>"
					tbody += "<td>" +"아직" +"</td>"
					tbody += "</tr>"
				});
				$("#tbody").append(tbody);
			},
			error : function(){
				alert("가져오기 실패에요")
			}
		})
	}
	
	
	</script>
</body>
</html>