<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Favicon-->
<!-- <link rel="icon" type="image/x-icon" href="assets/favicon.ico" /> -->
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
<link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

<!-- Navigation--> 
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
	<div class="container">
		<a class="navbar-brand" href="/">오늘의 도시락</a>
		<button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			Menu 
			<i class="fas fa-bars"></i>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ms-auto">
				<c:if test="${sessionScope.login == null}">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/loginView">로그인</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/registView">회원가입</a></li>
				</c:if>
				<c:if test="${sessionScope.login != null}">
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/mypage">${sessionScope.login.memId}님</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="${pageContext.request.contextPath}/logoutDo">로그아웃</a></li>
				</c:if>
<!-- 				<li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact"></a></li> -->
			</ul>
		</div>
	</div>
</nav>