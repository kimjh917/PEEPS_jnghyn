<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>

<link rel="stylesheet"
	href="<c:url value="/resources/css/nav.css" />">
<body>
	<nav>
		<ul class="icon">
			<!--아이콘 경로 바꾸기 -->
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
		  
		}; // else1 끝
		
	}); // document 끝

</script>

</html>