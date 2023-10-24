package com.tbk.prj.prod;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.DAO;

public class ProdDAO extends DAO {
// 상품 전체 조회
	public List<ProdVO> getProdList() {
		connect();
		List<ProdVO> list = new ArrayList<>();
		String sql = "select * from product";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdId(rs.getString("prodId")); // 상품 아이디
				vo.setProdName(rs.getString("prodName")); // 상품명
				vo.setProdPrice(rs.getInt("prodPrice")); // 판매가액
				vo.setProdPhotoId(rs.getString("prodPhotoId")); // 상품사진아이디

				list.add(vo);
				System.out.println("vo:" + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;

	}
// 상품 등록

// 상품 수정

// 상품 삭제

}
