package com.tbk.prj.community;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class CommunityInsertServlet
 */
@WebServlet("/CommunityInsertReply.do")
public class CommunityInsertReplyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");

        // Retrieve parameters from the request
		String postId = request.getParameter("postId");
        int cmtRef = Integer.parseInt(request.getParameter("cmtRef"));
        int cmtPos = Integer.parseInt(request.getParameter("cmtPos"));
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberId");
        String commentDetail = request.getParameter("commentDetail");
        commentDetail = URLDecoder.decode(commentDetail, "UTF-8");

        System.out.println("postId: " + postId);
        System.out.println("memberId: " + memberId);
        System.out.println("cmtRef: " + cmtRef);
        System.out.println("cmtPos: " + cmtPos);
        System.out.println("commentDetail: " + commentDetail);

        if (memberId != null && !memberId.isEmpty() && commentDetail != null
                && !commentDetail.isEmpty()) {
            CommVO reply = new CommVO();
            reply.setPostId(postId);
            reply.setMemberId(memberId);
            reply.setCmtRef(cmtRef);
            reply.setCmtPos(cmtPos);
            reply.setCommentDetail(commentDetail);

            CommunityDAO dao = new CommunityDAO();
            CommVO createdReply = dao.createComment(reply);
            if (createdReply != null) {
				response.sendRedirect(request.getContextPath() + "/CommunityPostDetail.do?postId=" + postId);
                System.out.println("Reply Creation Success");
            } else {
                System.out.println("Reply Creation Failed");
            }

        } else {
        	response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Login Please</title>");
            out.println("</head>");
            out.println("<body>");

            out.println("<script type='text/javascript'>");
            out.println("alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');");
            out.println("window.location.href='/TokkiMarket/LoginMove.do';"); // Redirect using JavaScript
            out.println("</script>");

            out.println("</body>");
            out.println("</html>");        }
    }
}

