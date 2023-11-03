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

</head>
<body>

	<!-- 헤더 연결 -->
	<jsp:include page="../resources/header.html"></jsp:include>

	<!-- 
	<table border="1">
		<tr>
			<th width="100">채팅방 번호</th>
			<th width="150">상품 이름</th>
			<th width="200">마지막 채팅</th>
			<th width="150">시간</th>
		</tr>
		<c:forEach var="vo" items="${list}">
			<tr class="row">
				<td align="center">${vo.chat_id }</td>
				<td align="center">${vo.product_name }</td>
				<td align="center">${vo.chat_message }</td>
				<td align="center">${vo.generation_date }</td>
			</tr>
		</c:forEach>
	</table>
-->

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
</html>
