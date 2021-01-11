<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Azenta Template">
<meta name="keywords" content="Azenta, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>GOTO</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/elegant-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/jquery-ui.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/owl.carousel.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/magnific-popup.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/slicknav.min.css"
	type="text/css">
<link rel="stylesheet" href="resources/css/style.css" type="text/css">
<style type="text/css">
table, th, td {
	text-align: center;
}

#grid {
	display: grid;
	grid-template-columns: 230px 1fr;
	height: inherit;
}

.property-sidebar {
	display: inline;
	text-align: center;
	display: block;
	padding: 50px;
}

.sidenav {
	height: 100%;
	width: 230px;
	/*   position: fixed; */
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	padding-top: 20px;
}

.sidenav a {
	padding: 6px 8px 6px 16px;
	text-decoration: none;
	font-size: 20px;
	color: #818181;
	display: block;
}

.sidenav a:hover, h5 {
	color: #f1f1f1;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

.sidenavTop {
	height: 100px;
	text-align: center;
	padding: 10px;
}

h5 {
	margin: 10px 0;
}
.sidenav .sideActive{
	color: #f1f1f1;
}
</style>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	
	<div id="grid">
	<!-- 사이드바 시작 -->
		<div class="sidenav">
			<div class="sidenavTop">
				<h5>${sessionScope.ALoginId }님</h5>
				<a href="/" class="property-sub">로그아웃</a>
			</div>
			<c:choose>
				<c:when test="${sessionScope.ALoginId=='ADMIN' }">
				</c:when>
				<c:otherwise>
					<a href="a_memberList" id="a_memberList">회원리스트</a> 
					<a href="#services">업체리스트</a> 
					<a href="a_approveJoin" id="a_approveJoin">업체 회원가입 승인</a> 
					<a href="#clients">맛집등록</a> 
					<a href="#about">맛집리스트</a> 
					<a href="#contact">관광지등록</a> 
					<a href="#about">관광지리스트</a> 
					<a href="#contact">1대1문의 리스트</a> 
					<a href="#about">고객 후기리스트</a> 
					<a href="#about">자주묻는질문 리스트</a>
					
					<a href="a_companySales">업체 매출 현황</a> 
					<a href="#about">호텔등록</a> 
					<a href="a_hotelList" id="a_hotelList">호텔리스트</a>
					<a href="#clients">룸등록</a> 
					<a href="#contact">룸리스트</a> 
					<a href="#contact">업체정보수정</a>
				</c:otherwise> 
			</c:choose>
		</div>
		<!-- 사이드바 끝 -->