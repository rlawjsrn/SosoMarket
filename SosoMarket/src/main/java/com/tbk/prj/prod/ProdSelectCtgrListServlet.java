package com.tbk.prj.prod;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@WebServlet("/ProdCtgrList.do")
public class ProdSelectCtgrListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdSelectCtgrListServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		Gson gson = new GsonBuilder().create();

		ProdDAO dao = new ProdDAO();
		ArrayList<ProdVO> list = new ArrayList<ProdVO>();

		// 클라이언트로부터 전송된 데이터 받기
		String stOption = request.getParameter("sortOption"); // 정렬 기준 값
		String qtOption = request.getParameter("quantityOption"); // 정렬 갯수 값
		String[] selectedCategories = request.getParameter("selectedCategories").split(","); // 선택한 카테고리 값
		int priceMin = Integer.parseInt(request.getParameter("priceMin"));
		int priceMax = Integer.parseInt(request.getParameter("priceMax"));
		
		
		
		System.out.println("최소가격: " + request.getParameter("priceMin"));

		list = dao.selectFiltering(stOption, qtOption, selectedCategories, priceMin, priceMax);
		request.setAttribute("list", list);

		out.println(gson.toJson(list));

		RequestDispatcher dispatcher = request.getRequestDispatcher("prod/prodList.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
