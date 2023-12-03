package com.tbk.prj.chat;

import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.DAO;

public class ChatDAO extends DAO {

	private ChatVO vo;
	private String sql;

	// 채팅 목록 조회
	public ArrayList<ChatVO> selectChatList(ChatVO vo) {
		sql = "select c.chat_id, c.buyer_id, mc.nickname as buyer_nickname, p.member_id, mp.nickname, p.product_id, p.product_name, m.chat_message, m.generation_date, pp.product_photo_name\r\n"
				+ "from chat c\r\n"
				+ "     inner join product p on c.product_id = p.product_id\r\n"
				+ "     inner join (SELECT chat_id, chat_message, read_or_not, generation_date\r\n"
				+ "                 FROM chat_message\r\n"
				+ "                 WHERE (chat_id, generation_date) IN (SELECT chat_id, MAX(generation_date)\r\n"
				+ "                                                      FROM chat_message\r\n"
				+ "                                                      GROUP BY chat_id)) m\r\n"
				+ "                                \r\n"
				+ "                 on c.chat_id = m.chat_id\r\n"
				+ "     LEFT JOIN member mc ON c.buyer_id = mc.member_id\r\n"
				+ "     inner JOIN product_photo pp on c.product_id = substr(pp.product_photo_name,1,6)\r\n"
				+ "     LEFT JOIN member mp ON p.member_id = mp.member_id \r\n"
				+ "where (c.buyer_id = ?\r\n"
				+ "or p.member_id = ?)\r\n"
				+ "and SUBSTR(pp.product_photo_name,7,6) = 'fl0001'";
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();

		try {
			connect();
			psmt = conn.prepareStatement(sql);
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
				vo.setProdPhotoName(rs.getString("product_photo_name"));
				list.add(vo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return list;
	}

	// 채팅방 메세지 조회
	public ArrayList<ChatVO> selectChatMsgs(String chat_id) {
		sql = "select member_id, chat_message, generation_date\r\n" + "from chat_message\r\n" + "where chat_id = ?\r\n"
				+ "order by generation_date";
		ArrayList<ChatVO> list = new ArrayList<ChatVO>();

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, chat_id);
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

	// 채팅방 상품 정보 조회
	public ChatVO selectProdInfo(String chat_id) {
		sql = "select p.member_id, c.buyer_id, p.product_id, p.product_name, p.product_status,\r\n"
				+ "       to_char(product_price, 'FM999,999,999,999') as product_price\r\n"
				+ "from chat c left join product p on c.product_id = p.product_id\r\n" + "where c.chat_id = ?";

		try {
			vo = new ChatVO();
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, chat_id);
			rs = psmt.executeQuery();

			if (rs.next()) {
				vo.setChat_id(chat_id);
				vo.setProd_mem_id(rs.getString("member_id"));
				vo.setBuyer_id(rs.getString("buyer_id"));
				vo.setProduct_id(rs.getString("product_id"));
				vo.setProduct_name(rs.getString("product_name"));
				vo.setProduct_status(rs.getString("product_status"));
				vo.setProduct_price(rs.getString("product_price"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return vo;
	}

	// 채팅방 상품 상태 업데이트
	public int updateProdStat(ChatVO vo) {
		sql = "update product set product_status = ? where product_id = ?";
		int result = 0;

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getProduct_status());
			psmt.setString(2, vo.getProduct_id());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return result;
	}

	// 채팅방 거래 내역 추가
	public int insertBuyList(ChatVO vo) {
		sql = "INSERT INTO buy (buy_id, product_id, member_id)\r\n"
				+ "VALUES (BUYSEQ.nextval, ?, (SELECT buyer_id FROM chat WHERE chat_id = ?))";
		int result = 0;

		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getProduct_id());
			psmt.setString(2, vo.getChat_id());
			result = psmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}

		return result;
	}
	
	// 상품 거래 멤버 조회
	public ChatVO selectBuyerMember(ChatVO vo) {
		System.out.println("구매자 조회하러 들어옴");
		sql = "select member_id from buy where product_id = ?";
		String buy_mem_id = null;
		
		System.out.println("상품아이디 : " + vo.getProduct_id());
		
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getProduct_id());
			rs = psmt.executeQuery();

			if (rs.next()) {
				vo.setBuy_mem_id(rs.getString("member_id"));
				System.out.println("상품구매자 : " + rs.getString("member_id"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		System.out.println("구매자 조회 끝났고 나감");
		return vo;
	}
	
//	송다희 추가(사진 띄울 select)
	public ChatVO selectPhoto(ChatVO vo) {
		sql = "select pp.product_photo_name\r\n"
				+ "from product_photo pp, product p\r\n"
				+ "where substr(pp.product_photo_name, 1, 6) = p.product_id\r\n"
				+ "and p.product_id = ?\r\n"
				+ "and substr(pp.product_photo_name, 7, 12) = 'fl0001'";
		try {
			connect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, vo.getProduct_id());
			rs = psmt.executeQuery();
			if (rs.next()) {
				vo.setProdPhotoName(rs.getString("product_photo_name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return vo;
	}
}
