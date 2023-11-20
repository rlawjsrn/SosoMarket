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

		if (prodId != null && !prodId.isEmpty()) {
			ProdDAO dao = new ProdDAO();
			ProdVO vo = dao.prodOneList(prodId);
			ArrayList<ProdVO> list = new ArrayList<ProdVO>();
			list = dao.prodOnePhotoList(prodId);
			
			if (vo != null) {
				request.setAttribute("vo", vo);
				request.setAttribute("list", list);
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
