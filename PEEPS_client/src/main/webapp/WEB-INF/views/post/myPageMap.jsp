<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
				
			</div>
		</div>
		
		<!-- 메뉴 -->
		<div id="nav_wrap">
			<div class="menuselect"> 

			</div>
		</div>

		<div class="container">
			<div id="map" style="width:100%;height:800px;margin-bottom: 50px;"></div>
			<div class="row">
			<!-- 게시글 목록 시작 -->
				
			<!-- 게시글 목록 끝 -->	
			</div>
		</div>
		<div class="locationInfoDiv"></div>
		<br>

	</div>
	
	<!-- 페이징 -->
	<div class="paging">
	</div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=84d2ab0cba961be165262c6b55a5fa3b&libraries=services"></script>
	
<script>

	// 뷰컨트롤러 통해 페이지 번호 받기
	function getParameterByName(name) {name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
	var regex = new RegExp("[\\?&]" + name+ "=([^&#]*)"), results = regex.exec(location.search);
	return results === null ? "": decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	var sessionInfo = "${peeps}";
	
    var p = getParameterByName('p');
	
	var urlPath = location.pathname;
	var splitUrl = urlPath.split("/");
	var pathMemberId = splitUrl[2];
	
	if(pathMemberId == ""){
		pathMemberId = "jnghyn";
	}
	
	var menuHtml = '<button onclick="location.href=\'<c:url value="/'+pathMemberId+'"/>\'">';
	   menuHtml += '<img src="<c:url value="/resources/icon/006-newsfeed.png"/>"></button>';
	   menuHtml += '<button onclick="location.href=\'<c:url value="/'+pathMemberId+'/map"/>\'">';
	   menuHtml += '<img src="<c:url value="/resources/icon/018-location pin.png"/>"></button>';
	   menuHtml += '<button><img src="<c:url value="/resources/icon/017-friends.png"/>"></button>'; 
	   $('.menuselect').append(menuHtml);
	
	load_userInfo();
	load_map();
	
	function load_userInfo(){
		// member 정보 받아오기
		$.ajax({
			url: '${pageContext.request.contextPath}/rest/mbrInfo',
			type: 'get',
			async : false,
			data: {"mId":pathMemberId},
			success: function(data){
				var html = '<img src="<spring:url value="/resources/img/'+data.m_photo+'"/>" style="width: 200px; height: 200px;">';
				   html += '<div id="pro_btn"><input type="hidden" id="idx" value="'+data.m_idx+'"></div>';
				$('#profile_wrap').append(html);
			},
			error : function(request, status, error) {
				console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
			}
		});
		
		var memberidx = $('#idx').val();
		
		var pathmId = {
			"mId" : pathMemberId,
			"mIdx" : memberidx
 		};
		
		// post 리스트 정보 받아오기
		$.ajax({
			url: 'http://52.79.234.178:8080/post/rest/list?p='+p,
			type: 'GET',
			data: pathmId,
			success: function(data){
				var list = $(data.postList);
				var tpc = data.totalPostCount;
				
				// member 정보 받아오기
				$.ajax({
					url: '${pageContext.request.contextPath}/rest/memberInfo',
					type: 'get',
					data: pathmId,
					success: function(data){
						
						var html = '<input type="hidden" id="idx" value="'+data.m_idx+'">';
					 	   html += '<ul><li>'+data.id+'</li>'; 
					 	   html += '<li><button id="pro_edit">';
					 	   html += '<a>프로필 편집</a></button></li>';
					 	   html += '</ul>';
					 	   html += '<ul>';
					 	   html += '<li>게시글</li><li>'+tpc+'</li>';
					 	   html += '<li>팔로워</li><li><button id="foll_btn">29</button></li><li>팔로잉</li><li><button id="foll_btn">121</button></li>';
					 	   html += '</ul>';
					 	   html += '<div id="pro_name">'+data.name+'</div>';
					 	   html += '<div id="pro_bio">'+data.bio+'</div>';
					 	$('#pro_btn').append(html);
					
					},
					error : function(request, status, error) {
						console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
					}
				});
				
			},error : function(request, status, error) {
				console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
			}
			
		});
		
	};
	
	function load_map(){
		
		$('#map').removeClass('displayNone');
		
		var memberidx = $('#idx').val();
		
		var pathmId = {
			"mId" : pathMemberId,
			"mIdx" : memberidx
		};
		
		$.ajax({
			url: 'http://52.79.234.178:8080/post/rest/map',
			type: 'GET',
			data: pathmId,
			success: function(data){

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			    mapOption = { 
			        center: new kakao.maps.LatLng(37.56978662634368, 126.9701165066571), // 지도의 중심좌표
			        level: 8 // 지도의 확대 레벨
			    };
				var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
				
				var imageSrc = '${pageContext.request.contextPath}/resources/icon/marker.png', // 마커이미지의 주소입니다    
				    imageSize = new kakao.maps.Size(54, 59), // 마커이미지의 크기입니다
				    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
				      
				// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
				    markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				 
				for (var i=0; i<data.length; i++){
					geocoder.addressSearch(data[i].p_loc, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK){
					    	// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
							    map: map, // 마커를 표시할 지도
							    position: new kakao.maps.LatLng(result[0].y, result[0].x), // 마커의 위치
							    clickable: true, // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
							    image: markerImage // 마커이미지 설정 
							});
								
							// 마커에 표시할 인포윈도우를 생성합니다 
							var infowindow = new kakao.maps.InfoWindow({
							    content: '<div>'+result[0].address_name+'</div>' // 인포윈도우에 표시할 내용
							});
								
							// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
							// 이벤트 리스너로는 클로저를 만들어 등록합니다 
							// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
							kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
							kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					    	 	
							// 마커에 클릭이벤트를 등록합니다
							kakao.maps.event.addListener(marker, 'click', function() {
							   var postAddr = result[0].address_name;
							   var mId = $('#memberId').text();
							          
							// 주소에 해당하는 게시글 모두 불러와야함
								markerClick(postAddr,0,5);
							    postloc = postAddr;
							});
					     }
					    
					});    
					
				}
				
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}
				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
				
			},
			error : function(request, status, error) {
				console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
			}
			
		}); // 지도 ajax 끝
		
	};
	
	// 지도 마커 클릭 함수 
	function markerClick(postAddr, sIdx, eIdx){
		
		$('#mapPageBtn').removeClass("pgBtnColor");
		
		var chk = $('.locationInfo').val();
		/* 직전에 누른 마커의 주소와 같은 주소인지 체크 */
		if(chk == postAddr){
			$('.row').empty();
		} else {
			$('.row').empty();
			$('.paging').empty();
			$('.locationInfoDiv').empty();
		}
		
		var memberidx = $('#idx').val();
		
		var pageNum = 1;
		locInfo = postAddr;
		
		var mapPostInfo = {
			"pathmemberid" : pathMemberId,
			"postAdd" : postAddr,
			"pageNum" : pageNum,
			"mIdx" : memberidx
		};
		
		$.ajax({
			url: "http://52.79.234.178:8080/post/rest/postmaplist",	
			type: 'post',
			data : mapPostInfo,
			success: function(data){
				
				var list = $(data);
				var ploc = list[0].p_loc;
				
				for(var i=sIdx; i<=eIdx; i++){
					
					var date = list[i].p_date-540*60*1000;
					date = new Date(date).toLocaleDateString();
					
					var pt = list[i].p_title;
					
					/* 글자수 20자 이상이면 자르기 */
					if(pt.length > 20){
						pt = pt.substring(0, 15);
						pt = pt+"...";
					} 
					
					var html = '<div class="col-sm-4">';
					   html += '<div class="panel panel-primary">';
					   html += '<div class="panel-heading">'; 
					   html += '<a id="ptitle" class="postidx" href="<c:url value="/detail?idx='+list[i].p_idx+'"/>">'+pt;
					   html += '</a></div><div class="panel-body">';
					   html += '<a class="postidx" href="<c:url value="/detail?idx='+list[i].p_idx+'"/>">';
					   html += '<img src="http://52.79.234.178:8080/post/resources/fileupload/postfile/'+list[i].p_thumbnail+'" class="img-responsive" style="width: 325px; height: 325px;" alt="Image"></a>';
					   html += '</div><div class="panel-footer">'+date+'</div></div></div>';
					   $('.row').append(html);
					
				}
					
				// 페이징 
				var lngth = list.length; // 전체 게시글 수
				var totalPageCnt = parseInt(lngth / 6);
				if(lngth%6 > 0){
					totalPageCnt += 1;
				}
				
				var startidx = 0;
				var endidx = 5;
				var remainPost = lngth%6;
				
				// 페이지가 없을 경우 추가
				if(totalPageCnt > 1 && chk != postAddr){
					
					var infoHtml = '<input type="hidden" class="locationInfo" value="'+list[0].p_loc+'">';
					$('.locationInfoDiv').append(infoHtml);
					
					var pHtml = '<div>';
					for(var i=0; i<totalPageCnt; i++){ 					
						
						var chkNum = totalPageCnt-1;
						if(i==chkNum){
							var lastIdx = startidx + remainPost -1;
							pHtml += '<span><input type="button" id="mapPageBtn" onclick="javascript:markerClick(\''+ploc+'\','+startidx+','+lastIdx+');" value="'+(i+1)+'"></span>';
						} else{
							pHtml += '<span><input type="button" id="mapPageBtn" class="pgBtnColor" onclick="javascript:markerClick(\''+ploc+'\','+startidx+','+endidx+');" value="'+(i+1)+'"></span>';
							startidx += 6;
							endidx += 6;
						}
					};
					pHtml += '</div>';
					$('.paging').append(pHtml);
					
				}; 
				
			},
			error: function(request, status, error) {
				console.log("지도로 게시글 검색하기 ajax에러");
				console.log("에러 발생 : code = " +request.status + "message =" + request.responseText + "error : " + error);
			}
			
		});
	} // makerClick 함수 끝
	
	

</script>
</body>
</html>
