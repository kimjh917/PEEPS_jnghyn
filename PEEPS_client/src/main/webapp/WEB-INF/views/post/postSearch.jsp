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
	
	var keyword = "${PostKeyword}";
	
	$.ajax({
		// aws로 바꾸기
		  url : 'http://localhost:8081/post/rest/searchPost',
		  type: 'post',
		  data : {
			"keyword" : keyword
		  },
		  success : function(data){
		  	console.log("게시글 검색 결과 : ",data);
			
			$('.totalWrap').empty();
				
			if(data.length == 0){
				$('.totalWrap').append("<div id='no_post'>해당하는 게시물이 없습니다.</div>");
			} else {
				$.each(data, function(index, post){
						
					var date = post.p_date-540*60*1000;
								
					date = new Date(date).toLocaleDateString();
							
					console.log("날짜: ", date);
							
					var pt = post.p_title;
							
					/* 글자수 15자 이상이면 자르기 */
					if(pt.length > 15){
						pt = pt.substring(0, 10);
						pt = pt+"...";
						console.log(pt);
					} 
					
					// member ajax
					$.ajax({
						url: '${pageContext.request.contextPath}/rest/memberList',
						type: 'get',
						success: function(data){
							
							console.log("회원정보 : ",data);
							
							$.each(data, function(index, mbr){
								if(post.member_idx == mbr.m_idx){
									console.log("멤버인덱스와 게시글멤버인덱스 일치 : ", mbr.m_idx);
						
									var html = '<div class="srchResultDiv">';
									   html += '<div class="writerInfo"><a href="<c:url value="/'+mbr.id+'"/>">';
									   html += '<span class="profilePhoto">';
									   html += '<img src="<c:url value="/resources/img/'+mbr.m_photo+'"/>" style="width: 40px; height: 40px; border-radius: 20px;">';
									   html += '</span>';
									   html += '<span id="memberid">'+mbr.id+'</span>';
									   html += '</a></div>';
									   html += '<div><a href="<c:url value="/detail?idx='+post.p_idx+'"/>"><span class="ptitle">'+pt+'</span></a>';
									   html +='<span class="pdate">'+date+'</span></div>';
									   html += '<div id="thumbnail"> ';
									   // aws 주소로 변경
									   html += '<a href="<c:url value="/detail?idx='+post.p_idx+'"/>"><img src="<c:url value="http://localhost:8081/post/resources/fileupload/postfile/'+post.p_thumbnail+'"/>">';
									   html += '</a></div></div>';
									$('.totalWrap').append(html);
								}
							}) // member each 끝
							
						},
						error: function(e){
							console.log("회원 정보 불러오기 실패");
						}
					}); // member ajax 끝
					
				}) // post each끝 
			} // else2 끝
		},
		error : function(e) {
			console.log("게시글 리스트 실패");
		}
		  
	  }); // post ajax 끝
</script>

</html>