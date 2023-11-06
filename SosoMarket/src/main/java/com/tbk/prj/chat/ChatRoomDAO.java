package com.tbk.prj.chat;

import java.sql.SQLException;
import java.util.ArrayList;

import common.DAO;

public class ChatRoomDAO extends DAO {

	private final String ChatMsgsList = "select member_id, chat_message, generation_date\r\n"
			+ "from chat_message\r\n" + "where chat_id = 'ch00005'\r\n" + "order by generation_date";

	public ArrayList<ChatVO> selectChatMsgs() {
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();
		ChatVO vo;

		try {
			connect();
			psmt = conn.prepareStatement(ChatMsgsList);
			rs = psmt.executeQuery();
			while (rs.next()) {
				vo = new ChatVO();
				vo.setMember_id(rs.getString("member_id"));
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
