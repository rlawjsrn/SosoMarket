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
//@WebServlet("/CommunityRealTime.do")
//public class CommunityRealTimeServlet extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//       
//    /**
//     * @see HttpServlet#HttpServlet()
//     */
//    public CommunityRealTimeServlet() {
//        super();
//    }
////
//	/**
//	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		   response.setContentType("application/json");
//	        response.setCharacterEncoding("UTF-8");
//
//	        String searchQuery = request.getParameter("search");
//	        searchQuery=searchQuery.trim();
//	        if (searchQuery != null) {
//	            CommunityDAO dao = new CommunityDAO();
//	            ArrayList<CommunityVO> searchResults = dao.searchPostsByTitle(searchQuery);
//
//	            // Convert searchResults to JSON using Gson
//	            Gson gson = new Gson();
//	            String jsonResults = gson.toJson(searchResults);
//
//	            response.getWriter().write(jsonResults);
//	        }
//	    }
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
//	}
//
//}
