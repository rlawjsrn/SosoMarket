package com.tbk.prj.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommunityPostUpdateServlet
 */
@WebServlet("/CommunityPostUpdate.do")
public class CommunityPostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommunityPostUpdateServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String postId = request.getParameter("postId");
		String postTitle = request.getParameter("postTitle");
		String postDetail = request.getParameter("postDetail");

		CommunityVO post = new CommunityVO();
		post.setPostId(postId);
		post.setPostTitle(postTitle);
		post.setPostDetail(postDetail);

		CommunityDAO dao = new CommunityDAO();
		boolean success = dao.updatePost(post);
		
		if(success) { 
			System.out.println("게시글 수정 성공  "); 
			String viewPage="community/CommunityPostDetail.jsp"; 
			RequestDispatcher dispatcher= request.getRequestDispatcher(viewPage);
			dispatcher.forward(request,response); 
		}else { 
			System.out.println("게시글 수정 실패 "); 
		}
 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
