package com.tbk.prj.prod;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.mypage.MypageLikeVO;

@WebServlet("/ProdList.do")
public class ProdListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProdListServlet 실행되니??????");
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		ProdDAO dao = new ProdDAO();
		ArrayList<ProdVO> list = new ArrayList<ProdVO>();
		ArrayList<ProdVO> popList = new ArrayList<ProdVO>();
		ArrayList<ProdVO> ctgrList = new ArrayList<ProdVO>();

		
		list = dao.getProdList();				// 전체 상품 목록
		popList = dao.getPopularProdList();		// 인기순 3개 상품 목록
		ctgrList = dao.getCategoryList();		// 카테고리 목록
		
		System.out.println("prodList열림????");
		
		request.setAttribute("list", list);
		request.setAttribute("popList", popList);
		request.setAttribute("ctgrList", ctgrList);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("prod/prodList.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
