<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plan - list</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="resources/css/admin.css" rel="stylesheet"/>
<style type="text/css">

	
</style>
</head>
<body>	

	<div id="header">
        <a href="/index"><img id="logo" alt="logo" src="../resources/images/logo.png"></a>
        <h2>right side</h2>
    </div>

    <div id="container">
        <div id="button_container">
            <button onclick="location.href='/mytrvlplan'">나의 관심지 관리</button>
            <button onclick="location.href='/mytrvlplan_create'">여행 계획 짜기</button>
            <button style="color: red" onclick="location.href='/mytrvlplan_list'">여행 계획 관리</button>
        </div>

        <div id="main_container">
			
			<h2>i am detail</h2>
			<h2>create 랑 매우 유사할 예정</h2>
			<div id="container">
		<div id="button_container">
			<button onclick="location.href='/mytrvlplan'">나의 관심지 관리</button>
			<button style="color: red"
				onclick="location.href='/mytrvlplan_create'">여행 계획 짜기</button>
			<button onclick="location.href='/mytrvlplan_list'">여행 계획 관리</button>
		</div>

		<div id="main_container">
			<!-- Main Content -->
			<div id="main-content">
				<div id="travelplans">
					
				</div>

				<div id="map-content">
					<div id="map"></div>
				</div>
			</div>

			<!-- Bottom Bar -->
			<div id="bottom-bar">
				<button onclick="updatePlan()">수정</button>
				<button onclick="resetPlan()">취소</button>
			</div>
		</div>
	</div>
	</div>

</div>



</body>
</html>