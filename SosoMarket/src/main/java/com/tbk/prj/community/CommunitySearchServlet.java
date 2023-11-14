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
 * Servlet implementation class CommunitySearchServlet
 */
@WebServlet("/CommunitySearch.do")
public class CommunitySearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunitySearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
        String searchQuery = request.getParameter("search");
        searchQuery=searchQuery.trim();
        System.out.println("Search Query: " + searchQuery);

        String postOrderNumber = request.getParameter("postOrderNumber");
        request.setAttribute("postOrderNumber", postOrderNumber);
        System.out.println(postOrderNumber);
        
        if (searchQuery != null && !searchQuery.isEmpty()) {
            CommunityDAO dao = new CommunityDAO();
            ArrayList<CommunityVO> searchResults = dao.searchPostsByTitle(searchQuery);
            request.setAttribute("searchResults", searchResults);

            String viewPage = "community/CommunitySearchResults.jsp"; // Use the correct JSP page
            RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
            dispatcher.forward(request, response);
        }
        else {
            // If search query is empty or not provided, display all posts
            CommunityDAO dao = new CommunityDAO();
            ArrayList<CommunityVO> posts = dao.getAllPosts();
            request.setAttribute("posts", posts);
            
            String viewPage = "community/CommunityPostList.jsp";
            
            RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
            dispatcher.forward(request, response);
        }

    }	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
