<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--  Imports for the Relative Date displaying -->


<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Community Post Detail</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel=stylesheet
	href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css	">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"> </script>
<link rel=stylesheet
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


<style>
@keyframes slideUp {
	0% {
		transform: translateY(100%);
	}
	100% {
		transform: translateY(0);
	}
}

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

.comment-icons-container .ml-3 {
	position: absolute;
	right: 0;
	color: #777;
	margin-bottom: 40px;
	margin-right: 16px !important;
}

.comment-icons-container {
	display: flex;
	justify-content: center;
	align-items: center;
}

.replyColor {
	background-color: #F0F8FF;
	display: none;
	margin-top: 20px;
	border-radius: 10%;
}

.reviews li {
	top: 17px;
	left: 15px;
}

.noPosts {
	background-color: #F0F8FF;
	padding: 20px;
	border-radius: 5%;
}

.review-form {
	margin-left: 30px;
	margin-top: 30px;
}

#product-tab {
	margin-top: 30px !important;
}
</style>
<link rel="stylesheet" href="resources/css/style-community.css?after">

<script>

//Comment Insert 
$('#commentForm').submit(function(e) {
	e.preventDefault();

	var formData = $(this).serialize();

	$.ajax({
		type : 'POST',
		url : '/SosoMarket/CommunityCommCreate.do?postId=' + postId,
		data : formData,
		success : function(response) {
			if (response.trim() === 'success') {
				// Comment created successfully, retrieve and update comments
				retrieveComments(postId);
				// Clear the form or do any other necessary actions
				$('#commentForm')[0].reset();
			} else {
				console.error('Failed to create comment.');
			}
		},
		error : function() {
			console.error('Failed to communicate with the server.');
		}
	});
});


// Comment Delete 
function deleteComment(commId, isReply) {
    if (confirm("정말로 삭제하시겠습니까?")) {
        $.ajax({
            type: 'POST', 
            url: '/SosoMarket/CommunityCommDelete.do',
            data: {
                commId: commId,
                isReply: isReply
            },
            success: function (response) {
                if (response.trim() === 'success') {
					alert('댓글 성공적으로 삭제되었습니다.');
                    window.location.reload();
                } else {
					alert('댓글 삭제가 실패하였습니다.다시 시도해주세요! ');
                }
            },
            error: function () {
                console.error('Failed to communicate with the server.');
            }
        });
    }
}


// Comment Update
function updateComment(commId) {
	var updatedText = encodeURIComponent($('#updatedText').val().trim());

	$.ajax({
		type : 'POST',
		url : '/SosoMarket/CommunityCommUpdate.do?commId=' + commId,
		data : {
			commId : commId,
			updatedText : updatedText
		},
		success : function(response) {
			if (response.trim() === 'success') {
				alert('댓글 성공적으로 수정되었습니다.');
				window.location.reload();
			} else {
				alert('댓글 수정이 실패하였습니다.다시 시도해주세요! ');
				console.error('Failed to update comment.');
			}
		},
		error : function() {
			console.error('Failed to communicate with the server.');
		}
	});
}

//  Show the update form
function showUpdateForm(commId, currentText) {
	$('#updateCommId').val(commId);
	$('#updatedText').val(currentText);
	/* 			$('#commentsSection').hide();
	 */$('#update-comment-form').show();
}

// Submit the updated comment
function submitUpdateComment() {
	var commId = $('#updateCommId').val();
	var updatedText = $('#updatedText').val();
	updateComment(commId, updatedText);
	// Clear and hide the update form
	$('#updateCommId').val('');
	$('#updatedText').val('');
	$('#update-comment-form').hide();
	$('#commentsSection').show();
}

// Cancel the update
function cancelUpdateComment() {
	$('#updateCommId').val('');
	$('#updatedText').val('');
	$('#update-comment-form').hide();
	$('#commentsSection').show();
}

