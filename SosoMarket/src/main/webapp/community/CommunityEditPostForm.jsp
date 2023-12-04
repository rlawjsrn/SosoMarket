<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community Post Edit</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
.textareaSize {
	padding-top: 14px !important;
}
</style>
<link rel="stylesheet"
	href="resources/community-css/style-community.css?after">
</head>
<body>
	<jsp:include page="../resources/header.jsp" />

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
						<li class="active">게시글 수정/삭제</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /breadcrumb -->

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<c:if test="${not empty post}">
					<div class="post-detail-container">
						<form id="editForm" class="d-flex align-items-baseline">
							<input type="hidden" name="postId" value="${post.postId}">
							<label for="postTitle">제목:</label> <input type="text"
								id="postTitle" name="postTitle" value="${post.postTitle}"
								class="form-control" contenteditable="true"> <br> <br>
							<label for="postDetail">내용:</label>
							<textarea id="postDetail" name="postDetail"
								class="form-control textareaSize" oninput="autoSize(this)">${post.postDetail}</textarea>
							<br> <br>
							 <!-- <input type="submit" value="수정"
								class="primary-btn order-submit" onclick="submitForm()">
								 -->
							<input
								type="button" value="수정 " class="primary-btn order-submit"
								onclick="updatePost()">
							&nbsp;<a
								href="/SosoMarket/CommunityPostDetail.do?postId=${post.postId}"
								class="primary-btn order-submit">취소</a> &nbsp;<input
								type="button" value="삭제" class="primary-btn order-submit"
								onclick="deletePost()">
						</form>
					</div>

					<script>
						function autoSize(textarea) {
							$(textarea).css('height', '100px'); // Reset height to auto to correctly calculate scrollHeight
							$(textarea).height(textarea.scrollHeight);
						}

						// Call autoSize on page load
						$(document).ready(function() {
							autoSize("#postDetail");
						});

						// Call autoSize when typing
						$("#postDetail").on('input', function() {
							autoSize(this);
						});

						// Function to show the alert
						function showAlert(message) {
							alert(message);
						}
						
						//Update Post
						function updatePost() {
							var postTitle = encodeURIComponent($('#postTitle').val().trim());
							var postDetail = encodeURIComponent($('#postDetail').val().trim());
							
						    postTitle = decodeURIComponent(postTitle);
						    postDetail = decodeURIComponent(postDetail);

						    
							$.ajax({
										type : "POST",
										url : "/SosoMarket/CommunityPostUpdate.do?postId=${post.postId}", 
										data : {
											postTitle: postTitle, 
											postDetail: postDetail
										},
										success : function(response) {
											 if (response.trim().toLowerCase() === "success") {
											        showAlert("게시글이 성공적으로 수정되었습니다.");
											        window.location.href = "/SosoMarket/CommunityPostDetail.do?postId=${post.postId}";
											} else {
												alert('수정할 내용을 입력해주세요.');
												window.location.href = "/SosoMarket/CommunityEditPostForm.do?postId=${post.postId}";
											}
								        },
										error : function(error) {
											showAlert("게시글 수정이 실패하였습니다.");
											window.location.href = "/SosoMarket/CommunityPostDetail.do?postId=${post.postId}";
										}
									});

						}

						//Delete Post
						function deletePost() {
							if (confirm("정말로 삭제하시겠습니까?")) {
								$.ajax({
											type : "GET",
											url : "/SosoMarket/CommunityDeletePost.do?postId=${post.postId}", 
											success : function(response) {
												showAlert("게시글이 성공적으로 삭제되었습니다.");
												// Redirect to the post list page
												window.location.href = "/SosoMarket/CommunityPostList.do";
											},
											error : function(error) {
												showAlert("게시글 삭제가 실패하였습니다.");
												// Redirect to the post list page
												window.location.href = "/SosoMarket/CommunityPostList.do";
											}
										});
							}
						}
					</script>
				</c:if>

				<c:if test="${empty post}">
					<script>
						alert("일치하는 게시물이 없습니다.")
					</script>
					<!-- Post not found or does not exist. -->
				</c:if>
			</div>
		</div>
		<!-- /row -->
	</div>
	<!-- /container -->

	<jsp:include page="../resources/footer.html" />
</body>
</html>
