package com.tbk.prj.community;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class CommunityCommDeleteServlet
 */
@WebServlet("/CommunityCommDelete.do")
public class CommunityCommDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommunityCommDeleteServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        int commId = Integer.parseInt(request.getParameter("commId"));
        System.out.println("Received parameters - comm_id: " + commId );

        	try {
                CommunityDAO dao = new CommunityDAO();
                CommVO comment = dao.getCommentById(commId);
                boolean isReply = comment.getCmtRef() >0;
                System.out.println(isReply);
                boolean commentDeleted = dao.deleteComment(commId,isReply);

                if (commentDeleted) {
                    System.out.println("Comment deleted successfully");
                    response.getWriter().write("success"); // Send success response

//                    response.sendRedirect("/SosoMarket/CommunityPostDetail.do?postId=" + postId);
                } else {
                    System.out.println("Failed to delete comment");
                    response.getWriter().write("failure"); // Send failure response

//                    response.sendRedirect("/SosoMarket/CommunityPostDetail.do?postId=" + postId);
                }
        	}catch(Exception e) { 
        		e.printStackTrace();
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
