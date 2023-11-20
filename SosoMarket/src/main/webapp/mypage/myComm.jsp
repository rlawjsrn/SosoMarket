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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css2/tiny-slider.css?after" rel="stylesheet">
<link href="css2/style.css?after" rel="stylesheet">
<link rel="stylesheet" href="resources/css/style-community.css?after">
<style>
#tabCom1, #tabCom2 {
	display: none;
}
</style>
</head>
<body>

	<!-- nav 부트스트랩 -->
	<div class="container mb-5">
		<div class="section-title mb-5">
			<div class="section-nav">
				<ul class="section-tab-nav tab-nav">
					<li><a id="tab1" data-toggle="tab" onclick="ComEvent1()">나의
							작성글</a></li>
					<!-- class=active -->
					<li id="tab2"><a data-toggle="tab" onclick="ComEvent2()">나의
							댓글</a></li>
				</ul>
			</div>
		</div>
	</div>


	<div class="section" id="tabCom1">
		<div class="container">
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


	<script>
	/* 판매중 토글 */
	const ComEvent1 = (e) => {
		document.getElementById("tabCom1").style.display = "block";
		document.getElementById("tabCom2").style.display = "none";
	}
	/* 거래완료 토글 */
	const ComEvent2 = (e) => {
		document.getElementById("tabCom2").style.display = "block";
		document.getElementById("tabCom1").style.display = "none";
	}

	</script>
</body>
</html>