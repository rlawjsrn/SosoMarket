package com.tbk.prj.community;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class CommunityGetCommServlet
 */
@WebServlet("/CommunityGetComm.do")
public class CommunityGetCommServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityGetCommServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		 // Retrieve parameters from the request
	    String postId = request.getParameter("postId");

	    // Validate parameters
	    if (postId != null && !postId.isEmpty()) {
	        // Call the DAO method to get comments for the post
	        CommunityDAO dao = new CommunityDAO();
	        ArrayList<CommVO> comments = dao.getCommentsByPostId(postId);

	        response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(comments));
	    } else {
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("fail: Incomplete parameters");
	        System.out.println("Comments Retrieval Error: Incomplete parameters");
	    }
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
