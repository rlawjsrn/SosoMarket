package com.tbk.prj.prod;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.mypage.MypageLikeDAO;
import com.tbk.prj.mypage.MypageLikeVO;

@WebServlet("/ProdOne.do")
public class ProdOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdOneServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("prodOneServlet실행");

		String prodId = request.getParameter("prodId");

		System.out.println("상품아이디 찍어봐: " + prodId);

//		송다희 추가
		MypageLikeDAO mdao = new MypageLikeDAO();
		ProdVO mvo = new ProdVO();
		mvo.setProdId(prodId);
		mvo.setMemberId(request.getParameter("memberId"));
		
		mvo = mdao.MyLike(mvo);
		MypageLikeVO likevo = new MypageLikeVO();
		
		likevo.setProductInterestId(request.getParameter("row"));
		int n = mdao.delHeart(likevo);
//		송다희 끝
		if (prodId != null && !prodId.isEmpty()) {
			ProdDAO dao = new ProdDAO();
			int r = dao.prodViewCount(prodId);
			ProdVO vo = dao.prodOneList(prodId);
			
			ArrayList<ProdVO> list = new ArrayList<ProdVO>();

			list = dao.prodOnePhotoList(prodId);

			if (vo != null) {
				request.setAttribute("vo", vo);
				request.setAttribute("list", list);
				
				
//				송다희 추가
				request.setAttribute("mvo", mvo);
				request.setAttribute("likevo", likevo);
//				송다희 끝
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("prod/prodOne.jsp");
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("/SosoMarket/ProdList.do");
			}
		} else {
			response.sendRedirect("/SosoMarket/ProdList.do");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
