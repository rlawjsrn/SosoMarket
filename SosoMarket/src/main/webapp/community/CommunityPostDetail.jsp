<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Community Post Detail</title>
<link rel="stylesheet" href="resources/css/style-community.css?after">
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
    margin-top:10px; 
    margin-bottom:10px;
  }
  .det { 
    margin-top:10px;
    margin-bottom:10px;
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
	box-shadow: 0 0 15px #4880B8 ;
}
</style>
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
          		<a class="fa fa-edit edit-icon" href="SosoMarket/CommunityPostUpdate.do"></a>
            <br> 
            <h3>&nbsp;${post.postTitle}</h3>
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
        <c:if test="${empty post}">
          <script>
            alert("일치하는 게시물이 없습니다.")
          </script>
          <!--                         <p>Post not found or does not exist.</p> -->
        </c:if>
      </div>
    </div>
    <!-- /row -->
  </div>
  <!-- /container -->
  <!-- </div> -->
  <!-- /section -->

  <!-- Assuming you have a container to display the content -->
  <div class="community-post-content-container"></div>

  <script>
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