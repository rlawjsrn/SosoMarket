package com.tbk.prj.chat;

public class ChatVO {

//	채팅방
	private String chat_id;
	private String product_id;
	private String buyer_id;

//	채팅메세지
	private String chat_message_id;
	private String chat_message;
	private char read_or_not;
	private String generation_date;
	private String member_id;
	
//	상품
	private String product_name;

	public String getChat_id() {
		return chat_id;
	}

	public void setChat_id(String chat_id) {
		this.chat_id = chat_id;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getBuyer_id() {
		return buyer_id;
	}

	public void setBuyer_id(String buyer_id) {
		this.buyer_id = buyer_id;
	}

	public String getGeneration_date() {
		return generation_date;
	}

	public void setGeneration_date(String generation_date) {
		this.generation_date = generation_date;
	}

	public String getChat_message_id() {
		return chat_message_id;
	}

	public void setChat_message_id(String chat_message_id) {
		this.chat_message_id = chat_message_id;
	}

	public String getChat_message() {
		return chat_message;
	}

	public void setChat_message(String chat_message) {
		this.chat_message = chat_message;
	}

	public char getRead_or_not() {
		return read_or_not;
	}

	public void setRead_or_not(char read_or_not) {
		this.read_or_not = read_or_not;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	
}