// Toggle Replies
 function toggleReplies(commId) {
        var repliesContainer = document.getElementById('repliesList_' + commId);
        var toggleBtn = document.getElementById('toggleBtn_' + commId);

        if (repliesContainer.style.display === 'none') {
            // If replies are hidden, show them and update button text
            repliesContainer.style.display = 'block';
            toggleBtn.innerText = '답변 숨기기';
        } else {
            // If replies are visible, hide them and update button text
            repliesContainer.style.display = 'none';
            toggleBtn.innerText = '답변 보기';
        }
    }


 function showReplyForm(commId) {
        var replyForm = document.getElementById('replyForm_' + commId);
        replyForm.style.display = 'block';
    }
 
//Reply Insert 
	$('#replyForm').submit(function(e) {
		e.preventDefault();

		var formData = $(this).serialize();

		$.ajax({
			type : 'POST',
	        url: '/SosoMarket/CommunityInsertReply.do?postId=' + postId,
			data : formData,
			success : function(response) {
				if (response.trim() === 'success') {
					// Comment created successfully, retrieve and update comments
					retrieveComments(postId);
					// Clear the form or do any other necessary actions
					$('#commentForm')[0].reset();
				} else {
					console.error('Failed to create comment.');
				}
			},
			error : function() {
				console.error('Failed to communicate with the server.');
			}
		});
	});

	function cancelReplyForm(commId) {
	    var replyForm = document.getElementById('replyForm_' + commId);
	    replyForm.style.display = 'none';
	}

	

    
</script>
</head>

