<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소소마켓</title>

<!-- 채팅화면 style -->
<!-- orig Bootstrap -->
<!-- <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
<!-- this Bootstrap -->
<link type="text/css" rel="stylesheet"
	href="resources/css/bootstrap.min.css?after" />
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style-chat.css?after">

<script>
	$(document).on('click', '.call-room', function(e) {
		e.preventDefault(); // 기본 동작 방지
		
		var chatRoomUrl = $(this).attr('href');
		var clickedList = $(this).find('.chat_list');
		$('.chat_list').removeClass('active_chat');

		// Ajax를 이용해 ChatRoom.do 호출
		$.ajax({
			url : chatRoomUrl,
			method : 'POST',
			success : function(data) {
				// 성공 시 div.message에 결과를 넣음
				$('.mesgs').html(data);
				clickedList.addClass('active_chat');
			},
			error : function(error) {
				console.error('Error:', error);
			}
		});
	});
</script>

</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../resources/header.jsp"></jsp:include>

	<!-- chat container -->
	<div class="chat-container">
		<div class="messaging">
			<div class="inbox_msg">

				<!-- 채팅 리스트 -->
				<div class="inbox_people">
					<div class="headind_srch">
						<div class="recent_heading">
							<h4>소소챗</h4>
						</div>
					</div>
					<div class="inbox_chat">

						<!-- 채팅리스트 추가 -->
						<c:forEach var="vo" items="${list }">
							<a class="call-room" href="/SosoMarket/ChatRoom.do?chat_id=${vo.chat_id }&product_id=${vo.product_id }">
								<div class="chat_list">
									<div class="chat_people">
										<div class="chat_img">
											<img src="./upload/${vo.prodPhotoName }.png?after"
												alt="sunil">
										</div>
										<div class="chat_ib">
											<h5>
												<c:choose>
													<c:when test="${vo.member_id eq 'test3' }">
														${vo.buyer_nickname }	
													</c:when>
													<c:otherwise>
														${vo.nickname }
													</c:otherwise>
												</c:choose>
												<span class="chat_date">${vo.generation_date }</span>
											</h5>
											<p>${vo.chat_message }</p>
										</div>
									</div>
								</div>
							</a>
						</c:forEach>

					</div>
				</div>

				<!-- 채팅창 -->
				<div class="mesgs">
					<!-- 비어있음 -->
				</div>
			</div>
		</div>
	</div>

</body>
</html>
