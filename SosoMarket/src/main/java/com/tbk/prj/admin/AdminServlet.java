package com.tbk.prj.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.member.MemberVO;
import com.tbk.prj.prod.ProdVO;

/**
 * Servlet implementation class AdminServlet
 */

@WebServlet("/AdminMember.do")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AdminDAO dao = new AdminDAO();
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		ArrayList<ProdVO> plist = new ArrayList<ProdVO>();
		ArrayList<MemberVO> hlist = new ArrayList<MemberVO>();
		ArrayList<ProdVO> mlist = new ArrayList<ProdVO>();
		
//		회원 전체 목록
		list = dao.memberSelect();
		request.setAttribute("list", list);
//		판매 상위 3
		plist = dao.topSel();
		request.setAttribute("plist", plist);
//		점수 높은 상위 3
		hlist = dao.highScore();
		request.setAttribute("hlist", hlist);
//		이달의 판매왕 3명
		mlist = dao.monthSell();
		request.setAttribute("mlist", mlist);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("gentelella-master/production/memberSelect.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
