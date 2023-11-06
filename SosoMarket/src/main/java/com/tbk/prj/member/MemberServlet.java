package com.tbk.prj.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MemberServlet
 */
@WebServlet("/SignIn.do")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String memberId = request.getParameter("memberId");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		String memberRole = "N";
		String phoneNumber = request.getParameter("phoneNumber");
		String emailVrf = request.getParameter("emailVrf");
		String nickname = request.getParameter("nickname");
		int ratingScore = 0;
		if(memberId == null || memberId.equals("")||password == null || password.equals("")||
		  password2 == null || password2.equals("")||memberRole == null || memberRole.equals("")||
		  phoneNumber == null || phoneNumber.equals("")|| emailVrf == null || emailVrf.equals("")||
		  nickname == null || nickname.equals("")){
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("member/signin.jsp");
			return;
		}
		// 비밀번호 일치 확인
		if(!password.equals(password2)){
					request.getSession().setAttribute("messageType", "오류 메세지");
					request.getSession().setAttribute("messageContent", "비밀번호가 서로 일치하지 않습니다.");
					response.sendRedirect("member/signin.jsp");
					return;
				}
		
		MemberVO vo = new MemberVO();
		vo.setMemberId(memberId);
		vo.setPassword(password);
		vo.setMemberRole(memberRole);
		vo.setPhoneNumber(phoneNumber);
		vo.setEmailVrf(emailVrf);
		vo.setNickname(nickname);
		vo.setRatingScore(ratingScore);
		int result = new MemberDAO().insertMember(vo);
		if(result == 1) {
			request.getSession().setAttribute("messageType", "성공 메세지");
			request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
			response.sendRedirect("member/signin.jsp");
			return;
		}else {
			request.getSession().setAttribute("messageType", "오류 메세지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("member/signin.jsp");
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
