package com.tbk.prj.admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.tbk.prj.member.MemberVO;
import com.tbk.prj.prod.ProdVO;

/**
 * Servlet implementation class AdminMainServlet
 */
@WebServlet("/AdminMain.do")
public class AdminMainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		AdminDAO dao = new AdminDAO();
		MemberVO mvo = new MemberVO();
		ProdVO pvo = new ProdVO();
		ProdVO ptvo = new ProdVO();
		ProdVO pdvo = new ProdVO();
		
		mvo = dao.memCount(mvo);
		pvo = dao.prodCount(pvo);
		ptvo = dao.todayProd(ptvo);
		pdvo = dao.doneProd(pdvo);
		
		request.setAttribute("mvo", mvo);
		request.setAttribute("pvo", pvo);
		request.setAttribute("ptvo", ptvo);
		request.setAttribute("pdvo", pdvo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("gentelella-master/production/adminMain.jsp");
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
