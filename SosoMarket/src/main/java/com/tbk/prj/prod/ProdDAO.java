package com.tbk.prj.prod;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import common.DAO;

public class ProdDAO extends DAO {
// 상품 전체 조회
	public ArrayList<ProdVO> getProdList() {
		connect();
		ArrayList<ProdVO> list = new ArrayList<>();
		String sql = "SELECT  p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, pp.product_photo_name \r\n"
				+ "FROM product p, product_photo pp, category c\r\n"
				+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id \r\n"
				+ "AND substr(p.product_id,1,2) = c.category_id\r\n"
				+ "AND substr(pp.product_photo_name,7,6) = 'fl0001'";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();

				vo.setProdId(rs.getString("product_id")); // 상품 아이디
				vo.setCategory(rs.getString("category_name")); // 카테고리명
				vo.setProdName(rs.getString("product_name")); // 상품명
				vo.setProdPrice(rs.getString("product_price")); // 판매가액
				vo.setProdPhotoName(rs.getString("product_photo_name")); // 상품사진아이디

				System.out.println("사진이름 띄워봐: " + rs.getString("product_photo_name"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

// 인기 상품 조회
	public ArrayList<ProdVO> getPopularProdList() {
		connect();
		ArrayList<ProdVO> list = new ArrayList<>();
		String sql = "SELECT p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, pp.product_photo_name \r\n"
				+ "FROM(SELECT  product_id, product_name, product_price \r\n" + "FROM product\r\n"
				+ "ORDER BY product_views DESC ) p, product_photo pp, category c\r\n"
				+ "WHERE SUBSTR(pp.product_photo_name,1,6) = p.product_id\r\n"
				+ "AND SUBSTR(p.product_id,1,2) = c.category_id\r\n" + "AND ROWNUM <= 3\r\n"
				+ "AND SUBSTR(pp.product_photo_name,7,6) = 'fl0001'";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdId(rs.getString("product_id")); // 상품 아이디
				vo.setCategory(rs.getString("category_name")); // 카테고리명
				vo.setProdName(rs.getString("product_name")); // 상품명
				vo.setProdPrice(rs.getString("product_price")); // 판매가액
				vo.setProdPhotoName(rs.getString("product_photo_name")); // 상품사진아이디
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

// 상품 정보 등록
	public ProdVO insertProd(String category, String prodName, String prodPrice, String placeTrans, String prodDscrp,
			String memberId) {
		connect();
		// 상품 정보 등록
		String prodSql = "INSERT INTO product (product_id, product_name, product_price, product_description, place_transaction, member_id) "
				+ "VALUES(CONCAT(?, LPAD(prodSeq.nextval,4,0)), ?, ?, ?, ?, ?)";

		try {
			psmt = conn.prepareStatement(prodSql);
			psmt.setString(1, category);
			psmt.setString(2, prodName);
			psmt.setString(3, prodPrice);
			psmt.setString(4, prodDscrp);
			psmt.setString(5, placeTrans);
			psmt.setString(6, memberId);

			int r = psmt.executeUpdate();
			System.out.println(r + "건 입력.");

		} catch (

		SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			disconnect();
		}
		return null;
	}

// 상품아이디 값 조회
	public ProdVO getProdId() {
		connect();
		String sql = "SELECT product_id \r\n" + "FROM product\r\n" + "WHERE 1=1 \r\n"
				+ "AND  SUBSTR(product_id, 3,4) = (SELECT MAX(SUBSTR(product_id, 3,4)) FROM product)";
		ProdVO vo = new ProdVO();
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery(); // 쿼리실행 -> 결과값 도출

			// 쿼리 값이 있다면
			if (rs.next()) {
				vo.setProdId(rs.getString("product_id"));
			}
			return vo;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} finally {
			disconnect();
		}
	}

	// 상품 이미지 등록
	public ProdVO insertProdPhoto(String prodId, String image3, String image2, String image1) {
		connect();
		String photoSql = "INSERT INTO product_photo (product_photo_id, product_photo_name) ";
		try {
			// 받아온 파일의 갯수 파악을 위한 cnt 변수
			int cnt = 0;

			if (image3 != null) {
				cnt++;
			}
			if (image2 != null) {
				cnt++;
			}
			if (image1 != null) {
				cnt++;
			}
			// 파일의 수 만큼 values 쿼리 생성
			for (int i = 0; i < cnt; i++) {

				photoSql += "SELECT ?, CONCAT(?, ?) FROM DUAL UNION ALL ";
			}
			// 마지막 UNION ALL 제거
			photoSql = photoSql.substring(0, photoSql.length() - 10);

			// 각 사진에 대한 파일 이름 및 category 지정
			psmt = conn.prepareStatement(photoSql);
			int paramIndex = 1;

			for (int i = 0; i < cnt; i++) {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT 'pp' || LPAD(prodPhotoSeq.nextval, 4, '0') FROM DUAL");
				if (rs.next()) {
					String newProductPhotoId = rs.getString(1);

					psmt.setString(paramIndex++, newProductPhotoId);
					psmt.setString(paramIndex++, prodId); // 첫 번째 ?에 prodId 값을 설정
					psmt.setString(paramIndex++, "fl000" + (i + 1)); // 두 번째 ?에 파일 이름을 설정
				} else {
					System.out.println("값 없음");
				}
			}

			int r = psmt.executeUpdate();
			System.out.println(r + "건 입력.");

		} catch (SQLException e) {
			e.printStackTrace();
			return null;

		} finally {
			disconnect();
		}
		return null;
	}

// 상품 수정

// 상품 삭제

// 카테고리 목록
	public ArrayList<ProdVO> getCategoryList() {
		connect();
		ArrayList<ProdVO> list = new ArrayList<>();
		String sql = "SELECT c.category_id, COUNT(p.product_id) as prodCnt, c.category_name\r\n"
				+ "FROM product p, category c\r\n" + "WHERE SUBSTR(p.product_id, 1, 2) = c.category_id\r\n"
				+ "GROUP BY  c.category_id, SUBSTR(p.product_id, 1, 2), c.category_name";
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setCategoryId(rs.getString("category_id"));
				vo.setCategory(rs.getString("category_name")); // 카테고리명
				vo.setCntCtgr(rs.getInt("prodCnt")); // 카테고리별 상품 갯수

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

// 상품 전체 조회 필터링
	public ArrayList<ProdVO> selectFiltering(String stOption, String qtOption, String[] category, int priceMin,
			int priceMax) {
		connect();
		ArrayList<ProdVO> list = new ArrayList<>();
		String sql = "SELECT  p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, pp.product_photo_id\r\n"
				+ "FROM product p, product_photo pp, category c\r\n"
				+ "WHERE SUBSTR(pp.product_photo_name,1,6) = p.product_id\r\n"
				+ "AND SUBSTR(p.product_id,1,2) = c.category_id\r\n"
				+ "AND SUBSTR(pp.product_photo_name,7,6) = 'fl0001' ";
		// 선택한 카테고리
		if (category != null) {
			for (int i = 0; i < category.length; i++) {
				sql += "AND SUBSTR(p.product_id,1,2) = ? ";
			}
		}

//		psmt.setString(, );

		// 선택한 가격 범위
		sql += "AND p.product_price BETWEEN ? AND ? ";

		// 선택한 상품 갯수
		sql += "AND ROWNUM <= ? ";

		// 선택한 정렬 조건
		sql += "ORDER BY ?";

		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			sql += "AND substr(p.product_id,1,2) = ? \r\n";

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setCategory(rs.getString("category_name")); // 카테고리명
				vo.setCntCtgr(rs.getInt("prodCnt")); // 카테고리별 상품 갯수

				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
}
