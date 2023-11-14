package com.tbk.prj.community;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommunityCreatePostServlet
 */
@WebServlet("/CommunityCreatePost.do")
public class CommunityCreatePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityCreatePostServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the post data from the form
        String postTitle = request.getParameter("postTitle");
        String postDetail = request.getParameter("postDetail");
        String memberId = "test1"; // Replace with the actual member's ID when the login system is ready

        CommunityDAO dao = new CommunityDAO();

        // Create a new post object
        CommunityVO post = new CommunityVO();
        post.setPostTitle(postTitle);
        post.setPostDetail(postDetail);
        post.setMemberId(memberId);

        // Call a method in your CommunityDAO to store the post in the database
        boolean postCreated = dao.createPost(post);
     

        // Redirect to the same page after creating the post
//        response.sendRedirect("/community/CommunityCreatePost.jsp");

		String viewPage="community/CommunityCreatePost.jsp"; 
		RequestDispatcher dispatcher= request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response); 
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
