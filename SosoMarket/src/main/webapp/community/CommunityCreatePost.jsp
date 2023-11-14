<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Post</title>
</head>


<body>
	<jsp:include page="../resources/header.html" />
	<!-- BREADCRUMB -->
	<div id="breadcrumb" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<h3 class="breadcrumb-header"> 게시글 등록하기</h3>
					<ul class="breadcrumb-tree">
						<li><a href="#">소소마켓</a></li>
						<li class="active">게시글 등록</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /BREADCRUMB -->

	<!-- SECTION -->
	<div class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-7">


					<form action="/SosoMarket/CommunityCreatePost.do"
						method="post" class="d-flex align-items-baseline">
						<label for="postTitle">제목:</label>
						 <input type="text"
							id="postTitle" name="postTitle"  class="input" placeholder="게시글 제목을 입력해주세요. " required> 
						<br>
						<br>
						 <label for="postDetail">내용:</label>
						<textarea id="postDetail" name="postDetail"  class="input" placeholder="게시글 내용을 입력해주세요." required></textarea>
						<br>
						<br>
						 <input type="submit" value="게시글 등록 " class="primary-btn order-submit">&nbsp;<a href="/SosoMarket/CommunityPostList.do" class="primary-btn order-submit">뒤로 가기 </a>
					</form>
					
					
			
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->
	<jsp:include page="../resources/footer.html" />

</body>
</html>
