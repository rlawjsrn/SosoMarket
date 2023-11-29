package com.tbk.prj.prod;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.FileSystems;
import java.nio.file.Files;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProdDel.do")
public class ProdDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdDelServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProdDelServlet 실행되니??????");

		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");

		String prodId = request.getParameter("prodId");
		System.out.println("삭제서블릿입니다: " + prodId);

		if (prodId != null && !prodId.isEmpty()) {
			String rootDir = getServletContext().getRealPath("/");
			String saveDir = rootDir + "upload";
			System.out.println(saveDir);

			// 이미지 파일명 생성
			String imageFileName1 = prodId + "fl0001.png";
			String imageFileName2 = prodId + "fl0002.png";
			String imageFileName3 = prodId + "fl0003.png";

			// 이미지 파일 삭제
			try {
				Files.deleteIfExists(FileSystems.getDefault().getPath(saveDir + imageFileName1));
				Files.deleteIfExists(FileSystems.getDefault().getPath(saveDir + imageFileName2));
				Files.deleteIfExists(FileSystems.getDefault().getPath(saveDir + imageFileName3));
				System.out.println("이미지 파일 삭제 완료");
			} catch (IOException e) {
				e.printStackTrace();
				System.err.println("이미지 파일 삭제 중 오류 발생: " + e.getMessage());
			}
		}
		ProdDAO dao = new ProdDAO();
		boolean prodPhotoDeleted = dao.deleteProdPhoto(prodId);
		boolean prodDeleted = dao.deleteProd(prodId);
		PrintWriter out = response.getWriter();

		if (prodDeleted && prodPhotoDeleted) {
			System.out.println("상품 삭제");
		} else {
			System.out.println("상품 삭제 실패");
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdList.do");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}