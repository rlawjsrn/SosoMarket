package com.tbk.prj.member;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class MemberDAO extends DAO {

	String sql;
	
	public int idCheck(String memberId) {
		connect();
		psmt = null;
		rs = null;
		sql = "SELECT * FROM MEMBER WHERE member_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, memberId);
			rs = psmt.executeQuery();
			if(rs.next()||memberId.equals("")) {
				return 0; // 이미 존재하는 회원
			}else {
				return 1; // 가입 가능한 회원
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			disconnect();
		}
		return -1;  // 데이터 베이스 오류
	}

	// 회원의 전체 조회
	public ArrayList<MemberVO> getMemberList(){
		ArrayList<MemberVO> memberlist = new ArrayList<MemberVO>();
		sql = "select * from member";
		try {
			connect();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MemberVO vo = new MemberVO();
				vo.setMemberId(rs.getString("member_id"));
				vo.setPassword(rs.getString("password"));
				vo.setMemberRole(rs.getString("member_role"));
				vo.setPhoneNumber(rs.getString("phone_number"));
				vo.setEmailVrf(rs.getString("email_vrf"));
				vo.setNickname(rs.getString("nickname"));
				vo.setRatingScore(rs.getInt("rating_score"));
			}
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return memberlist;
		
	}
	
	//회원 가입
		public int insertMember(MemberVO vo) {
			connect();
			psmt = null;
			rs = null;
			sql = "INSERT INTO MEMBER(member_id, password, member_role, phone_number, email_vrf, nickname, rating_score) VALUES(?,?,?,?,?,?,?)";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, vo.getMemberId());
				psmt.setString(2, vo.getPassword());
				psmt.setString(3, vo.getMemberRole());
				psmt.setString(4, vo.getPhoneNumber());
				psmt.setString(5, vo.getEmailVrf());
				psmt.setString(6, vo.getNickname());
				psmt.setInt(7, vo.getRatingScore());
				return psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				disconnect();
			}
			return -1;  // 데이터 베이스 오류
		}
		
	// 로그인
		public MemberVO loginmember(String memberId, String password) {
			connect();
			psmt = null;
			rs = null;
			sql = "SELECT member_id, password FROM MEMBER WHERE member_id = ? AND password";
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, memberId);
				psmt.setString(2, password);
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					MemberVO vo = new MemberVO();
					vo.setMemberId(rs.getString("member_id"));
					vo.setPassword(rs.getString("password"));
					return vo;
				}
			}catch (Exception e) {
				// TODO: handle exception
			}finally {
				disconnect();
			}
			return null;

		}
}
