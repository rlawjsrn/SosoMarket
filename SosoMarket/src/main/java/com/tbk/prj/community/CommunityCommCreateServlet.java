package com.tbk.prj.community;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommunityCommCreate.do")
public class CommunityCommCreateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		// Retrieve parameters from the request
		String postId = request.getParameter("postId");
//		String memberId = request.getParameter("memberId");
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		String commentDetail = request.getParameter("commentDetail");

		System.out.println("postId: " + postId);
		System.out.println("memberId: " + memberId);
		System.out.println("commentDetail: " + commentDetail);

		// Validate parameters
		if (memberId != null && !memberId.isEmpty() && postId != null && !postId.isEmpty() && commentDetail != null
				&& !commentDetail.isEmpty()) {
			// Create a new CommentVO
			CommVO comment = new CommVO();
			comment.setPostId(postId);
			comment.setMemberId(memberId);
			comment.setCommentDetail(commentDetail);
			// Check if it's a reply
			String cmtRefParam = request.getParameter("cmtRef");
			String cmtPosParam = request.getParameter("cmtPos");

			if (cmtRefParam != null && !cmtRefParam.isEmpty() && cmtPosParam != null && !cmtPosParam.isEmpty()) {
				int cmtRef = Integer.parseInt(cmtRefParam);
				int cmtPos = Integer.parseInt(cmtPosParam);
				comment.setCmtRef(cmtRef);
				comment.setCmtPos(cmtPos);
			}
			// Call the DAO method to create a new comment
			CommunityDAO dao = new CommunityDAO();
			CommVO createdComm = dao.createComment(comment);
			if (createdComm != null) {
				response.sendRedirect(request.getContextPath() + "/CommunityPostDetail.do?postId=" + postId);
				System.out.println("Comment Creation Success");
			} else {
				System.out.println("Comment Creation Failed");
			}

		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head>");
			out.println("<title>Alert Example</title>");
			out.println("</head>");
			out.println("<body>");

			out.println("<script type='text/javascript'>");
			out.println("alert('로그인이 필요합니다. 로그인 페이지로 이동합니다.');");
			out.println("window.location.href='/SosoMarket/LoginMove.do';"); // Redirect using JavaScript
			out.println("</script>");

			out.println("</body>");
			out.println("</html>");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
