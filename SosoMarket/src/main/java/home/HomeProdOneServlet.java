package home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tbk.prj.prod.ProdDAO;
import com.tbk.prj.prod.ProdVO;

/**
 * Servlet implementation class HomeProdOneServlet
 */
@WebServlet("/HomeProdOne.do")
public class HomeProdOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String prodId = request.getParameter("prodId");

		System.out.println("상품아이디 찍어봐: " + prodId);

		if (prodId != null && !prodId.isEmpty()) {
			HomeDAO dao = new HomeDAO();
			int r = dao.HomeprodViewCount(prodId);
			ProdVO vo = dao.HomeOne(prodId);
			ArrayList<ProdVO> list = new ArrayList<ProdVO>();
			list = dao.homeOnePhotoList(prodId);
			
			if (vo != null) {
				request.setAttribute("vo", vo);
				request.setAttribute("list", list);
				RequestDispatcher dispatcher = request.getRequestDispatcher("prod/prodOne.jsp"); // 제품 상제조회 페이지로 넘어가야함
				dispatcher.forward(request, response);
			} else {
				response.sendRedirect("/SosoMarket/HomeProd.do"); // 메인화면으로 이동해야함
			}
		} else {
			response.sendRedirect("/SosoMarket/HomeProd.do"); // 메인화면으로 이동해야함
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
