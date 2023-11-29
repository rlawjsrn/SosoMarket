package com.tbk.prj.prod;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProdMod.do")
public class ProdModServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdModServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProdModServlet 실행되니??????");

		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String prodId = request.getParameter("prodId");
		
		ProdDAO dao = new ProdDAO();
		ProdVO vo = dao.prodOneList(prodId);
		ArrayList<ProdVO> list = dao.prodOnePhotoList(prodId);
		
		request.setAttribute("vo", vo);
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("prod/prodMod.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
