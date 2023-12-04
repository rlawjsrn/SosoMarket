package com.tbk.prj.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CompareAuthCodeServlet
 */
public class CompareAuthCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompareAuthCodeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        String emailVrf = request.getParameter("emailVrf");
        String storedCode = (String) request.getSession().getAttribute("authCode");

        // Check for null values to avoid potential NullPointerException
        if (emailVrf != null && storedCode != null && emailVrf.equals(storedCode)) {
            response.getWriter().write("true");
        } else {
            response.getWriter().write("false");
        }
    
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
