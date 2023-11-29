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
	<%
	String memberId = (String) session.getAttribute("member_id");
	%>
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
		<div class="prod_stat_sel">
			<ul class="prod_stat_ul">
				<!-- 상품 상태 변경 -->
				<!-- 판매중, 예약중이며 로그인 계정 == 판매자 계정일 때 -->
				<c:if test="${prodVo.buyer_id != memberId}">
					<c:choose>
						<c:when test="${prodVo.product_status eq 0}">
							<li class="prod_stat_li"><a
								href="/SosoMarket/ProdStat.do?product_status='1'&product_id=${prodVo.product_id }&chat_id=${prodVo.chat_id }">판매</a></li>
							<li class="prod_stat_li"><a
								href="/SosoMarket/ProdStat.do?product_status='2'&product_id=${prodVo.product_id }">예약</a></li>
						</c:when>
						<c:when test="${prodVo.product_status eq 2}">
							<li class="prod_stat_li"><a
								href="/SosoMarket/ProdStat.do?product_status='1'&product_id=${prodVo.product_id }">판매
									완료</a></li>
							<li class="prod_stat_li"><a
								href="/SosoMarket/ProdStat.do?product_status='0'&product_id=${prodVo.product_id }">예약
									취소</a></li>
						</c:when>
					</c:choose>
				</c:if>
				<c:if
					test="${prodVo.product_status == 1 && (prodVo.buy_mem_id == memberId || prodVo.buy_mem_id == prodVo.other_mem_id)}">
					<li class="prod_stat_li long"><a
						href="/SosoMarket/MemberReview.do?member_id=${vo.otherMemberId }">
							거래 후기 작성</a></li>
				</c:if>
			</ul>
		</div>
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
