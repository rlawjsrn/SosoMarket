package com.tbk.prj.admin;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonArray;
import com.tbk.prj.member.MemberVO;
import com.tbk.prj.prod.ProdVO;

import common.DAO;

public class AdminDAO extends DAO{
//	전체 회원 조회
	private String memberSelect = "select *\r\n"
								+ "from member\r\n"
								+ "where member_role = 'N'";
//	회원 삭제(단건)
	private String memberDel = "delete from member where member_id = ?";
	
// 상위 판매 회원(top 3)
	private String topSel = "SELECT *\r\n"
							+ "FROM (SELECT member_id, count(member_id) member_count\r\n"
							+ "      FROM product\r\n"
							+ "      WHERE product_status = 1\r\n"
							+ "      GROUP BY member_id\r\n"
							+ "      ORDER BY member_count DESC)\r\n"
							+ "WHERE ROWNUM <= 3";
	
// 승진률 높은 회원 3명
	private String highScore = "SELECT *\r\n"
								+ "FROM (SELECT member_id, rating_score\r\n"
								+ "      FROM member\r\n"
								+ "      WHERE member_role = 'N'\r\n"
								+ "      ORDER BY rating_score DESC)\r\n"
								+ "WHERE ROWNUM <= 3";

// 이달의 판매왕(3명)
	private String monthSell = "SELECT *\r\n"
								+ "FROM (SELECT member_id, count(member_id) as member_count \r\n"
								+ "      FROM product\r\n"
								+ "      WHERE product_status = 1\r\n"
								+ "      AND TO_CHAR(generation_date, 'MM') = TO_CHAR(sysdate, 'MM')\r\n"
								+ "      GROUP BY member_id\r\n"
								+ "      ORDER BY member_count DESC)\r\n"
								+ "WHERE ROWNUM <= 3";

// 전체 회원 카운트
	private String memCount = "select count(member_id) as member_count\r\n"
							+ "from member";
	
// 전체 상품 카운트
	private String prodCount = "select count(product_id) as prod_count\r\n"
								+ "from product";
	
// 오늘 판매된 상품 카운트
	private String todayProd = "select count(product_id) as today_count\r\n"
								+ "from product\r\n"
								+ "where TO_CHAR(generation_date, 'yy/mm/dd') = TO_CHAR(sysdate, 'yy/mm/dd')\r\n"
								+ "and product_status = 1";

//	전체 판매완료 카운트
	private String doneProd = "select count(product_id) as prod_count\r\n"
							+ "from product\r\n"
							+ "where product_status = 1";
	
//  카테고리 차트
	private String charList = "SELECT c.category_id, COUNT(p.product_id) as prodCnt, c.category_name\r\n"
							+ "FROM product p, category c \r\n"
							+ "WHERE SUBSTR(p.product_id, 1, 2) = c.category_id\r\n"
							+ "GROUP BY  c.category_id, SUBSTR(p.product_id, 1, 2), c.category_name";
	
	
//	전체 회원 조회
	public ArrayList<MemberVO> memberSelect(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(memberSelect);
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setPhoneNumber(rs.getString("phone_number"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRatingScore(rs.getInt("rating_score"));
				vo.setEmail(rs.getString("email"));
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
	
//	멤버 삭제
	public int delMem(MemberVO vo) {
		int n = 0;
		try {
			connect();
			psmt = conn.prepareStatement(memberDel);
			psmt.setString(1, vo.getMemberId());
			n = psmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return n;
	}
	
// 상위 판매 회원(탑 3)
	public ArrayList<ProdVO> topSel(){
		ArrayList<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(topSel);
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new ProdVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberCount(rs.getInt("member_count"));
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

// 승진률 높은 회원 (탑 3)
	public ArrayList<MemberVO> highScore(){
		ArrayList<MemberVO> list = new ArrayList<MemberVO>();
		MemberVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(highScore);
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setRatingScore(rs.getInt("rating_score"));
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}

// 이달의 판매왕(3명)
	public ArrayList<ProdVO> monthSell(){
		ArrayList<ProdVO> list = new ArrayList<ProdVO>();
		ProdVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(monthSell);
			rs = psmt.executeQuery(); // record set을 return 함.
			while (rs.next()) {
				vo = new ProdVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setMemberCount(rs.getInt("member_count"));
				list.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return list;
	}
	
// 전체 회원 카운트
	public MemberVO memCount(MemberVO vo) {
		try {
			connect();
			psmt = conn.prepareStatement(memCount);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setMemberCount(rs.getInt("member_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return vo;
	}
	
// 전체 상품 카운트
	public ProdVO prodCount(ProdVO vo) {
		try {
			connect();
			psmt = conn.prepareStatement(prodCount);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setProdCount(rs.getInt("prod_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return vo;
	}	
	
// 오늘 거래된 상품 카운트
	public ProdVO todayProd(ProdVO vo) {
		try {
			connect();
			psmt = conn.prepareStatement(todayProd);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setTodayCount(rs.getInt("today_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return vo;
	}
	
// 전체 상품에서 거래 완료된 상품 카운트
	public ProdVO doneProd(ProdVO vo) {
		try {
			connect();
			psmt = conn.prepareStatement(doneProd);
			rs = psmt.executeQuery();
			if(rs.next()) {
				vo.setTodayCount(rs.getInt("prod_count"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return vo;
	}	

	
// 카테고리 분류별 차트(json으로 값 넘기기)
	public JsonArray categoryChart() {
		JsonArray jsonArray = new JsonArray();
		JsonArray colNameArray = new JsonArray(); // 컬 타이틀 설정
		colNameArray.add("카테고리");
		colNameArray.add("수량");
		try {
			connect();
			psmt = conn.prepareStatement(charList);
			rs = psmt.executeQuery();
			while (rs.next()) {
				JsonArray rowArray = new JsonArray();
				rowArray.add(rs.getString("category_name"));
				rowArray.add(rs.getInt("prodCnt"));
				jsonArray.add(rowArray);
			}
		}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				disconnect();
			}
			return jsonArray;
		}

}
