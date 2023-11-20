package com.tbk.prj.community;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommunityPostDetailServlet
 */
@WebServlet("/CommunityPostDetail.do")
public class CommunityPostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityPostDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get the post ID from the request parameter
        String postId = request.getParameter("postId");

        // Check if the post ID is not null or empty
        if (postId != null && !postId.isEmpty()) {
            // Retrieve the post details using the DAO
            CommunityDAO dao = new CommunityDAO();
            CommunityVO post = dao.getPostById(postId);
            
            // Retrieve comments for the post 
            ArrayList<CommVO> comments = dao.getCommentsByPostId(postId);
            
            // Check if the post details are found
            if (post != null) {
                // Set the post details as an attribute in the request
                request.setAttribute("post", post);
                request.setAttribute("comments", comments); 
                
                // Forward the request to the CommunityPostDetail.jsp
                String viewPage="community/CommunityPostDetail.jsp"; 
        		RequestDispatcher dispatcher= request.getRequestDispatcher(viewPage);
        		dispatcher.forward(request,response); 
        		} else {
                // If the post is not found, redirect to the post list page
                response.sendRedirect( "/SosoMarket/CommunityPostList.do");
            }
        } else {
            // If the post ID is null or empty, redirect to the post list page
            response.sendRedirect( "/SosoMarket/CommunityPostList.do");
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
