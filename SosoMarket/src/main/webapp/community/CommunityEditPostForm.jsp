<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Community Post Edit</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="resources/css/style-community.css?after">
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
                        <form id="editForm" class="d-flex align-items-baseline" action="/SosoMarket/CommunityPostUpdate.do?postId=${post.postId}">
                            <input type="hidden" name="postId" value="${post.postId}">
                            <label for="postTitle">제목:</label>
                            <input type="text" id="postTitle" name="postTitle" value="${post.postTitle}" class="input" contenteditable="true">
                            <br>
                            <br>
                            <label for="postDetail">내용:</label>
							<textarea id="postDetail" name="postDetail" class="input" oninput="autoSize(this)">${post.postDetail}</textarea>
                            <br>
                            <br>
                            <input type="submit" value="수정" class="primary-btn order-submit" onclick="submitForm()">
                            &nbsp;<a href="/SosoMarket/CommunityPostDetail.do?postId=${post.postId}" class="primary-btn order-submit">취소</a>
                            &nbsp;<input type="button" value="삭제" class="primary-btn order-submit" onclick="deletePost()">
                        </form>
                    </div>
                    <script>
                    	// Autosize the textarea while typing 
                    function autoSize(textarea) {
                        textarea.style.height = 'auto'; // Reset height to auto to correctly calculate scrollHeight
                        textarea.style.height = (textarea.scrollHeight) + 'px'; // Set the height to the scrollHeight of the content
                    }
                    
                 	// Call autoSize on page load
                   	 $(document).ready(function () {
                       	 autoSize(document.getElementById("postDetail"));
                    });

                      // Function to show the alert
                        function showAlert(message) {
                            alert(message);
                        }

                        // Function to handle form submission using AJAX
                        function submitForm() {
                            // Your form data
                            var formData = new FormData(document.getElementById("editForm"));
                            var postTitle = document.getElementById("postTitle").value;
                            var postDetail = document.getElementById("postDetail").value;

                            if (!postTitle || !postDetail) {
                                showAlert("게시글 제목과 내용을 입력하세요.");
                                return;
                            }

                            formData.append("postTitle", postTitle);
                            formData.append("postDetail", postDetail);


                            // AJAX request for form submission
                            $.ajax({
                                type: "POST",
                                url: "/SosoMarket/CommunityPostUpdate.do?postId=${post.postId}", // Replace with your actual URL
                                data: formData,
                                contentType: false,
                                processData: false,
                                success: function (response) {
                                    showAlert("게시글이 성공적으로 수정되었습니다.");
                                    // Redirect to the detail page
                                    window.location.href = "/SosoMarket/CommunityPostDetail.do?postId=${post.postId}";
                                },
                                error: function (error) {
                                    showAlert("게시글 수정이 실패하였습니다.");
                                    // Redirect to the detail page
                                    window.location.href = "/SosoMarket/CommunityPostDetail.do?postId=${post.postId}";
                                }
                            });
                        }
                        

                        // Function to handle post deletion using AJAX
                        function deletePost() {
                            // Confirm deletion with the user
                            if (confirm("정말로 삭제하시겠습니까?")) {
                                // AJAX request for post deletion
                                $.ajax({
                                    type: "GET",
                                    url: "/SosoMarket/CommunityDeletePost.do?postId=${post.postId}", // Replace with your actual URL
                                    success: function (response) {
                                        showAlert("게시글이 성공적으로 삭제되었습니다.");
                                        // Redirect to the post list page
                                        window.location.href = "/SosoMarket/CommunityPostList.do";
                                    },
                                    error: function (error) {
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
