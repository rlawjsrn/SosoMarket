package com.tbk.prj.community;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class CommunityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list"; // Default action
        }

        if (action.equals("list")) {
            listPosts(request, response);
        } else if (action.equals("new")) {
            showNewForm(request, response);
        } else if (action.equals("create")) {
            createPost(request, response);
        } else if (action.equals("edit")) {
            showEditForm(request, response);
        } else if (action.equals("update")) {
            updatePost(request, response);
        } else if (action.equals("delete")) {
            deletePost(request, response);
        }
    }

    private void listPosts(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int page = 1; // Default page number
        int postsPerPage = 25; // Number of posts to display per page

        String pageStr = request.getParameter("page");
        if (pageStr != null) {
            try {
                page = Integer.parseInt(pageStr);
            } catch (NumberFormatException e) {
                // Handle the exception or provide a default value
            }
        }

        CommunityDAO communityDAO = new CommunityDAO();
        List<CommunityVO> posts = communityDAO.getPostsWithPagination(page, postsPerPage);

        request.setAttribute("posts", posts);
        request.setAttribute("currentPage", page);
        request.getRequestDispatcher("community-list.jsp").forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("community-form.jsp").forward(request, response);
    }

    private void createPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommunityVO post = new CommunityVO();
        post.setPostTitle(request.getParameter("postTitle"));
        post.setPostDetail(request.getParameter("postDetail"));
        post.setPostViews(0); // Initialize post views to 0

        CommunityDAO communityDAO = new CommunityDAO();
        communityDAO.createPost(post);

        response.sendRedirect("community?action=list");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postId = request.getParameter("postId");
        CommunityDAO communityDAO = new CommunityDAO();
        CommunityVO post = communityDAO.getPostById(postId);

        request.setAttribute("post", post);
        request.getRequestDispatcher("community-form.jsp").forward(request, response);
    }

    private void updatePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CommunityVO post = new CommunityVO();
        post.setPostId(request.getParameter("postId"));
        post.setPostTitle(request.getParameter("postTitle"));
        post.setPostDetail(request.getParameter("postDetail"));

        CommunityDAO communityDAO = new CommunityDAO();
        communityDAO.updatePost(post);

        response.sendRedirect("community?action=list");
    }

    private void deletePost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postId = request.getParameter("postId");
        CommunityDAO communityDAO = new CommunityDAO();
        communityDAO.deletePost(postId);

        response.sendRedirect("community?action=list");
    }
}