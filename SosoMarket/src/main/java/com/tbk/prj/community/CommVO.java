package com.tbk.prj.community;

import java.sql.Date;

public class CommVO {
	private String postId; 
	private String memberId; 
	private Date generationDate; 
	private String commentDetail;
	public String getPostId() {
		return postId;
	}
	public void setPostId(String postId) {
		this.postId = postId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public Date getGenerationDate() {
		return generationDate;
	}
	public void setGenerationDate(Date generationDate) {
		this.generationDate = generationDate;
	}
	public String getCommentDetail() {
		return commentDetail;
	}
	public void setCommentDetail(String commentDetail) {
		this.commentDetail = commentDetail;
	}

}

