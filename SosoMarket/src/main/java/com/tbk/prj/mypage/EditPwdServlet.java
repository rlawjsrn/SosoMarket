package com.tbk.prj.mypage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.member.MemberDAO;
import com.tbk.prj.member.MemberVO;

/**
 * Servlet implementation class EditPwdServlet
 */
@WebServlet("/EditPwd.do")
public class EditPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EditPwdServlet() {
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		System.out.println("이거?" + request.getParameter("memberId"));
		
		vo = dao.memberOne(vo);
		vo.setMemberId(request.getParameter("memberId"));
		
		System.out.println(vo.getMemberId());
		
		request.setAttribute("vo", vo);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("mypage/editPwd.jsp");
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
