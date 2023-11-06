package com.tbk.prj.mypage;

import java.sql.Date;

public class MypageLikeVO {
	private String buyId;
	private String productInterestId;
	private String memberId;
	private String productId;
	private String productPhotoId;
	private String productName;
	private String productStatus;
	private int productPrice;
	private Date generationDate;

	public Date getGenerationDate() {
		return generationDate;
	}

	public void setGenerationDate(Date generationDate) {
		this.generationDate = generationDate;
	}

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

	public String getProductPhotoId() {
		return productPhotoId;
	}

	public void setProductPhotoId(String productPhotoId) {
		this.productPhotoId = productPhotoId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductStatus() {
		return productStatus;
	}

	public void setProductStatus(String productStatus) {
		this.productStatus = productStatus;
	}

	public int getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}

}
