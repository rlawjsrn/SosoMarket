package com.tbk.prj.community;


import com.google.gson.Gson;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class CommGetCommentsServlet
 */
@WebServlet("/CommGetComments.do")
public class CommGetCommentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommGetCommentsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String postId = request.getParameter("postId");

        // Check if the post ID is not null or empty
        if (postId != null && !postId.isEmpty()) {
            // Retrieve comments for the post using the DAO
            CommunityDAO dao = new CommunityDAO();
            ArrayList<CommVO> comments = dao.getCommentsByPostId(postId);

            // Convert comments to JSON and send as the response
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(new Gson().toJson(comments));
        } else {
            // If the post ID is null or empty
        	System.out.println("The post id is null");
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("[]"); 
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
