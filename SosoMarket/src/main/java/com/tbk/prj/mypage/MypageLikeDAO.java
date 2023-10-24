package com.tbk.prj.mypage;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class MypageLikeDAO extends DAO{
	
	private final String MypageLikeMemberList = "SELECT * FROM PRODUCT_INTEREST WHERE MEMBER_ID = ?";
	private final String MypageLikeProductCnt = "SELECT COUNT(PRODUCT_ID) FROM PRODUCT_INTEREST WHERE PRODUCT_ID = ?";
	
	public ArrayList<MypageLikeVO> selectList(){
		connect();
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		MypageLikeVO vo;
		
		try {
			psmt = conn.prepareStatement(MypageLikeMemberList);
			rs = psmt.executeQuery(); //record set을 return 함.
			while(rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_interest_id"));
				vo.setMemberId(rs.getString("member_id"));
				vo.setProductId(rs.getString("product_id"));
				vo.setGenerationDate(rs.getDate("generation_date"));
                // vo 에다가 하나씩 담는 과정.
				list.add(vo);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			disconnect();
		}
		return list;
		
	}
}

