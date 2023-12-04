package com.tbk.prj.prod;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ProdPhotoDel.do")

public class ProdPhotoDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdPhotoDelServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("prodPhotoDelServlet실행");

		String prodPhotoName = request.getParameter("prodPhotoName");
		ProdDAO dao = new ProdDAO();
		dao.delModProdPhoto(prodPhotoName);

		String rootDir = getServletContext().getRealPath("/");
		String saveDir = rootDir + "upload";
		String imageFileName = prodPhotoName;
		// 이미지 파일 삭제
		try {
			Files.deleteIfExists(FileSystems.getDefault().getPath(saveDir + imageFileName));
			System.out.println("이미지 파일 삭제 완료");
		} catch (IOException e) {
			e.printStackTrace();
			System.err.println("이미지 파일 삭제 중 오류 발생: " + e.getMessage());
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
