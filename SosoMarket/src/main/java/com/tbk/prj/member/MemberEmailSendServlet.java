package com.tbk.prj.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberEmailSendServlet
 */
public class MemberEmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
	    response.setContentType("text/html;charset=utf-8");
	    String email = request.getParameter("email");

	    String authCode = new MemberDAO().authCodeMaker(); 

	    HttpSession session = request.getSession();
	    

	    // Assuming your MemberDAO is in the same package as your servlet
	    MemberDAO memberDAO = new MemberDAO();

	    // Send the email and get the result (true if successful, false otherwise)
	    boolean emailSent = memberDAO.sendVerificationEmail(email, authCode);

	    if (emailSent) {
	        // Email sent successfully, set a notification message
	        session.setAttribute("notificationMessage", "인증 메일을 보냈습니다.");
	    } else {
	        // Email sending failed, set an error message
	        session.setAttribute("notificationMessage", "메일 전송 실패. 다시 시도해주세요.");
	    }
	    
	    session.setAttribute("authCode", authCode);
	    System.out.println("서블릿"+authCode);

	    response.getWriter().write(String.valueOf(emailSent));
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
