package com.tbk.prj.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChatRoomServlet
 */

@WebServlet("/ChatRoom.do")
public class ChatRoomServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChatRoomServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		// 상품 정보
		ChatDAO prodDao = new ChatDAO();
		ChatVO prodVo = new ChatVO();
		String chat_id = request.getParameter("chat_id");
		prodVo = prodDao.selectProdInfo(chat_id);
		
		System.out.println("상품판매자 : " + prodVo.getProd_mem_id());
		
		// 수정 중
		// 구매자 정보 확인
		if (prodVo.getProduct_status().equals("1")) {
			prodDao.selectBuyerMember(prodVo);
		}
		
		System.out.println("상품판매자 : " + prodVo.getProd_mem_id());
		System.out.println("상품구매자 : " + prodVo.getBuy_mem_id());
		
		// 대화 상대 ID 설정
//		String memberId = request.getParameter("memberId");
		String memberId = (String) session.getAttribute("memberId");
		System.out.println("로그인계정 : " + memberId);
		
		if (prodVo.getProd_mem_id().equals(memberId)) {
			prodVo.setOther_mem_id(prodVo.getBuyer_id());
		} else {
			prodVo.setOther_mem_id(prodVo.getProd_mem_id());
		}
		
		System.out.println("현재대화멤버 : " + prodVo.getOther_mem_id());

		// 채팅메세지
		ChatDAO dao = new ChatDAO();
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		list = dao.selectChatMsgs(chat_id);
		
		request.setAttribute("prodVo", prodVo);
		request.setAttribute("list", list);

		String viewPage = "chat/chatRoom.jsp";

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
