package com.pick.my.goods.domain;

public class Cart {

	private String goodsName;
	private int goodsPrice;
	private int goodsAmount;
	private int goodsNo;
	private String userId;
	private String imgPath;
	private String groupName;
	private int cartNo;
	
	public Cart() {}

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

	public int getGoodsAmount() {
		return goodsAmount;
	}

	public void setGoodsAmount(int goodsAmount) {
		this.goodsAmount = goodsAmount;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	
	public int getCartNo() {
		return cartNo;
	}

	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	@Override
	public String toString() {
		return "Cart [goodsName=" + goodsName + ", goodsPrice=" + goodsPrice + ", goodsAmount=" + goodsAmount
				+ ", goodsNo=" + goodsNo + ", userId=" + userId + ", imgPath=" + imgPath + ", groupName=" + groupName
				+ ", cartNo=" + cartNo + "]";
	}




	
	
}
