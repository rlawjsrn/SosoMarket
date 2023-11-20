<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Community Post Detail</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
.section-divider {
	border-top: 1px solid #555;
	margin: 10px 0;
}

.center {
	display: relative;
	justify-content: center;
	align-items: center;
	overflow: hidden;
}

.post-image {
	width: 150px;
	height: 150px;
	position: relative;
	top: -100%;
	left: 45%;
	transform: translateX(-50%);
	animation: slideUp 2s ease-in-out forwards;
}

  @keyframes slideUp {
    0% {
        transform: translateY(100%);
    }
    100% {
        transform: translateY(0);
    }
  }
  
.post-info {
	margin-top: 10px;
	margin-bottom: 10px;
}

.det {
	margin-top: 10px;
	margin-bottom: 10px;
}

.post-detail-container {
	border: 1px solid #ddd;
	border-radius: 8px;
	padding: 10px;
	margin-bottom: 15px;
	transition: box-shadow 0.3s;
	display: flex;
	flex-direction: column;
}

.post-detail-container:hover {
	box-shadow: 0 0 10px #4880B8;
}

.encapsulate-detail {
    display: flex;
    align-items: center;
}

.post-detail-title {
    margin-top: 25px;
    flex: 1; /* Take up remaining space */
}

.post-detail-container a.edit-icon {
    color: #4880B8;
    font-size: 20px !important; /* Adjust the size as needed */
    margin-left: 10px; /* Add some margin for spacing */
}

.comment-container {
        margin-top: 50px;
    }

    .comment-input {
        flex: 1;
        margin-right: 10px;
    }

    .comment-btn {
        min-width: 80px;
    }

    .comment-item {
        border-top: 1px solid #ddd;
        padding: 10px;
    }

    .comment-item img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-right: 10px;
    }

    .comment-text {
        text-justify: justify;
    }

    .user-feed {
        margin-top: 10px;
    }

    .wish, .ml-3 {
        margin-right: 15px;
    }
</style>
<link rel="stylesheet" href="resources/css/style-community.css?after">

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
            <li class="active">게시글 상세 페이지</li>
          </ul>
        </div>
      </div>
      <!-- /row -->
    </div>
    <!-- /container -->
  </div>
  <!-- /breadcrumb -->

  <!-- 	<div class="section">
 -->
  <div class="center">
    <img src="resources/img/cat.png" alt="Cat Image" class="post-image">
  </div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <c:if test="${not empty post}">
          <div class="post-detail-container">
          <div class="encapsulate-detail">
          			<h3 class="post-detail-title">&nbsp;${post.postTitle}</h3>
          			  <c:if test="${memberId eq post.memberId}">
                                <a class="fa fa-edit edit-icon text-right" href="/SosoMarket/CommunityEditPostForm.do?postId=${post.postId}"></a>
                            </c:if>
<%--            			<a class="fa fa-edit edit-icon text-right"  href="/SosoMarket/CommunityEditPostForm.do?postId=${post.postId}"></a>
 --%>          	</div>
            <hr class="section-divider">
            <div class="post-info">
              <p>
                <i class="fa fa-calendar"></i> ${post.generationDate}
              </p>
              <p>
                <i class="fa fa-user"></i> ${post.memberId}
              </p>
              <p>
                <i class="fa fa-eye"></i> ${post.postViews} Views
              </p>
            </div>
            <hr class="section-divider">
            <p class="det">${post.postDetail}</p>
          </div>
        </c:if>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
  <!-- </div> -->
  <!-- /section -->
  
   <!-- Comment Container -->
    <div class="container mt-5 mb-5 comment-container">
        <div class="row height d-flex justify-content-center align-items-center">
            <div class="col-md-7">
                <div class="card">
                    <div class="p-3">
                        <h6>Comments</h6>
                    </div>

                    <!-- Comment input -->
                    <div class="mt-3 d-flex flex-row align-items-center p-3 form-color">
                       <!--  <img src="https://i.imgur.com/zQZSWrt.jpg" width="50" class="rounded-circle mr-2"> -->
                        <input type="text" class="form-control comment-input" id="commentText" placeholder="Enter your comment...">
                        <button type="button" class="btn btn-primary comment-btn" onclick="submitComment()">게시</button>
                    </div>

                    <!-- Existing comments -->
                    <c:forEach var="comment" items="${comments}">
                        <div class="mt-2 comment-item">
                            <div class="d-flex flex-row p-3">
                                <img src="https://i.imgur.com/zQZSWrt.jpg" width="40" height="40" class="rounded-circle mr-3">
                                <div class="w-100">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div class="d-flex flex-row align-items-center">
                                            <span class="mr-2">${comment.memberId}</span>
                                        </div>
                                        <small>${comment.generationDate}</small>
                                    </div>
                                    <p class="text-justify comment-text mb-0">${comment.commentDetail}</p>
                                    <div class="d-flex flex-row user-feed">
                                        <span class="ml-3"><i class="fa fa-comments-o mr-2"></i>Reply</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
  
  
  

  <!-- Assuming you have a container to display the content -->
  <div class="community-post-content-container"></div>

  <script>
  // Function to submit a comment
  function submitComment() {
      var commentText = $('#commentText').val();
      if (commentText.trim() !== '') {
          // Your logic to submit the comment using AJAX
          // Update the comment section dynamically
          updateCommentSection();
      }
  }

  // Function to update the comment section
  function updateCommentSection() {
      var commentSectionUrl = '/SosoMarket/GetCommentsServlet'; // Adjust the URL as needed

      // AJAX call to GetCommentsServlet
      $.ajax({
          url: commentSectionUrl,
          method: 'GET',
          success: function (data) {
              // Update the content of the comment section with the response
              $('.comment-container').html(data);
          },
          error: function (error) {
              console.error('Error:', error);
          }
      });
  }

  // Initial call to populate the comment section when the page loads
  $(document).ready(function () {
      updateCommentSection();
  });
    // AJAX call when the page loads
    $(document).ready(function() {
      var communityPostContentUrl = '/SosoMarket/CommunityPostContent.do'; // Adjust the URL as needed

      // AJAX call to CommunityPostContent.do
      $.ajax({
        url: communityPostContentUrl,
        method: 'GET', // Assuming you want to retrieve data
        success: function(data) {
          // Update the content of a specific element with the response
          $('.community-post-content-container').html(data);
        },
        error: function(error) {
          console.error('Error:', error);
        }
      });
    });
  </script>
  <jsp:include page="../resources/footer.html" />
</body>
</html>