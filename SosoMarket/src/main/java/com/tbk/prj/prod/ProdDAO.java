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

// 상품 한 건 조회(상품정보)
	public ProdVO prodOneList(String prodId) {
		ProdVO vo = null;
		try {
			connect();
			String sql = "SELECT p.product_id, c.category_name, p.product_name, p.product_status, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, p.product_views, p.product_description, p.generation_date, p.place_transaction, p.member_id\r\n"
					+ "FROM product p, category c\r\n" + "WHERE SUBSTR(p.product_id,1,2) = c.category_id\r\n"
					+ "AND product_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodId);
			rs = psmt.executeQuery();

			if (rs.next()) {
				System.out.println("if문까지 들어왔니?");
				vo = new ProdVO();
				vo.setProdId(rs.getString("product_id"));
				vo.setCategory(rs.getString("category_name"));
				vo.setProdName(rs.getString("product_name"));

				if (rs.getString("product_status").equals("0")) {
					vo.setProdStatus("판매중");
				} else if (rs.getString("product_status").equals("1")) {
					vo.setProdStatus("거래완료");
				} else {
					vo.setProdStatus("예약중");
				}
				vo.setProdPrice(rs.getString("product_price"));
				vo.setProdViews(rs.getInt("product_views"));
				vo.setProdDscrp(rs.getString("product_description"));
				vo.setProdGenerationDate(rs.getDate("generation_date"));
				vo.setPlaceTrans(rs.getString("place_transaction"));
				vo.setMemberId(rs.getString("member_id"));
				System.out.println("한 건 조회 VO: " + vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return vo;
	}

// 상품 한 건 조회(상품 사진)
	public ArrayList<ProdVO> prodOnePhotoList(String prodId) {
		ArrayList<ProdVO> list = new ArrayList<>();
		try {
			connect();
			String sql = "SELECT pp.product_photo_name\r\n" + "FROM product_photo pp, product p\r\n"
					+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND p.product_id=?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, prodId);
			rs = psmt.executeQuery();

			while (rs.next()) {
				ProdVO vo = new ProdVO();
				vo.setProdPhotoName(rs.getString("product_photo_name"));
				list.add(vo);
				System.out.println("사진 조회: " + list);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
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
	// 상품 전체 조회 필터링
	public ArrayList<ProdVO> selectFiltering(String stOption, String qtOption, String[] categories, int priceMin,
			int priceMax) {
		connect();
		System.out.println("정렬조건: " + stOption + "정렬갯수: " + qtOption + "카테고리: " + categories + "최저가: " + priceMin
				+ "최고가: " + priceMax);
		ArrayList<ProdVO> list = new ArrayList<>();
		StringBuilder sql = new StringBuilder(
				"SELECT p.product_id, c.category_name, p.product_name, TO_CHAR(p.product_price, 'FM999,999,999,999') as product_price, pp.product_photo_id\r\n"
						+ "FROM (SELECT product_id, product_name, product_price FROM product ");

		// 쿼리에 정렬 옵션 추가
		if ("0".equals(stOption)) { // 조회 많은 순
			sql.append("ORDER BY product_views DESC ");
		} else if ("1".equals(stOption)) { // 최근 등록 순
			sql.append("ORDER BY generation_date DESC ");
		}

		sql.append(
				") p, product_photo pp, category c\r\n" + "WHERE SUBSTR(pp.product_photo_name,1,6) = p.product_id\r\n"
						+ "AND SUBSTR(p.product_id,1,2) = c.category_id\r\n"
						+ "AND SUBSTR(pp.product_photo_name,7,6) = 'fl0001' ");

		// 선택한 카테고리
		if (categories != null && categories.length > 0) {
			sql.append("AND (");
			for (int i = 0; i < categories.length; i++) {
				sql.append("SUBSTR(p.product_id,1,2) = ?");
				if (i < categories.length - 1) {
					sql.append(" OR ");
				}
			}
			sql.append(") ");
		}

		// 가격 범위
		if (priceMin != 0 && priceMax != 0) {
			sql.append("AND p.product_price BETWEEN ? AND ?");
		} else if (priceMin != 0 && priceMax == 0) {
			sql.append("AND p.product_price >= ?");
		} else if (priceMin == 0 && priceMax != 0) {
			sql.append("AND p.product_price <= ?");
		}

		// 행 제한
		if ("0".equals(qtOption)) {
			sql.append(" AND ROWNUM <= 20");
		} else if ("1".equals(qtOption)) {
			sql.append(" AND ROWNUM <= 50");
		}

		System.out.println("쿼리 보여줘: " + sql);

		try {
			psmt = conn.prepareStatement(sql.toString());

			int paramIndex = 1;

			// 선택한 카테고리
			if (categories != null && categories.length > 0) {
				for (String category : categories) {
					psmt.setString(paramIndex++, category);
				}
			}

			// 가격 범위
			if (priceMin != 0 || priceMax != 0) {
				if (priceMin != 0) {
					psmt.setInt(paramIndex++, priceMin);
				}
				if (priceMax != 0) {
					psmt.setInt(paramIndex++, priceMax);
				}
			}

			rs = psmt.executeQuery();
			while (rs.next()) {
				ProdVO vo = new ProdVO();

				vo.setProdId(rs.getString("product_id")); // 상품 아이디
				vo.setCategory(rs.getString("category_name")); // 카테고리명
				vo.setProdName(rs.getString("product_name")); // 상품명

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
