package com.tbk.prj.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberUpNic
 */
@WebServlet("/MemberUp.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
//		vo.setMemberId(request.getParameter("row"));
		vo.setNickname(request.getParameter("nickname"));
		if(request.getParameter("phoneNumber") != null) {
			String stttt = request.getParameter("phoneNumber");
			String cleanedString = stttt.replaceAll("[^\\uAC00-\\uD7A3\\dA-Za-z\\s]", "");
			System.out.println("ssss"+cleanedString);
			vo.setPhoneNumber(cleanedString);
		}
		int n = dao.updateNic(vo);
		request.setAttribute("vo", vo);
		String viewPage = "/MyPageUpdate.do";
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
