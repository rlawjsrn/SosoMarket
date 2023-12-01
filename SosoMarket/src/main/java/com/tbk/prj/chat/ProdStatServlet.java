package com.tbk.prj.chat;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProdStatServlet
 */
@WebServlet("/ProdStat.do")
public class ProdStatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProdStatServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ChatDAO dao = new ChatDAO();
		ChatVO vo = new ChatVO();
		
		String prodStatus = request.getParameter("product_status").charAt(1) + "";
		
		vo.setProduct_id(request.getParameter("product_id"));
		vo.setProduct_status(prodStatus);
		dao.updateProdStat(vo);
		
		if (prodStatus.equals("1")) {
			vo.setChat_id(request.getParameter("chat_id"));
			dao.insertBuyList(vo);
		}
		
		request.setAttribute("prodVo", vo);
		
		String viewPage = "chat/chatList.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
