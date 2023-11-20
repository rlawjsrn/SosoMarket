package com.tbk.prj.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.community.CommunityVO;

/**
 * Servlet implementation class MypageCom
 */
@WebServlet("/MypageCom.do")
public class MypageCom extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		MypageLikeDAO dao = new MypageLikeDAO();
		CommunityVO vo = new CommunityVO();
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		vo.setMemberId(request.getParameter("memberId"));
		
		list = dao.myCommunity(vo);
		request.setAttribute("list", list);
		String viewPage = "mypage/myComm.jsp";
		// RequestDispatcher는 클라이언트로부터 최초에 들어온 요청을 JSP/Servlet 내에서 원하는 자원으로 요청을 넘기는 역할 수행
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
