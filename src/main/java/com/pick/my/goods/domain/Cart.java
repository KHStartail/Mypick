package com.pick.my.goods.domain;

public class Cart {

	private String goodsName;
	private int goodsPrice;
	private int goodsAmount;
	private int goodsNo;
	private String userId;
	
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

	@Override
	public String toString() {
		return "Cart [goodsName=" + goodsName + ", goodsPrice=" + goodsPrice + ", goodsAmount=" + goodsAmount
				+ ", goodsNo=" + goodsNo + ", userId=" + userId + "]";
	}




	
	
}
