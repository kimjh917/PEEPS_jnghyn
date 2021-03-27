<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<link rel="stylesheet" href="<c:url value="/resources/css/nav.css" />">

<body>
	<nav>
		<ul class="icon">
			<li class="left"><span><input type="search" id="search" placeholder="검색">
					<button id="keyword" type="submit">
						<img src="<c:url value='/resources/icon/search.png'/>">
					</button></span></li>
	
			<li class="center"><a id="Logo" href="<c:url value="/jnghyn"/>"><img
					src="<c:url value='/resources/icon/Logo.png' />"></a></li>
	
			<li class="right"><a id="Home" href="<c:url value="/jnghyn"/>"><img
					src="<c:url value='/resources/icon/023-home.png' />"></a> <a
				id="Content" href="<c:url value="/upload"/>"><img
					src="<c:url value='/resources/icon/Content.png' />"></a> <a
				id="Alarm" ><img
					src="<c:url value='/resources/icon/008-notification.png' />"></a>
				<a id="Chat"><img
					src="<c:url value='/resources/icon/050-wechat.png'/>"></a> <a
				id="MyPage" href="<c:url value="/jnghyn"/>"><img style="width: 40px; height: 40px; border-radius: 20px;"
					src="<c:url value='/resources/img/profilephoto.jpg'/>"></a></li>
	
		</ul>
	</nav>
</body>

<script>

	$(document).on("click", "#keyword", function(){
		var keyword = $('#search').val();
		console.log(keyword);
		
		if (keyword.trim() == "") {
		  alert("한 글자 이상 입력하세요");
		} else {
			location.href = "${pageContext.request.contextPath}/search?keyword="+ encodeURI(encodeURIComponent(keyword));
			
		}; // else1 끝
		
	}); // document 끝

</script>

</html>