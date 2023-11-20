package com.tbk.prj.community;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CommunityEditPostFormServlet
 */
@WebServlet("/CommunityEditPostForm.do")
public class CommunityEditPostFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityEditPostFormServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve postId from the request parameter
        String postId = request.getParameter("postId");

        // Use CommunityDAO to get post details
        CommunityDAO dao = new CommunityDAO();
        CommunityVO post = dao.getPostById(postId);

        // Set post details as attributes
        request.setAttribute("post", post);

        // Forward the request to EditPostForm.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("community/CommunityEditPostForm.jsp");
        dispatcher.forward(request, response);	
        
        }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
