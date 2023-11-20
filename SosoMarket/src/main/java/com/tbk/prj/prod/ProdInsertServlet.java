package com.tbk.prj.prod;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ProdInsert.do")
public class ProdInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProdInsertServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ProdInsertServlet 실행되니???");

		ServletContext context = getServletContext();
		String saveDir = "C:\\Users\\wldls\\git\\sosomarket\\SosoMarket\\src\\main\\webapp\\upload";
		int maxSize = 1024 * 1024 * 30;
		String encoding = "UTF-8";
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
				new DefaultFileRenamePolicy()); // 1. request, 2.saveDir, 3. maxFileSize, 4.encoding, 5. renamePolicy

		String category = multi.getParameter("category");
		String prodName = multi.getParameter("prodName");
		String prodPrice = multi.getParameter("prodPrice");
		String placeTrans = multi.getParameter("place");
		String prodDscrp = multi.getParameter("prodDscrp");
		String memberId = multi.getParameter("memberId");
		
		System.out.println(memberId + "============================");

		ProdDAO dao = new ProdDAO();
		ProdVO prodVo = new ProdVO();
		ProdVO prodIdVo = new ProdVO();
		prodVo = dao.insertProd(category, prodName, prodPrice, placeTrans, prodDscrp, memberId); // db 순서대로
		prodIdVo = dao.getProdId();

		// 여기서 파일명을 반환하거나, 다른 처리를 수행할 수 있습니다.
		String image1 = multi.getFilesystemName("file1"); // 파일이름
		String image2 = multi.getFilesystemName("file2"); // 파일이름
		String image3 = multi.getFilesystemName("file3"); // 파일이름
		System.out.println("이거 다 찍어봐: " + image1 + image2 + image3);
		
		int i = 0;
		Enumeration e = multi.getFileNames(); // 폼의 이름 반환
		while (e.hasMoreElements()) {
			String eleName = (String) e.nextElement();
			String fileName = multi.getFilesystemName(eleName);
			if (fileName != null) {
				++i;
				// 이름 바꿔 업로드
				File originFile = new File(saveDir + "/" + fileName);
				String originFileName = originFile.getName();
				String ext = originFileName.substring(originFileName.lastIndexOf("."));
				String fileTempName = prodIdVo.getProdId() + "fl000" + i + ext;
				File tempFile = new File(saveDir + "/" + fileTempName);

				if (!originFile.renameTo(tempFile)) {
					System.out.println("파일명변경 실패");
				}
			}
		}

		dao.insertProdPhoto(prodIdVo.getProdId(), image3, image2, image1);
		Gson gson = new GsonBuilder().create();
		response.getWriter().println(gson.toJson(prodVo));
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/ProdList.do");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
