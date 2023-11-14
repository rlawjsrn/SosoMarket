<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소소마켓</title>

<!-- 채팅화면 style -->
<link type="text/css" rel="stylesheet"
	href="resources/css/bootstrap.min.css?after" />
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/style-chat.css?after">

</head>

<!-- 나중에 삭제할 부분 -->
<body>
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
						<div class="chat_list active_chat">
							<div class="chat_people">
								<div class="chat_img">
									<img src="https://ptetutorials.com/images/user-profile.png"
										alt="sunil">
								</div>
								<div class="chat_ib">
									<h5>
										Sunil Rajput <span class="chat_date">Dec 25</span>
									</h5>
									<p>Test, which is a new approach to have all solutions
										astrology under one roof.</p>
								</div>
							</div>
						</div>

						<!-- 채팅리스트 추가 -->
						<c:forEach var="vo" items="${list }">
							<div class="chat_list">
								<div class="chat_people">
									<div class="chat_img">
										<img src="https://ptetutorials.com/images/user-profile.png"
											alt="sunil">
									</div>
									<div class="chat_ib">
										<h5>
											${vo.product_name } <span class="chat_date">${vo.generation_date }</span>
										</h5>
										<p>${vo.chat_message }</p>
									</div>
								</div>
							</div>
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

<body>
	<!-- 채팅창 내부 (수정 중!!!) -->
	<div class="msg_history">
		<c:forEach var="vo" items="${list }">
			
		</c:forEach>

		<c:forEach var="vo" items="${list}">
			<c:if test="${vo.productStatus eq 1}">
				<!-- product_status = 1 -> 거래완료 -->
				<tr>
					<td class="product-thumbnail"><img src="${vo.productPhotoId }"
						alt="Image" class="img-fluid"></td>
					<td class="product-name">
						<h2 class="h5 text-black">${vo.productName }</h2>
					</td>
					<td>${vo.productPrice }</td>
					<td>거래완료</td>
					<td>${vo.generationDate }</td>
				</tr>
			</c:if>
		</c:forEach>

		<div class="incoming_msg">
			<div class="incoming_msg_img">
				<img src="https://ptetutorials.com/images/user-profile.png"
					alt="sunil">
			</div>
			<div class="received_msg">
				<div class="received_withd_msg">
					<p>상대방채팅</p>
					<span class="time_date"> 11:01 AM | June 9</span>
				</div>
			</div>
		</div>
		<div class="outgoing_msg">
			<div class="sent_msg">
				<p>본인채팅</p>
				<span class="time_date"> 11:01 AM | June 9</span>
			</div>
		</div>
	</div>
	<div class="type_msg">
		<div class="input_msg_write">
			<input type="text" class="write_msg" placeholder="메시지 보내기" />
			<button class="msg_send_btn" type="button">
				<i class="fa fa-paper-plane-o" aria-hidden="true"></i>
			</button>
		</div>
	</div>
</body>
</html>
