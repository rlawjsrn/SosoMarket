package com.tbk.prj.chat;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		// 상품 정보
		ChatRoomProdDAO prodDao = new ChatRoomProdDAO();
		ChatVO prodVo = new ChatVO();

		String chat_id = request.getParameter("chat_id");
		prodVo = prodDao.selectProdInfo(chat_id);
		request.setAttribute("prodVo", prodVo);

		// 대화 상대 ID 설정
		String memberId = request.getParameter("memberId");
		System.out.println(request.getParameter("memberId"));
		if (prodVo.getMember_id().equals(memberId)) {
			prodVo.setOtherMemberId(prodVo.getBuyer_id());
		} else {
			prodVo.setOtherMemberId(prodVo.getMember_id());
		}
		System.out.println(prodVo.getOtherMemberId());

		// 채팅메세지
		ChatRoomDAO dao = new ChatRoomDAO();
		ChatVO vo = new ChatVO();
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();

//		String chat_id = request.getParameter("chat_id");
		list = dao.selectChatMsgs(chat_id);
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
