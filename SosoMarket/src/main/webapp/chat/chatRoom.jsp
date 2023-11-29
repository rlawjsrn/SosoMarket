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
<% String memberId = (String) session.getAttribute("member_id"); %>
	<div class="msg_info">
		<!-- 상품 사진 -->
		<div class="prod_img">
			<img src="" alt="">
		</div>
		<!-- 상품 이름/상태/가격 -->
		<div class="prod_txt">
			<p class="prod_name">
				${prodVo.product_name }
				<!-- 상품 상태 -->
				<c:choose>
					<c:when test="${prodVo.product_status eq '0'}">
						<span style="color: #4685D0;">판매중</span>
					</c:when>
					<c:when test="${prodVo.product_status eq '1'}">
						<span>판매완료</span>
					</c:when>
					<c:when test="${prodVo.product_status eq '2'}">
						<span style="color: #29CF78;">예약중</span>
					</c:when>
				</c:choose>
			</p>
			<p class="prod_pric">${prodVo.product_price }원</p>
		</div>
		<!-- 상품 상태 변경 -->
<%-- 		<div class="prod_stat_sel">
			<ul class="prod_stat_ul">
				<li class="prod_stat_li"><a
					href="/SosoMarket/ProdStat.do?product_status='1'&product_id=${prodVo.product_id }">판매</a></li>
				<li class="prod_stat_li"><a
					href="/SosoMarket/ProdStat.do?product_status='2'&product_id=${prodVo.product_id }">예약</a></li>
			</ul>
		</div> --%>
		<c:choose>
			<c:when test="${prodVo.product_status eq '0'}">
				<div class="prod_stat_sel">
					<ul class="prod_stat_ul">
						<li class="prod_stat_li"><a
							href="/SosoMarket/ProdStat.do?product_status='1'&product_id=${prodVo.product_id }">판매</a></li>
						<li class="prod_stat_li"><a
							href="/SosoMarket/ProdStat.do?product_status='2'&product_id=${prodVo.product_id }">예약</a></li>
					</ul>
				</div>
			</c:when>
			<c:when test="${prodVo.product_status eq '1'}">
				<div class="prod_stat_sel">
					<ul class="prod_stat_ul">
						<c:choose>
							<!-- 아이디값 보고 거래후기 띄울지 말 건지 하는 거 해야 됨 화이팅 -->
						</c:choose>
						<li class="prod_stat_li long"><a href="/SosoMarket/MemberReview.do?member_id=${vo.member_id }">거래 후기 작성</a></li>
					</ul>
				</div>
			</c:when>
			<c:when test="${prodVo.product_status eq '2'}">
				<div class="prod_stat_sel">
					<ul class="prod_stat_ul">
						<li class="prod_stat_li"><a
							href="/SosoMarket/ProdStat.do?product_status='1'&product_id=${prodVo.product_id }">판매 완료</a></li>
						<li class="prod_stat_li"><a
							href="/SosoMarket/ProdStat.do?product_status='0'&product_id=${prodVo.product_id }">예약 취소</a></li>
					</ul>
				</div>
			</c:when>
		</c:choose>

		<!-- 거래후기 -->
		<!-- 			<div class="user_scr">
				<a href="#">거래 후기 남기기</a>
			</div> -->
	</div>

	<!-- 채팅창 내부 (수정 중!!!) -->
	<div class="msg_history">
		<c:forEach var="vo" items="${list }">
			<c:choose>
				<c:when test="${vo.member_id eq memberId }">
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
