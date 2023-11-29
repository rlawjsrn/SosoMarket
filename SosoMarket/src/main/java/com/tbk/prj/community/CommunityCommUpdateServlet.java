package com.tbk.prj.community;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CommunityCommUpdateServlet
 */
@WebServlet("/CommunityCommUpdate.do")
public class CommunityCommUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */                                            
    public CommunityCommUpdateServlet() {
        super();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        
		String postId = request.getParameter("postId");
        int commId = Integer.parseInt(request.getParameter("commId"));
        String commentDetail = request.getParameter("updatedText");
        commentDetail = URLDecoder.decode(commentDetail, "UTF-8");
        
        
        String cmtRefParam = request.getParameter("cmtRef");
        String cmtPosParam = request.getParameter("cmtPos");

        System.out.println("Received parameters - comm_id: " + commId + ", comment_detail: "+commentDetail);

        if (commId>0 && commentDetail != null && !commentDetail.isEmpty()) {
            try {
                CommVO comment = new CommVO();
                comment.setCommId(commId);
                comment.setCommentDetail(commentDetail);

                // Check if it's a reply
                if (cmtRefParam != null && !cmtRefParam.isEmpty() && cmtPosParam != null && !cmtPosParam.isEmpty()) {
                    int cmtRef = Integer.parseInt(cmtRefParam);
                    int cmtPos = Integer.parseInt(cmtPosParam);
                    comment.setCmtRef(cmtRef);
                    comment.setCmtPos(cmtPos);
                }

                CommunityDAO dao = new CommunityDAO();

                System.out.println("Before updateComment method");
                boolean commentUpdated = dao.updateComment(comment);
                System.out.println("After updateComment method");
                response.getWriter().write(commentUpdated ? "success" : "failure");

                if (commentUpdated) {
                    System.out.println("Comment updated successfully");
                } else {
                    System.out.println("Failed to update comment");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
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
