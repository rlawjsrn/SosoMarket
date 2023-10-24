package com.tbk.prj.prod;

import java.sql.SQLException;

import common.DAO;

public class ProdOneDAO extends DAO {

	// 상품 한 건 조회
	public ProdVO prodOne(String prodId) {
		connect(); // db연결
		String sql = "SELECT"
				+ "    product.prodId,"
				+ "    product.productName,"
				+ "    product_file.fileId,"
				+ "    product_file.fileName,"
				+ "    product_photo.photoId,"
				+ "    product_photo.photoDescription"
				+ "FROM"
				+ "    product"
				+ "JOIN"
				+ "    product_file ON product.prodId = product_file.prodId"
				+ "JOIN"
				+ ""
				+ "    product_photo ON product_file.fileId = product_photo.fileId;"; // 인자값(사용자가 클릭한 prodId)으로 한 건 조회
		ProdVO prodVo = new ProdVO();
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodId); 

			rs = psmt.executeQuery(); // 쿼리실행 -> 결과값 도출

			if (rs.next()) {// 쿼리 결과값이 있다면
				prodVo.setProdId(rs.getString(prodId));
				prodVo.setProdId(rs.getString(prodId));
			}
			return prodVo;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}

	}
}
