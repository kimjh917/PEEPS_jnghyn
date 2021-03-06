<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<meta name="viewport" content="width=device-width, initial-scale=1">

<!--jquery 라이브러리 로드-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.css" />">

<style>
input[type="search"] {
   padding-left: 10px;
   float: left;
   height: 30px;
   border-radius: 30px;
   border-top-right-radius: 0;
   border-bottom-right-radius: 0;
   border: none;
   width: 200px;
}

nav ul li button {
   background-color: #EEF0ED;
   height: 30px;
   border: none;
   border-radius: 30px;
   border-top-left-radius: 0;
   border-bottom-left-radius: 0;
}

.container-fluid {
	height: 50px;
	text-align: center;
	width: 1100px;
	color: black;
	max-width: 100%;
}

#nav_wrap {
	width: 1150px;
	margin: 30px auto;
	text-align: center;
}

#my_nav {
	margin: auto;
}

.menuselect>button {
	width: 370px;
	height: 95px;
	font-size: 30px;
	border: none;
	outline: none;
}

.menuselect>button>img {
	width: 40px;
	height: 40px;
}

.jumbotron {
	height: 400px;
	width: 1150px;
	margin: 100px auto 0px auto;
	text-align: center;
	background-color: #F5E978;
	border-radius: 10px;
}

#profile_wrap>img {
	width: 200px;
	border-radius: 100%;
	margin-left: -750px;
	margin-top: 50px;
	border: 1px solid #CCC;
}

#pro_btn>ul>li {
	list-style: none;
	font-size: 30px;
	display: inline-block;
	text-align: center;
	margin-right: 40px;
}

#pro_btn {
	margin: -190px -300px 0px 0px;
}

#foll_btn {
	border: 0;
	background-color: #F5E978;
	cursor: default;
}

#pro_edit {
	border: solid 0.2px #CCC;
	background-color: white;
	border-radius: 5px;
	width: 200px;
	height: 35px;
	font-size: 20px;
	color: black;
	cursor: default;
}

#pro_edit>a {
	text-decoration: none;
}

#pro_name, #pro_bio {
	font-size: 25px;
	margin: 10px auto;
	width: 500px;
	text-align: left;
	word-break: break-all;
}

.paging {
	text-align: center;
	margin-bottom: 100px;
}

.paging>span {
	padding: 5px 10px;
	border-radius: 4px;
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	font-size: 1.2em;
	background-color: white;
}

#mapPageBtn {
	border: 0px solid;
	padding: 5px 10px;
	border-radius: 4px;
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	font-size: 1.2em;
	background-color: white;
	margin: 0px 5px;
}
#mapPageBtn:focus {
	outline: none;
	color: #F5E978;
}
.pgBtnColor {
	color: #F5E978;
}

.postidx {
	color: black;
}

.col-sm-4 {
	width: 383px;
}

.row {
	/* margin: auto;
	width: 1150px; */
}

.container {
	/* max-width: 100%; 
	height: auto; */
	width: 1150px;
}

.pageBtn:link {
	text-decoration: none;
	color: gray;
}
.pageBtn:visited {
	text-decoration: none;
	color: gray;
}
.pageBtn:active {
	text-decoration: none;
	color: gray;
}
.pageBtn:hover {
	text-decoration: none;
	color: gray;
}

#nowPgBtn {
	color: #F5E978;
}

#ptitle:link {
	text-decoration: none;
	color: white;
}
#ptitle:visited {
	text-decoration: none;
	color: white;
}
#ptitle:active {
	text-decoration: none;
	color: white;
}
#ptitle:hover {
	text-decoration: none;
	color: white;
}

.panel-primary {
  border-color: #DDD;
}

body {
	background-color: #fcf9f6;
	font-family: 'Nanum Gothic', sans-serif;
}

</style>
