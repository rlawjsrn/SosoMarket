package com.tbk.prj.mypage;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class MypageLikeDAO extends DAO {
//	회원별 찜 목록 쿼리
	private final String MypageLikeMemberList = "SELECT p.product_id, pi.product_interest_id, pi.member_id, pp.product_photo_id, p.product_name, p.product_status, p.product_price\r\n"
			+ "FROM product p, product_interest pi, product_photo pp\r\n"
			+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND pi.product_id = p.product_id\r\n"
			+ "AND pi.member_id = 'test5'\r\n" + "AND pp.product_photo_id IN (SELECT max(product_photo_id)\r\n"
			+ "                            FROM product_photo\r\n"
			+ "                            GROUP BY substr(product_photo_name,1,6))";

	private final String MypageLikeProductCnt = "SELECT COUNT(PRODUCT_ID) FROM PRODUCT_INTEREST WHERE PRODUCT_ID = ?";

//	나의 판매목록
	private final String MypageSellList = "SELECT p.product_id, pp.product_photo_id, p.product_name, p.product_status, p.product_price, p.generation_date\r\n"
			+ "FROM product p, product_photo pp\r\n" + "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n"
			+ "AND p.product_status = 0\r\n" + "AND p.member_id = 'test1'\r\n"
			+ "AND pp.product_photo_id IN (SELECT max(product_photo_id)\r\n"
			+ "                            FROM product_photo\r\n"
			+ "                            GROUP BY substr(product_photo_name,1,6))";

//	나의 구매목록
	private final String MypageBuyList = "SELECT b.buy_id, p.product_id, pp.product_photo_id, p.product_name, p.product_status, p.product_price, p.generation_date\r\n"
			+ "FROM product p, product_photo pp, buy b, member m\r\n"
			+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND b.product_id = p.product_id\r\n"
			+ "AND b.member_id = m.member_id\r\n" + "AND p.product_status = 1\r\n" + "AND b.member_id = 'test2'\r\n"
			+ "AND pp.product_photo_id IN (SELECT max(product_photo_id)\r\n"
			+ "                            FROM product_photo\r\n"
			+ "                            GROUP BY substr(product_photo_name,1,6))";
//  찜 취소
	private final String MypageDelHeart = "delete from product_interest where product_interest_id = ?";

//	회원별 찜 목록
	public ArrayList<MypageLikeVO> selectList() { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		MypageLikeVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(MypageLikeMemberList);
//			psmt.setString(1, vo.getMemberId()); 나중에 member_id 값 넣을 곳
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_interest_id"));
				vo.setProductPhotoId(rs.getString("product_photo_id"));
				vo.setProductName(rs.getString("product_name"));
				vo.setProductStatus(rs.getString("product_status"));
				vo.setProductPrice(rs.getInt("product_price"));
				// vo 에다가 하나씩 담는 과정.
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

//	나의 판매목록
	public ArrayList<MypageLikeVO> sellList() { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		MypageLikeVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(MypageSellList);
//			psmt.setString(1, vo.getMemberId()); 나중에 member_id 값 넣을 곳
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_id"));
				vo.setProductPhotoId(rs.getString("product_photo_id"));
				vo.setProductName(rs.getString("product_name"));
				vo.setProductStatus(rs.getString("product_status"));
				vo.setProductPrice(rs.getInt("product_price"));
				vo.setGenerationDate(rs.getDate("generation_date"));
				// vo 에다가 하나씩 담는 과정.
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

//	나의 구매목록
	public ArrayList<MypageLikeVO> buyList() { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		MypageLikeVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(MypageBuyList);
//			psmt.setString(1, vo.getMemberId()); 나중에 member_id 값 넣을 곳
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setBuyId(rs.getString("buy_id"));
				vo.setProductInterestId(rs.getString("product_id"));
				vo.setProductPhotoId(rs.getString("product_photo_id"));
				vo.setProductName(rs.getString("product_name"));
				vo.setProductStatus(rs.getString("product_status"));
				vo.setProductPrice(rs.getInt("product_price"));
				vo.setGenerationDate(rs.getDate("generation_date"));
				// vo 에다가 하나씩 담는 과정.
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

//	관심상품 취소(삭제)
	public int delHeart(MypageLikeVO vo) {
		int n = 0;
		try {
			connect();
			psmt = conn.prepareStatement(MypageDelHeart);
			psmt.setString(1, vo.getProductInterestId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return n;
	}
}
