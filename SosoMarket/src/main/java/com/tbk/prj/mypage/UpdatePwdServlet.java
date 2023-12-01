package com.tbk.prj.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tbk.prj.member.MemberDAO;
import com.tbk.prj.member.MemberVO;

/**
 * Servlet implementation class UpdatePwdServlet
 */
@WebServlet("/UpdatePwd.do")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public UpdatePwdServlet() {
		super();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		vo.setMemberId(request.getParameter("memberId"));
		String pwd = request.getParameter("password");
		String newPwd = request.getParameter("password2");
		System.out.println(newPwd);
		
		int n = dao.updatePwd(vo, pwd, newPwd);
		System.out.println(n);
		if(n>0) { // 변경 성공
			System.out.println("member logout");
			
			HttpSession session = request.getSession();
			
			session.invalidate();
			
			request.getSession().setAttribute("message", "비밀번호가 변경되었습니다.");
			RequestDispatcher dispatcher = request.getRequestDispatcher("member/login.jsp");
			dispatcher.forward(request, response);
			
		} else { // 변경 실패
			request.getSession().setAttribute("message", "기존 비밀번호를 확인해주세요");
			
			vo.setMemberId(request.getParameter("memberId"));
			vo = dao.memberOne(vo);
			
			System.out.println(vo.getMemberId());
			
			request.setAttribute("vo", vo);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("mypage/editPwd.jsp");
			dispatcher.forward(request, response);
			
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
