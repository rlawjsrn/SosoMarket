package com.tbk.prj.admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.community.CommunityDAO;
import com.tbk.prj.community.CommunityVO;

/**
 * Servlet implementation class AdminCommServlet
 */
@WebServlet("/MemComm.do")
public class AdminCommServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		CommunityDAO dao= new CommunityDAO(); 
		CommunityVO vo = new CommunityVO(); 
		ArrayList<CommunityVO> posts=new ArrayList<CommunityVO>(); 
		
		posts=dao.getAllPosts(); 
		System.out.println(posts); //for check
		request.setAttribute("posts", posts); 
		
		String viewPage="admin/memComm.jsp"; 
		RequestDispatcher dispatcher= request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
