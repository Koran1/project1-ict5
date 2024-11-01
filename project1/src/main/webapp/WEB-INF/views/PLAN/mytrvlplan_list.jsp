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
	.image-grid {
	    display: grid;
	    grid-template-columns: repeat(3, 1fr);
	    gap: 20px;
	    margin-top: 10px;
	}
	
	.image-item {
	    text-align: center;
	    border: 2px solid pink;
	    border-radius: 8px;
	    padding: 5px;
	    width: 200px;
	    height: 200px;
	}
	
	/* Hide items with display: none smoothly */
	.image-item {
	    transition: opatest2 0.3s ease;
	}
	.image-item img{
		width: 80%;
		height: 80%;
	}
	
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
			
			
		    
			
		    <br><br>
		    <button id="unlike-item">관심해제</button>
		</div>

</div>



</body>
</html>