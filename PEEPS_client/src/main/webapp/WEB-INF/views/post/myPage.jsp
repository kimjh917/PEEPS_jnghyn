<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PEEPS</title>

</head>

<%@ include file="/WEB-INF/views/include/mypageBasicset.jsp"%> 


<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div id="main_wrap">
		<div class="jumbotron">
		<!-- 프로필 -->
			<div id="profile_wrap">
				<img src="<spring:url value='/resources/img/profilephoto.jpg'/>" style="width: 200px; height: 200px;">
				<div id="pro_btn">
				
				</div>
			</div>
		</div>
		
		<!-- 메뉴 -->
		<div id="nav_wrap">
			<div class="menuselect"> 
				

			</div>
		</div>

		<div class="container">
			<div class="row">
			<!-- 게시글 목록 시작 -->
				
			<!-- 게시글 목록 끝 -->	
			</div>
		</div>
		<br>

	</div>
	
	<!-- 페이징 -->
	<div class="paging">
	</div>
	
	
<script>

	// 뷰컨트롤러 통해 페이지 번호 받기
	function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var sessionInfo = "${peeps}";
	console.log("세션 정보 : ", sessionInfo);
	
    var p = getParameterByName('p');
    console.log("페이지 번호: ",p);
	
	var urlPath = location.pathname;
	console.log("URL 패스네임 : ", urlPath);
	var splitUrl = urlPath.split("/");
	var pathMemberId = splitUrl[2];
	console.log(splitUrl);
	console.log("패스멤버아이디",pathMemberId);
	
	if(pathMemberId == ""){
		pathMemberId = "jnghyn";
	}
	console.log("패스멤버아이디",pathMemberId);
	
	var menuHtml = '<button onclick="location.href=\'<c:url value="/'+pathMemberId+'"/>\'">';
	   menuHtml += '<img src="<c:url value="/resources/icon/006-newsfeed.png"/>"></button>';
	   menuHtml += '<button onclick="location.href=\'<c:url value="/'+pathMemberId+'/map"/>\'">';
	   menuHtml += '<img src="<c:url value="/resources/icon/018-location pin.png"/>"></button>';
	   menuHtml += '<button><img src="<c:url value="/resources/icon/017-friends.png"/>"></button>'; 
	   $('.menuselect').append(menuHtml);
	
	load_MyPage();
	
	function load_MyPage(){
		var html = '<input type="hidden" id="idx" value="'+${peeps.m_idx}+'">';
		$('#pro_btn').append(html);
		
		console.log("document.ready 안 : ", pathMemberId);
		var memberidx = $('#idx').val();
		console.log(memberidx);
		
		var pathmId = {
			"mId" : pathMemberId,
			"mIdx" : memberidx
 		};
		
		// post 리스트 정보 받아오기
		$.ajax({
			// 추후 aws 주소로 바꾸기
			url: 'http://localhost:8081/post/rest/list?p='+p,
			type: 'GET',
			data: pathmId,
			success: function(data){
				console.log("ajax로 받아온 데이터 : ", data);
				var list = $(data.postList);
				console.log(list);
				console.log("총 게시글 수 :", data.totalPostCount);
				var tpc = data.totalPostCount;
				
				// member 정보 받아오기
				$.ajax({
					url: '${pageContext.request.contextPath}/memberInfo',
					type: 'get',
					data: pathmId,
					success: function(data){
						
						var html = '<input type="hidden" id="idx" value="${peeps.m_idx}">';
					 	   html += '<ul><li>${peeps.id}</li>'; 
					 	   html += '<li><button id="pro_edit">';
					 	   html += '<a>프로필 편집</a></button></li>';
					 	   html += '</ul>';
					 	   html += '<ul>';
					 	   html += '<li>게시글</li><li>'+tpc+'</li>';
					 	   html += '<li>팔로워</li><li><button id="foll_btn">29</button></li><li>팔로잉</li><li><button id="foll_btn">121</button></li>';
					 	   html += '</ul>';
					 	   html += '<div id="pro_name">${peeps.name}</div>';
					 	   html += '<div id="pro_bio">${peeps.bio}</div>';
					 	$('#pro_btn').append(html);
					
					},
					error : function(request, status, error) {
						console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
					}
				});
				
				$.each(list, function(index, item){
					
					var date = item.p_date-540*60*1000;
						
					date = new Date(date).toLocaleDateString();
					
					console.log("날짜: ", date);
					
					var pt = item.p_title;
					
					/* 글자수 20자 이상이면 자르기 */
					if(pt.length > 20){
						pt = pt.substring(0, 15);
						pt = pt+"...";
						console.log(pt);
					} 
					
					var html = '<div class="col-sm-4">';
					   html += '<div class="panel panel-primary">';
					   html += '<div class="panel-heading">';  /* href="postNO=${post.p_idx}" */
					   /* html += '<a id="ptitle" class="postidx" href="<c:url value="/main/post/detail?idx='+item.p_idx+'"/>">'+item.p_title; */
					   html += '<a id="ptitle" class="postidx" href="<c:url value="/detail?idx='+item.p_idx+'"/>">'+pt;
					   html += '</a></div><div class="panel-body">';
					   html += '<a class="postidx" href="<c:url value="/detail?idx='+item.p_idx+'"/>">';
					   // 추후 aws 주소로 바꾸기
					   html += '<img src="<c:url value="http://localhost:8081/post/resources/fileupload/postfile/'+item.p_thumbnail+'"/>" class="img-responsive" style="width: 325px; height: 325px;" alt="Image"></a>';
					   html += '</div><div class="panel-footer">'+date+'</div></div></div>';
					   
					   $('.row').append(html);
				});
				// 페이징 처리
				 if (data.totalPostCount>0){
					 console.log('totalPageCount :' + data.totalPageCount);
					for(var i=1; i <= data.totalPageCount; i++){			
						if(data.pageNumber == i){
							/* var html2 =' <span><a class="pageBtn" id="nowPgBtn" href="<c:url value="/main/jhS2"/>?p='+i+'">'+i+'</a></span> '; */
							var html2 =' <span><a class="pageBtn" id="nowPgBtn" href="<c:url value="/'+pathMemberId+'"/>?p='+i+'">'+i+'</a></span> ';
							$('.paging').append(html2);
						} else {
							/* var html2 =' <span><a class="pageBtn" href="<c:url value="/main/jhS2"/>?p='+i+'">'+i+'</a></span> '; */
							var html2 =' <span><a class="pageBtn" href="<c:url value="/'+pathMemberId+'"/>?p='+i+'">'+i+'</a></span> ';
							$('.paging').append(html2);
						}
					}										 
				 };	
			},error : function(request, status, error) {
				console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
			}
			
		});
		
	};

	</script>
</body>
</html>
