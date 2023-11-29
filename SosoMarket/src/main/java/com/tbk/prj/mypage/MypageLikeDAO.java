package com.tbk.prj.mypage;

import java.sql.SQLException;
import java.util.ArrayList;

import com.tbk.prj.community.CommunityVO;
import com.tbk.prj.member.MemberVO;
import com.tbk.prj.prod.ProdVO;

import common.DAO;

public class MypageLikeDAO extends DAO {
//	회원별 찜 목록 쿼리
	private final String MypageLikeMemberList = "SELECT p.product_id, pi.product_interest_id, pi.member_id, pp.product_photo_name, p.product_name, p.product_status, p.product_price\r\n"
			+ "FROM product p, product_interest pi, product_photo pp\r\n"
			+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND pi.product_id = p.product_id\r\n"
			+ "AND pi.member_id = ?\r\n" + "AND pp.product_photo_id IN (SELECT min(product_photo_id)\r\n"
			+ "                            FROM product_photo\r\n"
			+ "                            GROUP BY substr(product_photo_name,1,6))";

	private final String MypageLikeProductCnt = "SELECT COUNT(PRODUCT_ID) FROM PRODUCT_INTEREST WHERE PRODUCT_ID = ?";

//	나의 판매목록
	private String MypageSellList = "SELECT p.product_id, pp.product_photo_name, p.product_name, p.product_status, p.product_price, p.generation_date\r\n"
										+ "FROM product p, product_photo pp\r\n"
										+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n"
										+ "AND p.member_id = ?\r\n"
										+ "AND pp.product_photo_id IN (SELECT max(product_photo_id)\r\n"
										+ "                            FROM product_photo\r\n"
										+ "                            GROUP BY substr(product_photo_name,1,6))";

//	나의 구매목록
	private final String MypageBuyList = "SELECT b.buy_id, p.product_id, pp.product_photo_name, p.product_name, p.product_status, p.product_price, p.generation_date\r\n"
										+ "FROM product p, product_photo pp, buy b, member m\r\n"
										+ "WHERE substr(pp.product_photo_name,1,6) = p.product_id\r\n" + "AND b.product_id = p.product_id\r\n"
										+ "AND b.member_id = m.member_id\r\n" + "AND p.product_status = 1\r\n" + "AND b.member_id = ?\r\n"
										+ "AND pp.product_photo_id IN (SELECT max(product_photo_id)\r\n"
										+ "                            FROM product_photo\r\n"
										+ "                            GROUP BY substr(product_photo_name,1,6))";
//  찜 취소
	private final String MypageDelHeart = "delete from product_interest where product_interest_id = ?";
	
//  커뮤니티 - 내가 쓴 글
	private final String MypageCom = "select *\r\n"
									+ "from community\r\n"
									+ "where member_id = ?";
	
//	찜 목록 조회
	private final String MylikeList = "select pi.product_interest_id, pi.member_id, p.product_id\r\n"
									+ "from product p, product_interest pi\r\n"
									+ "where p.product_id = pi.product_id\r\n"
									+ "and p.product_id = ?\r\n"
									+ "and pi.member_id = ?";		
	
//  찜 추가(insert)
	private final String insertLike = "insert into product_interest values(CONCAT('pi', LPAD(prodInterSeq.nextval,4,0)), ?, ?, sysdate)";

//	회원별 찜 목록
	public ArrayList<MypageLikeVO> selectList(MypageLikeVO vo) { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		try {
			connect();
			psmt = conn.prepareStatement(MypageLikeMemberList);
			psmt.setString(1, vo.getMemberId());
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_interest_id"));
				vo.setProductPhotoName(rs.getString("product_photo_name"));
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
	public ArrayList<MypageLikeVO> sellList(MypageLikeVO vo) { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		try {
			connect();
			psmt = conn.prepareStatement(MypageSellList);
			psmt.setString(1, vo.getMemberId());
			if(vo.getProductStatus() != null) {
				MypageSellList += "AND p.product_status = ?";
				psmt.setString(2, vo.getProductStatus());
			}
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_id"));
				vo.setProductPhotoName(rs.getString("product_photo_name"));
				vo.setProductName(rs.getString("product_name"));
				vo.setProductStatus(rs.getString("product_status"));
				vo.setProductPrice(rs.getInt("product_price"));
				vo.setGenerationDate(rs.getDate("generation_date"));
				// vo 에다가 하나씩 담는 과정.
				list.add(vo);
				System.out.println(MypageSellList);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

//	나의 구매목록
	public ArrayList<MypageLikeVO> buyList(MypageLikeVO vo) { // MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		try {
			connect();
			psmt = conn.prepareStatement(MypageBuyList);
			psmt.setString(1, vo.getMemberId());
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MypageLikeVO();
				vo.setBuyId(rs.getString("buy_id"));
				vo.setProductInterestId(rs.getString("product_id"));
				vo.setProductPhotoName(rs.getString("product_photo_name"));
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
	
// 커뮤니티(내가 쓴 글 목록)
	public ArrayList<CommunityVO> myCommunity(CommunityVO vo) { // MypageLikeVO vo
		ArrayList<CommunityVO> list = new ArrayList<CommunityVO>();
		try {
			connect();
			psmt = conn.prepareStatement(MypageCom);
			psmt.setString(1, vo.getMemberId());
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new CommunityVO();
				vo.setPostId(rs.getString("post_id"));
				vo.setPostTitle(rs.getString("post_title"));
				vo.setPostDetail(rs.getString("post_detail"));
				vo.setPostViews(rs.getInt("post_views"));
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
	
//	찜 표시 쿼리
	public ProdVO MyLike(ProdVO vo) {
		try {
			connect();
			psmt = conn.prepareStatement(MylikeList);
			psmt.setString(1, vo.getProdId());
			psmt.setString(2, vo.getMemberId());
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setProdInterestId(rs.getString("product_interest_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setProdId(rs.getString("product_id"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return vo;
	}
	
//	관심상품 insert
	public int insertLike(MypageLikeVO vo) {
		int n = 0;
		try {
			connect();
			psmt = conn.prepareStatement(insertLike);
			psmt.setString(1, vo.getMemberId());
			psmt.setString(2, vo.getProductId());
			n = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return n;
	}
}
