<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

<body>

	<!-- 채팅창 내부 (수정 중!!!) -->
	<div class="msg_history">
		<c:forEach var="vo" items="${list }">

			<c:choose>
				<c:when test="${vo.member_id eq 'test3' }">
					<div class="outgoing_msg">
						<div class="sent_msg">
							<p>${vo.chat_message }</p>
							<span class="time_date">${vo.generation_date }</span>
						</div>
					</div>
				</c:when>

				<c:otherwise>
					<div class="incoming_msg">
						<div class="incoming_msg_img">
							<img src="https://ptetutorials.com/images/user-profile.png"
								alt="sunil">
						</div>
						<div class="received_msg">
							<div class="received_withd_msg">
								<p>${vo.chat_message }</p>
								<span class="time_date">${vo.generation_date }</span>
							</div>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
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
