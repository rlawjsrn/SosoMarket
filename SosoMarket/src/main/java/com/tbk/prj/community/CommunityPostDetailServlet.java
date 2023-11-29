package com.tbk.prj.community;

import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

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
		
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		
        String postId = request.getParameter("postId");
        

			CommunityDAO dao = new CommunityDAO();
            CommunityVO post = dao.getPostById(postId);

            
         // Retrieve top-level comments for the product
    		ArrayList<CommVO> topLevelComments = dao.getCommentsByPostId(postId);
    		System.out.println(topLevelComments);

    		// Create a map to hold top-level comments and their replies
    		Map<CommVO, List<CommVO>> commentsAndRepliesMap = new LinkedHashMap<>();

    		// Iterate through each top-level comment
    		for (CommVO topLevelComment : topLevelComments) {
    		    ArrayList<CommVO> replies = dao.getRepliesByCommentId(topLevelComment.getCommId());
    		    System.out.println("CommId : " + topLevelComment.getCommId() + " replies: " + replies);

    		    // Associate the top-level comment with its replies
    		    commentsAndRepliesMap.put(topLevelComment, replies);
    		}

    		System.out.println("Top Level Comments and Replies Map: " + commentsAndRepliesMap);

    		// Set top-level comments and replies as separate attributes
    		request.setAttribute("commentsAndRepliesMap", commentsAndRepliesMap);
    		// Comment
    		
            request.setAttribute("post", post);
    		RequestDispatcher dispatcher = request.getRequestDispatcher("community/CommunityPostDetail.jsp");
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
