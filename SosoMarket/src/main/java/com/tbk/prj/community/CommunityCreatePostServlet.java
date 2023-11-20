package com.tbk.prj.community;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CommunityCreatePost.do")
public class CommunityCreatePostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public CommunityCreatePostServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect to the same page if accessed directly
        String viewPage = "community/CommunityCreatePost.jsp";
        request.getRequestDispatcher(viewPage).forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the post data from the form
        String postTitle = request.getParameter("postTitle");
        String postDetail = request.getParameter("postDetail");
        HttpSession session = request.getSession();
        String memberId = (String) session.getAttribute("memberId");

        // Check if the user is logged in
        if (memberId != null) {
            // Create a new post object
            CommunityVO post = new CommunityVO();
            post.setPostTitle(postTitle);
            post.setPostDetail(postDetail);
            post.setMemberId(memberId);

            // Call a method in your CommunityDAO to store the post in the database
            CommunityDAO dao = new CommunityDAO();
            CommunityVO createdPost = dao.createPost(post);

            if (createdPost != null) {
                // Post creation successful
                response.getWriter().write("success");
            } else {
                // Post creation failed
                response.getWriter().write("Post creation failed");
            }
        } else {
            // User is not logged in, handle accordingly
            response.getWriter().write("User not logged in");
        }
    }
}
