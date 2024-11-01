<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>My travel list</title>
        <style type="text/css">
    header{ 
    	width: 100%;
    	position: fixed;
    	background-color: white;
    }
    </style>
    <link rel="canonical" href="https://getbootstrap.kr/docs/5.3/examples/headers/">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

  	<script src="/docs/5.3/assets/js/color-modes.js"></script>
  </head>
  <body>
	<main>
	  <header class="p-3 mb-3 border-bottom">
	    <div class="container">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/main" class="d-flex align-items-center mb-2 mb-lg-0 link-body-emphasis text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="HOME">
	          <img src="resources/images/logo.png" width="220"></svg>
	        </a>
	        
	        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search" action="/search_go" method="get" autocomplete="on">
	          <input type="search" class="form-control" placeholder="Travel search..." aria-label="Search" name="keyword" value="${keyword}">
	        </form>
	        
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	          <li><a href="/notice_go" class="nav-link px-2 link-body-emphasis"><b>Notice</b></a></li>
				<c:choose>
				 <c:when test="${empty userId}">
	          		<li><a href="/mem_login" class="nav-link px-2 link-body-emphasis"><b>Travel Plan</b></a></li>
				 </c:when>
				 <c:otherwise>
				   	<li><a href="/trvlPlan_go" class="nav-link px-2 link-body-emphasis"><b>Travel Plan</b></a></li>
				 </c:otherwise>
				</c:choose>
	        </ul>

	        <div class="dropdown text-end">
	          <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	            <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">
	          </a>
	          <ul class="dropdown-menu text-small">
	            <li><a class="dropdown-item" href="/mypage_go">My Page</a></li>
	            <li><hr class="dropdown-divider"></li>
	            <c:choose>
				 <c:when test="${empty userId}">
	            	<li><a class="dropdown-item" href="/mem_login">Sign in</a></li>
	             </c:when>
				 <c:otherwise>
				 	<li><a class="dropdown-item" href="/logout">Sign out</a></li>
				 </c:otherwise>
				</c:choose>
	          </ul>
	        </div>
	      </div>
	    </div>
	  </header>
	</main>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
