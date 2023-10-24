package com.tbk.prj.prod;

public class ProdVO {
	String prodId; // 상품아이디
	String prodName; // 상품명
	String prodStatus; // 상품상태
	int prodPrice; // 판매가액
	int prodViews; // 조회수
	String prodDscrp; // 상품설명
	String placeTrans; // 거래희망장소
	String prodPhotoId;// 상품사진아이디

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

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
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

	@Override
	public String toString() {
		return "ProdVO [prodId=" + prodId + ", prodName=" + prodName + ", prodStatus=" + prodStatus + ", prodPrice="
				+ prodPrice + ", prodViews=" + prodViews + ", prodDescription=" + prodDscrp + ", placeTrans="
				+ placeTrans + ", prodPhotoId=" + prodPhotoId + "]";
	}
}
