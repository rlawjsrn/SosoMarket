package com.tbk.prj.prod;

import java.util.Date;

public class ProdVO {
	String prodId; // 상품아이디
	String categoryId; // 카테고리 아이디
	String category; // 카테고리
	int cntCtgr; // 카테고리 수
	String prodName; // 상품명
	String prodStatus; // 상품상태
	String prodPrice; // 판매가액
	int prodViews; // 조회수
	String prodDscrp; // 상품설명
	String prodInterestId; // 관심 상품(찜)
	String placeTrans; // 거래희망장소
	String prodPhotoId; // 상품사진아이디
	String prodPhotoName;// 상품사진경로
	Date prodGenerationDate; // 상품 등록일자
	String memberId; // 회원 아이디
	int memberCount; // 랭킹 매기는 카운트
	String categoryName;
	int prodCount; // 상품 카운트
	int todayCount; // 오늘 거래된 상품
	// 송다희
	int likeCount; // 찜 횟수 확인

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getTodayCount() {
		return todayCount;
	}

	public void setTodayCount(int todayCount) {
		this.todayCount = todayCount;
	}

	public int getProdCount() {
		return prodCount;
	}

	public void setProdCount(int prodCount) {
		this.prodCount = prodCount;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdStatus() {
		return prodStatus;
	}

	public void setProdStatus(String prodStatus) {
		this.prodStatus = prodStatus;
	}

	public String getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(String prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdViews() {
		return prodViews;
	}

	public void setProdViews(int prodViews) {
		this.prodViews = prodViews;
	}

	public String getProdDscrp() {
		return prodDscrp;
	}

	public void setProdDscrp(String prodDscrp) {
		this.prodDscrp = prodDscrp;
	}

	public String getProdInterestId() {
		return prodInterestId;
	}

	public void setProdInterestId(String prodInterestId) {
		this.prodInterestId = prodInterestId;
	}

	public String getPlaceTrans() {
		return placeTrans;
	}

	public void setPlaceTrans(String placeTrans) {
		this.placeTrans = placeTrans;
	}

	public String getProdPhotoId() {
		return prodPhotoId;
	}

	public void setProdPhotoId(String prodPhotoId) {
		this.prodPhotoId = prodPhotoId;
	}

	public String getProdPhotoName() {
		return prodPhotoName;
	}

	public void setProdPhotoName(String prodPhotoName) {
		this.prodPhotoName = prodPhotoName;
	}

	public Date getProdGenerationDate() {
		return prodGenerationDate;
	}

	public void setProdGenerationDate(Date prodGenerationDate) {
		this.prodGenerationDate = prodGenerationDate;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;

	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCntCtgr() {
		return cntCtgr;
	}

	public void setCntCtgr(int cntCtgr) {
		this.cntCtgr = cntCtgr;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "ProdVO [prodId=" + prodId + ", prodName=" + prodName + ", prodStatus=" + prodStatus + ", prodPrice="
				+ prodPrice + ", prodViews=" + prodViews + ", prodDescription=" + prodDscrp + ", placeTrans="
				+ placeTrans + ", prodPhotoId=" + prodPhotoId + ", category=" + category + ", cntCtgr=" + cntCtgr + "]";
	}
}
