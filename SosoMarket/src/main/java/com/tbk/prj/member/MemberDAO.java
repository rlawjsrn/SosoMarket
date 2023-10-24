package com.tbk.prj.member;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class MemberDAO extends DAO {

	String sql;

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
		}
		return memberlist;
		
	}
}
