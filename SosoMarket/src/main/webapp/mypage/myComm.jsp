<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 css -->
<link href="css2/bootstrap.min.css?after" rel="stylesheet">
<link href="css2/tiny-slider.css?after" rel="stylesheet">
<link href="css2/style.css?after" rel="stylesheet">
<link rel="stylesheet" href="resources/community-css/style-community.css?after">
<style>

</style>
</head>
<body>

	<div class="section" id="tabCom1">
		<div class="">
			<div class="posts-container">
				<div>
					<span class="num"> 번호</span> <span class="title"> 게시글 제목 </span>
				</div>
				<% int count = 1; %>
				<c:forEach var="vo" items="${list }">
					<div class="encapsulate">
						<span class="post-order-number"><%=count++ %></span>

						<div class="post-container" data-post-id="${vo.postId }">

							<div class="post-title">
								<a href="/SosoMarket/CommunityPostDetail.do?postId=${vo.postId}">
									${vo.postTitle} </a>
							</div>

							<!-- post-details -->
							<div class="post-details">
								<i class="fa fa-calendar light-text"></i> <span
									class="dark-text">${vo.generationDate}&nbsp;&nbsp;</span> <i
									class="fa fa-user light-text"></i> <span class="dark-text">${vo.memberId}&nbsp;&nbsp;</span>
								<i class="fa fa-eye light-text"></i> <span class="dark-text">${vo.postViews}</span>
							</div>

							<!-- post-detail -->
							<div class="post-detail light-text">
								<c:out value="${vo.postDetail}" />
							</div>

							<!-- /post-container -->
						</div>
					</div>
				</c:forEach>

				<!-- /posts-container -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>

</body>
</html>