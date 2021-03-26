<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PEEPS</title>
</head>

<!--  
위로 
-->

<!--jquery 라이브러리 로드-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.css" />">

<style>
.srchResultDiv {
	width: 600px;
	height: auto;
	margin: 60px auto;
	font-size: 26px;
	border: 1px solid #ddd;
	border-radius: 5px;
	background-color: white;
}

.srchResultDiv>div {
	padding: 7px 15px;
	border-bottom: 1px solid #ddd;
}

.writerInfo, .pdate {
	font-size: 18px;
}

.profilePhoto {
	margin-right: 10px;
}

.writerInfo>span {
	font-weight: bold;
}

.ptitle {
	color: black;
}

.ptitle:link {
	text-decoration: none;
}

.ptitle:visited{
	text-decoration: none;
}

.ptitle:active{
	text-decoration: none;
}

.ptitle:hover {
	text-decoration: none;
	cursor: pointer;
}

a:hover {
	text-decoration: none;
}

a {
	color: black;
}

#memberid {
	font-weight: bold;
}

.pdate {
	float: right;
	color: #999;
	margin-top: 4px;
}

#thumbnail {
	border: 0px solid;
	padding: 0px;
	line-height: 598px;
}

#thumbnail>a>img {
	width: 598px;
	height: 598px;
	vertical-align: middle;
}

.scrollToTop {
	border: none;
	background-color: #fcf9f6;
}

.scrollToTop>img {
	width: 40px;
	height: 40px;
	position: fixed;
	right: 100px;
	bottom: 50px;
}

#no_post {
	margin: 150px auto;
	font-size: 30px;
	text-align: center;
	width: 600px;
	height: 600px;
}

body {
	background-color: #fcf9f6;
	font-family: 'Nanum Gothic', sans-serif;
	padding: 90px;
}
</style>

<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="totalWrap">
	
	</div>
	
	<button class="scrollToTop"><img src="<c:url value="/resources/icon/up.png"/>"></button>
	
</body>

<script type="text/javascript">
	//버튼 클릭 시 맨 위로 스크롤
	$(document).on("click", ".scrollToTop", function(){
		$('html, body').animate({scrollTop : 0},800);
		return false;
	});
</script>

</html>