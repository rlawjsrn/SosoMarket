package com.tbk.prj.mypage;

import java.sql.Date;

public class MypageLikeVO {
	private String productInterestId;
	private String memberId;
	private String productId;
	private Date generationDate;

	public String getProductInterestId() {
		return productInterestId;
	}

	public void setProductInterestId(String productInterestId) {
		this.productInterestId = productInterestId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getProductId() {
		return productId;
	}

	public void setProductId(String productId) {
		this.productId = productId;
	}

	public Date getGenerationDate() {
		return generationDate;
	}

	public void setGenerationDate(Date generationDate) {
		this.generationDate = generationDate;
	}

}
