package com.tbk.prj.chat;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.DAO;

public class ChatListDAO extends DAO {

//	private final String MemberChatList = "select c.chat_id, p.product_name, m.chat_message, m.generation_date\r\n"
//			+ "from chat c\r\n" + "     inner join product p on c.product_id = p.product_id\r\n"
//			+ "     inner join (SELECT chat_id, chat_message, read_or_not, generation_date\r\n"
//			+ "                 FROM chat_message\r\n"
//			+ "                 WHERE (chat_id, generation_date) IN (SELECT chat_id, MAX(generation_date)\r\n"
//			+ "                                                      FROM chat_message\r\n"
//			+ "                                                      GROUP BY chat_id)) m\r\n"
//			+ "                 on c.chat_id = m.chat_id\r\n" + "where p.member_id = 'test3'\r\n"
//			+ "   or c.buyer_id = 'test3'";
	
	private final String MemberChatList = "select c.chat_id, c.buyer_id, mc.nickname as buyer_nickname, p.member_id, mp.nickname, p.product_id, p.product_name, m.chat_message, m.generation_date\r\n"
			+ "from chat c\r\n"
			+ "     inner join product p on c.product_id = p.product_id\r\n"
			+ "     inner join (SELECT chat_id, chat_message, read_or_not, generation_date\r\n"
			+ "                 FROM chat_message\r\n"
			+ "                 WHERE (chat_id, generation_date) IN (SELECT chat_id, MAX(generation_date)\r\n"
			+ "                                                      FROM chat_message\r\n"
			+ "                                                      GROUP BY chat_id)) m\r\n"
			+ "                 on c.chat_id = m.chat_id\r\n"
			+ "     LEFT JOIN member mc ON c.buyer_id = mc.member_id\r\n"
			+ "     LEFT JOIN member mp ON p.member_id = mp.member_id\r\n"
			+ "where p.member_id = ?\r\n"
			+ "   or c.buyer_id = ?";

	public ArrayList<ChatVO> selectChatList(ChatVO vo) {
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		
		try {
			connect();
			psmt = conn.prepareStatement(MemberChatList);
			psmt.setString(1, vo.getMember_id());
			psmt.setString(2, vo.getMember_id());
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new ChatVO();
				vo.setChat_id(rs.getString("chat_id"));
				vo.setBuyer_id(rs.getString("buyer_id"));
				vo.setBuyer_nickname(rs.getString("buyer_nickname"));
				vo.setMember_id(rs.getString("member_id"));
				vo.setNickname(rs.getString("nickname"));
				vo.setProduct_id(rs.getString("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setChat_message(rs.getString("chat_message"));
				vo.setGeneration_date(rs.getString("generation_date").substring(2, 16));
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
