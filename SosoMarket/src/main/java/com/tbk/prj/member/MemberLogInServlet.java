package com.tbk.prj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogInServlet
 */
@WebServlet("/LogIn.do")
public class MemberLogInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogInServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		System.out.println(memberId);
		System.out.println(password);
		
		MemberVO vo = new MemberDAO().loginmember(memberId, password);
		
		// 로그인 성공
        if (vo != null) {
            HttpSession session = request.getSession();
            session.setAttribute("memberId", vo.getMemberId());
            session.setAttribute("nickname", vo.getNickname());
            response.sendRedirect("index.jsp");
        } // 로그인 실패
        else { 
            request.getSession().setAttribute("messageContent", "아이디와 비밀번호를 확인해주세요.");
            response.sendRedirect("/SosoMarket/LoginMove.do");
        }
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
