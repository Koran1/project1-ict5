<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<button onclick="location.href ='/aaa'">날씨정보설정하기</button>
	

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
				<tr><th>날짜</th><th>최저기온 ℃</th><th>최고기온 ℃</th><th>SKY+PTY(날씨)</th><th>POP(강수확률)</th><th>pm10</th></tr>
			</thead>
			<tbody id="tbody">
				
			</tbody>
		</table>
	</div>
	
	<script type="text/javascript">
	let result =[];
	async function getWeather(){
		try{
			$("#tbody").empty();
			
			let data = await $.ajax({
				url : "/test01",
				method : "post",
				data : "region="+$("#region").val(),
				dataType : "xml"
			});
	
			let date = "";
			let tmn = "";
			let tmx = "";
			let sky_pty = "";
			let pop = "";
			let pm10 = "";
			
			let sky_val = "";
			let sky = "";
			result = [];
			
			let tbody = "";
			$(data).find("item").each(function(){
				if($(this).find("category").text() === "TMN"){
					 date = $(this).find("fcstDate").text().substring(0,4)+"-"
						+ $(this).find("fcstDate").text().substring(4,6)+"-"
						+ $(this).find("fcstDate").text().substring(6,8);
					 tmn = $(this).find("fcstValue").text();
				} else if($(this).find("fcstTime").text() === "1200"){
					if($(this).find("category").text() === "SKY"){
						sky_val = $(this).find("fcstValue").text();
						if(sky_val == "1") sky = "맑음";
						else if(sky_val == "3") sky = "구름많음";
						else if(sky_val == "4") sky = "흐림";
					}
					else if($(this).find("category").text() === "PTY"){
						let pty_val = $(this).find("fcstValue").text();
						if(pty_val == "0") sky_pty = sky;
						else if(pty_val == "1") sky_pty = sky +" (비)";
						else if(pty_val == "2") sky_pty = sky +" (비/눈)";
						else if(pty_val == "3") sky_pty = sky +" (눈)";
						else if(pty_val == "4") sky_pty = sky +" (소나기)";
					}
					else if($(this).find("category").text() === "POP"){
						pop = $(this).find("fcstValue").text();
					}
				} else if($(this).find("category").text() === "TMX"){
					tmx = $(this).find("fcstValue").text();
					tbody += "<tr>";
					tbody += "<td>" + date + "</td>";
					tbody += "<td>" + tmn + "</td>";
					tbody += "<td>" + tmx + "</td>";
					tbody += "<td>" + sky_pty + "</td>";
					tbody += "<td>" + pop + "</td>";
					tbody += "<td>" + pm10 + "</td></tr>";
					$("#tbody").append(tbody);
					tbody = "";
					result.push([date, tmn, tmx, sky_pty, pop, pm10]);
				} 
			});
			getWeatherLong()
			return result
		} catch{
				alert("가져오기가 실패했슈2");
		}
	}

	function getWeatherLong(){
		$.ajax({
			url : "/test02",
			method : "post",
			data : "region="+$("#region").val(),
			dataType : "xml",
			success : function(data) {
				let date = "";
				let tmn = "";
				let tmx = "";
				let sky_pty = "";
				let pop = "";
				let pm10 = "";
				
				let tbody = "";
				$(data).find("item").each(function(){
						for (let i = 3; i < 8; i++){
							let f_date = new Date();
							f_date.setDate(f_date.getDate() + (i));
							let date = f_date.toISOString().split('T')[0];
							
							tmn = $(this).find("taMin"+i).text();
							tmx = $(this).find("taMax"+i).text();
							sky_pty = $(this).find("wf"+i+"Pm").text();
							pop = $(this).find("rnSt"+i+"Pm").text();
							
							tbody +="<tr>";
							tbody += "<td>" + date + "</td>";
							tbody += "<td>" + tmn + ".0</td>";
							tbody += "<td>" + tmx + ".0</td>";
							tbody += "<td>" + sky_pty + "</td>";
							tbody += "<td>" + pop + "</td>";
							tbody += "<td>" +  +"</td>";
							tbody += "</tr>";
							
							result.push([date, tmn, tmx, sky_pty, pop, pm10]);
						}
						for (let i = 8; i < 11; i++){
							let f_date = new Date();
							f_date.setDate(f_date.getDate() + (i));
							let date = f_date.toISOString().split('T')[0];
							
							tmn = $(this).find("taMin"+i).text();
							tmx = $(this).find("taMax"+i).text();
							sky_pty = $(this).find("wf"+i).text();
							pop = $(this).find("rnSt"+i).text();
							
							tbody +="<tr>";
							tbody += "<td>" + date + "</td>";
							tbody += "<td>" + tmn + ".0</td>";
							tbody += "<td>" + tmx + ".0</td>";
							tbody += "<td>" + sky_pty + "</td>";
							tbody += "<td>" + pop + "</td>";
							tbody += "<td>" +  +"</td>";
							
							tbody += "</tr>";
							
							result.push([date, tmn, tmx, sky_pty, pop, pm10]);
						}
				});
				$("#tbody").append(tbody);
				
				return "11";
			},
			error : function() {
				alert("가져오기가 실패했슈2");
			}
		})
	}
	
	async function load(){
		let datas = await getWeather();
		console.log(datas)
	};
	
	</script>
</body>
</html>