package com.tbk.prj.chat;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class ChatRoomProdDAO extends DAO {
	
	private final String ProdInfoList = "select product_id, product_name, product_status,\r\n"
			+ "to_char(product_price, 'FM999,999,999,999') as product_price\r\n"
			+ "from product\r\n"
			+ "where product_id = ?";

	public ChatVO selectProdInfo(String product_id) {
		ChatVO prodVo = new ChatVO();;

		try {
			connect();
			psmt = conn.prepareStatement(ProdInfoList);
			psmt.setString(1, product_id);
			rs = psmt.executeQuery();
			
			if (rs.next()) {
				prodVo.setProduct_id("product_id");
				prodVo.setProduct_name(rs.getString("product_name"));
				prodVo.setProduct_status(rs.getString("product_status"));
				prodVo.setProduct_price(rs.getString("product_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return prodVo;
	}
}
