package com.tbk.prj.chat;

import java.sql.SQLException;

import common.DAO;

public class ProdStatDAO extends DAO {

	private final String ProdStat = "update product\r\n" + "set product_status = ?\r\n" + "where product_id = ?";

	public int updateProdStat(ChatVO vo) {
		int result = 0;

		System.out.println("updateProdStat!");

		try {
			connect();
			psmt = conn.prepareStatement(ProdStat);
			System.out.println(vo.getProduct_status());
			psmt.setString(1, vo.getProduct_status());
			psmt.setString(2, vo.getProduct_id());
			result = psmt.executeUpdate();
			System.out.println("업데이트완");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return result;
	}
}
