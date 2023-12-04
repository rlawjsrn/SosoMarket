package com.tbk.prj.prod;

import java.io.File;
import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ProdUpdate.do")
public class ProdUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdUpdateServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("prodUpdateServlet실행");

		ServletContext context = getServletContext();
		String rootDir = getServletContext().getRealPath("/");
		String saveDir = rootDir + "upload";
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
				new DefaultFileRenamePolicy()); // 1. request, 2.saveDir, 3. maxFileSize, 4.encoding, 5. renamePolicy
		
		// 상품 정보 및 이미지 수정을 위한 데이터 가져오기
		String prodId = multi.getParameter("prodId");
		String memberId = multi.getParameter("memberId");
		String category = multi.getParameter("category");
		String prodName = multi.getParameter("prodName");
		String prodPrice = multi.getParameter("prodPrice").replaceAll("[^\\uAC00-\\uD7A3\\dA-Za-z\\s]", "");
		String placeTrans = multi.getParameter("place");
		String prodDscrp = multi.getParameter("prodDscrp");

		ProdVO vo = new ProdVO();
		vo.setProdName(prodName);
		vo.setProdPrice(prodPrice);
		vo.setPlaceTrans(placeTrans);
		vo.setProdDscrp(prodDscrp);
		vo.setProdId(prodId);

		ProdDAO dao = new ProdDAO();
		int result = dao.updateProd(vo);

		if (result > 0) {
			System.out.println("성공!!");
		}else {
			System.out.println("실패!!");
		}
		
		// 새로운 이미지 파일 업로드
		String prodPic1 = multi.getFilesystemName("file1");
		String prodPic2 = multi.getFilesystemName("file2");
		String prodPic3 = multi.getFilesystemName("file3");

		System.out.println("소소마켓 수정 서블릿: " + prodId + ":" + memberId + ":" + category + ":" + prodName + ":"
				+ placeTrans + ":" + prodPrice + ":" + prodDscrp + ":" + prodPic1 + ":" + prodPic2 + ":" + prodPic3);
		
		response.sendRedirect("/SosoMarket/ProdOne.do?prodId=" + prodId);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
