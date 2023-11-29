package com.tbk.prj.prod;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.nio.file.Files;

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
		
		String prodId = request.getParameter("prodId");
	
		// 우선 기존 이미지 파일 삭제
		if (prodId != null && !prodId.isEmpty()) {
			String rootDir = getServletContext().getRealPath("/");
			String saveDir = rootDir + "upload";
			System.out.println(saveDir);
			int maxSize = 1024 * 1024 * 30;
			String encoding = "UTF-8";
			MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
					new DefaultFileRenamePolicy()); 
			
			String category = multi.getParameter("category");
			String prodName = multi.getParameter("prodName");
			String prodPrice = multi.getParameter("prodPrice");
			String placeTrans = multi.getParameter("place");
			String prodDscrp = multi.getParameter("prodDscrp");
//			String prodPic = multi.getFilesystemName();
			
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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