<body>
	<%
	String memberId = null;
	if (session.getAttribute("memberId") != null) {
		memberId = (String) session.getAttribute("memberId");
	}
	%>

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
						<li class="active">게시글 상세 페이지</li>
					</ul>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /breadcrumb -->


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
								<a class="fa fa-edit edit-icon text-right"
									href="/SosoMarket/CommunityEditPostForm.do?postId=${post.postId}"></a>
							</c:if>
						</div>
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


	<!-- Comment Container -->
	<div class="container">

			<div class="col-md-12">
				<div class="comments-container">
					<div id="product-tab">
						<!-- product tab nav -->
						<ul class="tab-nav">
							<li class="active"><a data-toggle="tab" href="#tab3">댓글</a></li>
						</ul>
						<!-- /product tab nav -->

						<!-- product tab content -->
						<div class="tab-content">
							<!-- tab3  -->
							<div id="tab3" class="tab-pane fade in active">
								<div class="row">


									<!-- Reviews -->
									<div class="col-md-12">
										<div
											class="mt-3 d-flex flex-row align-items-center p-3 form-color">
											<img src="upload/인턴.png" width="50"
												class="rounded-circle mr-2"> <input type="text"
												class="form-control comment-input" id="commentText"
												placeholder="Enter your comment..."> &nbsp; &nbsp; <a
												href="#" onclick="submitComment()" class="comment-button">comment</a>

										</div>
										
										
										<c:if test="${not empty commentsAndRepliesMap}">

											<div id="reviews">
												<div id="commentsSection">
													<ul class="reviews">
														<!-- Display Top Level Comments and Replies -->
														<c:forEach var="entry" items="${commentsAndRepliesMap}"
															varStatus="loop">
															<div class="comment">
																<li>
																	<div class="review-heading">
																		<h5 class="name">${entry.key.memberId}</h5>
																		<p class="date">${entry.key.generationDate}</p>
																	</div>
																	<div class="review-body">
																		<p>${entry.key.commentDetail}</p>


																		<!-- Show the buttons only if the logged-in user is the author of the comment -->
																		<div class="comment-icons-container">
																			<span class="ml-3"> <c:if
																					test="${memberId eq entry.key.memberId}">

																					<a class="fa fa-edit mr-2"
																						onclick="showUpdateForm('${entry.key.commId}', '${entry.key.commentDetail}')"></a>
																					<a class="fa fa-trash-o mr-2"
																						onclick="deleteComment('${entry.key.commId}')"></a>
																				</c:if> <!-- Add a "답변 달기" button --> <a
																				class="fa fa-comment-o mr-2"
																				onclick="showReplyForm('${entry.key.commId}')"></a>
																			</span>
																		</div>

																		<c:if test="${not empty entry.value}">
																			<a id="toggleBtn_${entry.key.commId}"
																				class="toggle-replies-btn"
																				onclick="toggleReplies(${entry.key.commId})">답변
																				보기</a>
																		</c:if>

																		<!--  Reply Form -->
																		<div id="replyForm_${entry.key.commId}"
																			style="display: none; margin-top: 20px;">
																			<!-- Added margin-top to move the form lower -->
																			<form class="reply-form" id="replyForm"
																				action="/SosoMarket/CommunityInsertReply.do?postId=${post.postId}"
																				method="post">
																				<input type="hidden" name="postId"
																					value="${post.postId}" /> <input type="hidden"
																					name="cmtRef" value="${entry.key.commId}" /> <input
																					type="hidden" name="cmtPos"
																					value="${entry.key.cmtPos}" />

																				<%
																				if (memberId == null || memberId.trim().isEmpty()) {
																				%>
																				<input class="input" style="width: 350px;"
																					type="text" readonly="readonly" value="먼저 로그인~!">

																				<%
																				} else {
																				%>
																				<input class="input" style="width: 350px;"
																					type="text" readonly="readonly"
																					value="<%=memberId%>">

																				<%
																				}
																				%>

																				<textarea class="input" style="width: 350px;"
																					placeholder="답변을 작성해주세요" name="commentDetail"></textarea>
																				<!-- Adjusted the height of the textarea -->
																				<button class="primary-btn" style="font-size: 12px;"
																					type="submit">답변 작성</button>
																				<!-- Adjusted the font-size of the button -->
																				<button class="primary-btn" style="font-size: 12px;"
																					type="button"
																					onclick="cancelReplyForm('${entry.key.commId}')">취소</button>
																				<!-- Adjusted the font-size of the button -->
																			</form>
																		</div>

																	</div> <!-- Display Replies for the Current Top Level Comment -->

																	<c:if test="${not empty entry.value}">
																		<div id="repliesList_${entry.key.commId}"
																			class="replyColor">
																			<ul>
																				<c:forEach var="reply" items="${entry.value}">
																					<li>
																						<div class="review-heading">
																							<h5 class="name">${reply.memberId}</h5>
																							<p class="date">${reply.generationDate}</p>
																						</div>
																						<div class="review-body">
																							<p>${reply.commentDetail}</p>

																							<div class="comment-icons-container">
																								<span class="ml-3"> <c:if
																										test="${memberId eq reply.memberId}">
																										<a class="fa fa-edit mr-2"
																											onclick="showUpdateForm('${reply.commId}', '${reply.commentDetail}')"></a>
																										<a class="fa fa-trash-o mr-2"
																											onclick="deleteComment('${reply.commId}')"></a>
																									</c:if>
																								</span>
																							</div>

																						</div>
																					</li>
																				</c:forEach>
																			</ul>
																		</div>
																	</c:if>
																</li>
															</div>
														</c:forEach>
													</ul>
												</div>
											</div>
											<!-- /Reviews -->
											<button id="loadMoreBtn" class="primary-btn cta-btn">더
												보기</button>
											<button id="hideCommentsBtn" style="display: none;"
												class="primary-btn cta-btn">댓글 숨기기</button>



										</c:if>

										<c:if test="${empty commentsAndRepliesMap}">
											<p class="noPosts">No comments available</p>
										</c:if>
									</div>
									<!-- /Comment Section -->


								<%-- 	<!-- Review Form -->
									<div class="col-md-3">
										<div id="review-form">
											<form class="review-form" id="commentForm"
												action="/SosoMarket/CommunityCommCreate.do?postId=${post.postId}"
												method="post">
												<input type="hidden" name="postId" value="${post.postId}" />
												<%
												if (memberId == null || memberId.trim().isEmpty()) {
												%>
												<input class="input" type="text" readonly="readonly"
													value="먼저 로그인~!">
												<%
												} else {
												%>
												<input class="input" type="text" readonly="readonly"
													value="<%=memberId%>">
												<%
												}
												%>
												<textarea class="input" placeholder="댓글을 작성해주세요"
													name="commentDetail"></textarea>
												<button class="primary-btn" type="submit">댓글 작성</button>

											</form>
										</div>
									</div>
									<!-- /Review Form --> --%>


									<!-- Update Comment Form -->
										<div id="update-comment-form" style="display: none;">
											<form class="update-comment-form" id="updateCommentForm">
												<input type="hidden" id="updateCommId" />
												<textarea class="input" id="updatedText"
													placeholder="댓글을 수정해주세요"></textarea>
												<button class="primary-btn" type="button"
													onclick="submitUpdateComment()">댓글 수정</button>
												<button class="primary-btn" type="button"
													onclick="cancelUpdateComment()">취소</button>
											</form>
										</div>
										<!-- /Update Comment Form -->
								</div>
								<!-- /tab3  -->
							</div>
							<!-- /product tab content  -->
						</div>
					</div>
					<!-- /product tab -->


				</div>
			</div>
		</div>


	<!-- Assuming you have a container to display the content -->
	<div class="community-post-content-container"></div>
	<script src="resources/js/jquery.min.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/nouislider.min.js"></script>
	<script src="resources/js/jquery.zoom.min.js"></script>
	<script src="resources/js/main.js"></script>

	<script>
	
	$(document).ready(function () {
	    // Hide all comments initially
	    $('#reviews .comment').hide();

	    // Show the first 5 comments if there are more than 5
	    var initialComments = $('#reviews .comment');
	    if (initialComments.length > 5) {
	        initialComments.slice(0, 5).show();
	        $('#loadMoreBtn').show();
	    } else {
	        // If there are 5 or fewer comments, show all and hide the "Load More" button
	        initialComments.show();
	        $('#loadMoreBtn').hide();
	    }

	    // Function to load more comments
	    function loadMoreComments() {
	        // Show the next 3 comments
	        $('#reviews .comment:hidden').slice(0, 3).show();

	        // Hide the "Load More" button if no more hidden comments
	        if ($('#reviews .comment:hidden').length === 0) {
	            $('#loadMoreBtn').hide();
	        }
	    }

	    // Attach click event to the "Load More" button
	    $('#loadMoreBtn').on('click', function () {
	        loadMoreComments();

	        // Show the "댓글 숨기기" button if no more hidden comments
	        if ($('#reviews .comment:hidden').length === 0) {
	            $('#hideCommentsBtn').show();
	        }
	    });

	    // Attach click event to the "댓글 숨기기" button
	    $('#hideCommentsBtn').on('click', function () {
	        // Hide all comments except the first 5
	        $('#reviews .comment').slice(5).hide();
	        // Show the "Load More" button if there are more than 5 comments
	        if ($('#reviews .comment').length > 5) {
	            $('#loadMoreBtn').show();
	        }
	        // Hide the "댓글 숨기기" button
	        $(this).hide();
	    });
	});
	
	function submitComment() {
        var commentText = encodeURIComponent(document.getElementById('commentText').value.trim());
        if (memberId!== null && memberId !== '') {
            if (commentText !== '') {
                var url = "/SosoMarket/CommunityCommCreate.do?postId=${post.postId}&memberId=<%=memberId%>&commentDetail=" + commentText;
                window.location.href = url;

            } else {
           	 	alert("댓글 내용을 입력해주세요.");
            }
        } 
        else{ 
       	 	alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
            window.location.href = "/SosoMarket/LoginMove.do";
        }
    }  

function autoSize(textarea) {
    textarea.style.height = 'auto'; // Reset height to auto to correctly calculate scrollHeight
    textarea.style.height = (textarea.scrollHeight) + 'px'; // Set the height to the scrollHeight of the content
}

// Call autoSize for all textareas on page load
$(document).ready(function () {
    $("textarea").each(function () {
        autoSize(this);
    });
});

// Call autoSize when typing
$("textarea").on('input', function () {
    autoSize(this);
});


		// AJAX call when the page loads
		$(document)
				.ready(
						function() {
							var communityPostContentUrl = '/SosoMarket/CommunityPostContent.do'; // Adjust the URL as needed

							// AJAX call to CommunityPostContent.do
							$.ajax({
								url : communityPostContentUrl,
								method : 'GET', // Assuming you want to retrieve data
								success : function(data) {
									// Update the content of a specific element with the response
									$('.community-post-content-container')
											.html(data);
								},
								error : function(error) {
									console.error('Error:', error);
								}
							});
						});
		
		
		
	</script>
	<jsp:include page="../resources/footer.html" />
</body>
</html>
