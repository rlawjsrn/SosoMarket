<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style> 
.textareaSize{ 
	padding-top: 14px !important;
}
</style>
</head>

<body>
	<%
	String memberId = null;
	if (session.getAttribute("memberId") != null) {
		memberId = (String) session.getAttribute("memberId");
	}

	if (memberId != null) {
	%>
	<script>
		// No additional script content in this section
	</script>
	<%
}
%>
	<jsp:include page="../resources/header.jsp" />

	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header">게시글 등록하기</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">소소마켓</a></li>
						<li class="active">게시글 등록</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<form action="/SosoMarket/CommunityCreatePost.do" method="post"
						class="d-flex align-items-baseline">
						<label for="postTitle">제목:</label> <input type="text"
							id="postTitle" name="postTitle" class="form-control"
							placeholder="게시글 제목을 입력해주세요." required> <br> <br>
						<label for="postDetail">내용:</label>
						<textarea id="postDetail" name="postDetail" class="form-control textareaSize"
							placeholder="게시글 내용을 입력해주세요." required></textarea>
						<br> <br> <input type="submit" value="게시글 등록"
							class="primary-btn order-submit"> &nbsp;<a
							href="/SosoMarket/CommunityPostList.do"
							class="primary-btn order-submit">뒤로 가기</a>
					</form>

					<script>
						/*  // Autosize the textarea while typing 
						 function autoSize(textarea) {
						     textarea.style.height = 'auto'; // Reset height to auto to correctly calculate scrollHeight
						     textarea.style.height = (textarea.scrollHeight) + 'px'; // Set the height to the scrollHeight of the content
						 }

						 // Call autoSize on page load
						 $(document).ready(function () {
						     autoSize(document.getElementById("postDetail"));
						 });

						 // Call autoSize when typing
						 $("#postDetail").on('input', function () {
						     autoSize(this);
						 });
						 */
						 
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

						function showAlert(message) {
							alert(message);
						}

						$(document).ready(function() {
							$("form").submit(function(event) {
								event.preventDefault();
								createPost();
							});
						});

						function createPost() {
							$
									.ajax({
										type : "POST",
										url : "/SosoMarket/CommunityCreatePost.do",
										data : $("form").serialize(),
										success : function(response) {
											if (response === "success") {
												showAlert("게시글이 성공적으로 등록되었습니다.");
												// Redirect to the post list page
												window.location.href = "/SosoMarket/CommunityPostList.do";
											} else {
												showAlert("게시글 등록이 실패하였습니다. 로그인 해주세요!");
												window.location.href = "/SosoMarket/LoginMove.do";
											}
										},
										error : function(error) {
											showAlert("게시글 등록이 실패하였습니다. 다시 시도해주세요.");
										}
									});
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<!-- /SECTION -->

	<jsp:include page="../resources/footer.html" />
</body>
</html>
