package com.pick.my.goods.domain;

import java.util.Date;

public class Goods {

	private int goodsNo;
	private String goodsName;
	private int goodsPrice;
	private Date uploadDate;
	private long imgSize;
	private String imgPath;
	private String userId;
	private int idolNo;
	private String goodsContents;
	private String idolName;
	private String groupName;
	private String goodsIntro;
	private String goodsAmount;
	
	
	public Goods() {}


	public int getGoodsNo() {
		return goodsNo;
	}


	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}


	public String getGoodsName() {
		return goodsName;
	}


	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}


	public int getGoodsPrice() {
		return goodsPrice;
	}


	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public long getImgSize() {
		return imgSize;
	}


	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}


	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public int getIdolNo() {
		return idolNo;
	}


	public void setIdolNo(int idolNo) {
		this.idolNo = idolNo;
	}


	public String getGoodsContents() {
		return goodsContents;
	}


	public void setGoodsContents(String goodsContents) {
		this.goodsContents = goodsContents;
	}


	public String getIdolName() {
		return idolName;
	}


	public void setIdolName(String idolName) {
		this.idolName = idolName;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}



	public String getGoodsIntro() {
		return goodsIntro;
	}


	public void setGoodsIntro(String goodsIntro) {
		this.goodsIntro = goodsIntro;
	}

	
	

	public String getGoodsAmount() {
		return goodsAmount;
	}


	public void setGoodsAmount(String goodsAmount) {
		this.goodsAmount = goodsAmount;
	}


	@Override
	public String toString() {
		return "Goods [goodsNo=" + goodsNo + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice + ", uploadDate="
				+ uploadDate + ", imgSize=" + imgSize + ", imgPath=" + imgPath + ", userId=" + userId + ", idolNo="
				+ idolNo + ", goodsContents=" + goodsContents + ", idolName=" + idolName + ", groupName=" + groupName
				+ ", goodsIntro=" + goodsIntro + ", goodsAmount=" + goodsAmount + "]";
	}








	

	
}
