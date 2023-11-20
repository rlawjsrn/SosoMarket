package com.tbk.prj.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MypageLikeList
 */
@WebServlet("/MypageBuyList.do")
public class MypageLikeBuyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageLikeBuyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		MypageLikeDAO dao = new MypageLikeDAO();
		MypageLikeVO vo = new MypageLikeVO();
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		
		vo.setMemberId(request.getParameter("memberId"));
		
		// dao 페이지에서 전체목록
		list = dao.buyList(vo);
		System.out.println(list);
		request.setAttribute("list", list);
		
		// 목록을 보여줄 페이지
		String viewPage = "mypage/myBuyList.jsp";
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
