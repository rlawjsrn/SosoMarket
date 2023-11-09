//package com.tbk.prj.community;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.google.gson.Gson;
//
//
///**
// * Servlet implementation class CommunityRealTimeSearchServlet
// */
//@WebServlet("/RealTimeSearchServlet")
//public class CommunityRealTimeSearchServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public CommunityRealTimeSearchServlet() {
//        super();
//    }
//
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		  // Get the search query from the request
//        String searchQuery = request.getParameter("search");
//
//        // Create an instance of your CommunityDAO
//        CommunityDAO dao = new CommunityDAO();
//
//        // Create a list to store search results
//        ArrayList<CommunityVO> searchResults;
//
//        if (searchQuery != null && !searchQuery.isEmpty()) {
//            // Perform a search based on the search query
//            searchResults = dao.searchPostsByTitle(searchQuery);
//        } else {
//            // If no search query is provided, display all posts
//            searchResults = dao.getAllPosts();
//        }
//
//        // Convert search results to JSON
//        String json = new Gson().toJson(searchResults);
//
//        // Set the content type and write JSON response
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//        response.getWriter().write(json);
//    }
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//}
