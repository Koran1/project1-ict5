<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="resources/js/test.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/test1.css" rel="stylesheet"/>
<style type="text/css">
	table, th, td{
		border: 1px solid black;
	}
</style>
</head>
<body>
	
	<h1>Main Page</h1>
	<p><a onclick="test1()">testing</a></p>
	<a href="/mem_mypage">myPage</a>
	<a href="/mytrvlplan">myPage</a>
	
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
	<button onclick="load()">클릭</button>


	<h2>날씨 정보 보기</h2>
	<div>
		<table id="list">
			<thead>
				<!-- <tr><th>날짜</th><th>최저기온 ℃</th><th>최고기온 ℃</th><th>SKY+PTY(날씨)</th><th>POP(강수확률)</th><th>pm10</th></tr> -->
				<tr><th>날짜</th><th>최저기온 ℃</th><th>최고기온 ℃</th><th>SKY+PTY(날씨)</th><th>POP(강수확률)</th><th>지역명</th></tr>
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
					/* tbody += "<tr>";
					tbody += "<td>" + obj.wthrDate +"</td>"
					tbody += "<td>" + obj.wthrTMin +"</td>"
					tbody += "<td>" + obj.wthrTMax +"</td>"
					tbody += "<td>" + obj.wthrSKY_PTY +"</td>"
					tbody += "<td>" + obj.wthrPOP +"</td>"
					tbody += "<td>" +"아직" +"</td>"
					tbody += "</tr>" */
					tbody += "<tr>";
					tbody += "<td>" + obj.date +"</td>"
					tbody += "<td>" + obj.tmn +"</td>"
					tbody += "<td>" + obj.tmx +"</td>"
					tbody += "<td>" + obj.sky +"</td>"
					tbody += "<td>" + obj.pop +"</td>"
					tbody += "<td>" + obj.resultMap2VO.name +"</td>"
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