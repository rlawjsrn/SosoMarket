package com.tbk.prj.chat;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/Review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		ChatDAO dao = new ChatDAO();
		
		// 회원, 점수
		String member_id = request.getParameter("member_id");
		int score = Integer.parseInt(request.getParameter("score"));
		
		if (score == 3)
			score *= -1;
		
		// 점수 업데이트
		int result = dao.updateMemScore(score, member_id);
		
		// 상품상태 업데이트
		if (result == 1) {
			ChatVO vo = new ChatVO();
			vo.setProduct_id(request.getParameter("product_id"));
			vo.setProduct_status("3");
			dao.updateProdStat(vo);
		}
		
		response.getWriter().write(String.valueOf(result));
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
