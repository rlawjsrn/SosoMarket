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
 * Servlet implementation class ChatListServlet
 */
@WebServlet("/ChatList.do")
public class ChatListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChatListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		// 미로그인 시 접근 방지
		HttpSession session = request.getSession();
		if(session.getAttribute("memberId") == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");
			dispatcher.forward(request, response);
		}
		
		ChatDAO dao = new ChatDAO();
		ChatVO vo = new ChatVO();
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		
		vo.setMember_id(request.getParameter("member_id"));
		
		dao.selectBinChatList(vo, list);
		dao.selectChatList(vo, list);
		request.setAttribute("list", list);
		
		String viewPage = "chat/chatList.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
