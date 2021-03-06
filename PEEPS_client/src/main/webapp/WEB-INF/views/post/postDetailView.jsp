<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PEEPS</title>
</head>

<%@ include file="/WEB-INF/views/include/postDetailBasicset.jsp"%>  

<body>
<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="post_wrap">
		<table class="post">
			<!-- 작성자 정보 -->
			<tr>
				<td class="post_top_wrap">
					<div class="post_top">
						
					</div>
				</td>
			</tr>
			<!-- 게시글 제목 -->
			<tr>
				<td>
					<div class="ptitle">
					</div>
				</td>
			</tr>
			<!-- 날짜, 수정 및 삭제 버튼 -->
			<tr>
				<td class="post_datenbutton">
					<span class="pdate">
					</span>
					<span class="deBtn">
					</span>
					
				</td>
			</tr>
			<!-- 게시물 사진 carousel -->
			<tr>
				<td>
					<!-- carousel 시작 -->
					<div class="postpics">
					</div>
					<!-- carousel 종료 -->
				</td>
			</tr>
			<!-- 게시글 내용 -->
			<tr>
				<td>
					<div class="content">
					</div>
				</td>
			</tr>
			<!-- 위치, 좋아요, 댓글 개수 -->
			<tr>
				<td>
					<div>
						<span class="locSpan">
						</span>
						
						<span class="rightside">
						
						<button type="button" class="likeBtn" onclick="javascript:clickLikeBtn();">
						</button>
						<!-- 좋아요 -->
						<span class="likes" style="margin: 0 5px;"></span>
						
						<img style="width: 30px; height: 30px;" src="<spring:url value='/resources/icon/cmtpic.png'/>">
						<!-- 댓글 개수 -->
						<span class="commentTotal" style="margin-left: 5px;"></span>
						</span>
					</div>
				</td>
			</tr>
			<!-- 댓글 입력창 -->
			<tr>
				<td>
				<div class="cmtdiv">
						
					<img class="postuserphoto" src="<c:url value="/resources/img/${peeps.m_photo}"/>"/>
											
					<span class="sessionmid">${peeps.id}</span>
					<span class="cmtinputarea">
					<textarea rows="10"
							  class="cmttxt" name="pcmt" id="cmttxt"
							  placeholder="댓글을 입력해주세요." required
					></textarea>
					<button class="cmtbtn">등록</button>
					</span>
				</div>
				</td>
			</tr>
			<tr>
				<td>
					<hr>
					<div class="comment">
					</div>
				</td>
			</tr>
		</table>
	</div>
	
	
</body>
</html>
