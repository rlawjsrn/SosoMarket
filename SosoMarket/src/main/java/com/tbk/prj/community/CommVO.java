package com.tbk.prj.community;

import java.util.Date;

public class CommVO {
	int commId; 
	private String postId; 
	private String memberId; 
	private Date generationDate; 
	private String commentDetail;
	int cmtRef; // comment ref 
	int cmtPos; // comment pos
	
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
	public int getCommId() {
		return commId;
	}
	public void setCommId(int commId) {
		this.commId = commId;
	}
	public int getCmtRef() {
		return cmtRef;
	}
	public void setCmtRef(int cmtRef) {
		this.cmtRef = cmtRef;
	}
	public int getCmtPos() {
		return cmtPos;
	}
	public void setCmtPos(int cmtPos) {
		this.cmtPos = cmtPos;
	}

}

