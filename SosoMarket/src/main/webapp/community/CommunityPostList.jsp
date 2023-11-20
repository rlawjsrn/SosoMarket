<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community</title>

<link rel="stylesheet" href="resources/css/style-community.css?after">
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script src="resources/js/script-community.js?after"></script>


</head>
<body>
	<jsp:include page="../resources/header.html" />
	
	<!-- breadcrumb -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h2 class="breadcrumb-header">회사 소식</h2>
					<ul class="breadcrumb-tree">
						<li><a href="#">소소마켓</a></li>
						<li class="active">회사 소식</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /breadcrumb -->

	<!-- section -->
	<div class="section">
		<div class="container">

			<div class="row">
				<div class="col-md-6">
					<div class="header-search">

						<!-- search form  -->
						<form action="CommunitySearch.do" method="post"
							class="d-flex align-items-baseline" id="searchForm">
							<select id="sortOption" name="sortOption" class="input-select">
								<option value="1">최신순</option>
								<option value="2">오래된순 </option>
								<option value="3">인기순</option>
							</select> <input type="text" id="search" name="search" class="input"
								placeholder="필요한 상품을 검색하세요!"> <input type="submit"
								value="검색" class="search-btn">
						</form>
						<!-- /search form  -->

					</div>
				</div>

				<div class=" text-right">
					<a href="/SosoMarket/CommunityCreatePost.do"
						class="primary-btn order-submit">글 쓰기 </a>
				</div>
			</div>

			<div  class="posts-container">
				<c:set var="totalPosts" value="${fn:length(posts)}" />

				
				<div>
					<span class="num"> 번호</span> <span class="title"> 게시글 제목 </span>
				</div>
				
				<c:forEach var="post" items="${posts}" varStatus="loopStatus">
					<c:set var="postOrderNumber"
						value="${totalPosts - loopStatus.index}" />
					<div class="encapsulate">
						<span class="post-order-number">${totalPosts - loopStatus.index}</span>

						<div class="post-container" data-post-id="${post.postId}">

							<div class="post-title">
								<a
									href="/SosoMarket/CommunityPostDetail.do?postId=${post.postId}">
									${post.postTitle} </a>
							</div>

							<!-- post-details -->
							<div class="post-details">
								<i class="fa fa-calendar light-text"></i> <span
									class="dark-text">${post.generationDate}&nbsp;&nbsp;</span> <i
									class="fa fa-user light-text"></i> <span class="dark-text">${post.memberId}&nbsp;&nbsp;</span>
								<i class="fa fa-eye light-text"></i> <span class="dark-text">${post.postViews}</span>
							</div>

							<!-- post-detail -->
							<div class="post-detail light-text">
								<c:out value="${post.postDetail}" />
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
	<!-- /section -->
	<jsp:include page="../resources/footer.html" />

	<script>
	// Get the input element and the posts container
    var searchInput = document.getElementById('search');

    // Add an event listener to the input field for real-time search
    $('#search').on('input', function () {
        var searchText = $(this).val().toLowerCase().trim();

        // Get all encapsulate divs
        var encapsulates = $('.encapsulate');

        // Loop through the encapsulate divs and hide/show based on search input
        encapsulates.each(function () {
            var postContainer = $(this).find('.post-container');
            var postTextContent = postContainer.text().toLowerCase();

            if (postTextContent.includes(searchText)) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    });

		$(document).ready(function () {
		    // Loop through each post-container
		    $('.post-container').each(function () {
		        var postDetail = $(this).find('.post-detail');
		        var postId = $(this).data('post-id');
		        var content = postDetail.html();

		        // Check if "Read more" link already exists
		        if (postDetail.find('.read-more-link').length === 0) {
		            // Truncate the content and append "Read more" link
		            postDetail.html(content.substring(0, 300) + '...  ' +
		                '<a href="/SosoMarket/CommunityPostDetail.do?postId=' +
		                postId + '" class="read-more-link">Read more</a>');
		        }
		    });
		});

		$(document)
				.ready(
						function() {
							$('.post-container')
									.click(
											function() {
												var postId = $(this).data(
														'post-id');
												window.location.href = '/SosoMarket/CommunityPostDetail.do?postId='
														+ postId;
											});
						});
	</script>
</body>
</html>


