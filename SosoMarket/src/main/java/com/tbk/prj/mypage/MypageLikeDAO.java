package com.tbk.prj.mypage;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class MypageLikeDAO extends DAO{
	
	private final String MypageLikeMemberList = "SELECT pi.product_interest_id, pi.member_id, pp.product_photo_id, p.product_name, p.product_status, p.product_price\r\n"
												+ "FROM product p, product_interest pi, product_photo pp\r\n"
												+ "WHERE pp.product_id = p.product_id\r\n"
												+ "AND pi.product_id = p.product_id\r\n"
												+ "AND pi.member_id = 'test2'";
	private final String MypageLikeProductCnt = "SELECT COUNT(PRODUCT_ID) FROM PRODUCT_INTEREST WHERE PRODUCT_ID = ?";
	
	public ArrayList<MypageLikeVO> selectList(){	//MypageLikeVO vo
		ArrayList<MypageLikeVO> list = new ArrayList<MypageLikeVO>();
		MypageLikeVO vo;
		try {
			connect();
			psmt = conn.prepareStatement(MypageLikeMemberList);
//			psmt.setString(1, vo.getMemberId());
			rs = psmt.executeQuery(); //record set을 return 함.
			while(rs.next()) {
				vo = new MypageLikeVO();
				vo.setProductInterestId(rs.getString("product_interest_id"));
				vo.setProductPhotoId(rs.getString("product_photo_id"));
				vo.setProductName(rs.getString("product_name"));
				vo.setProductStatus(rs.getString("product_status"));
				vo.setProductPrice(rs.getInt("product_price"));
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

