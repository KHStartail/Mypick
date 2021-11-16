package com.pick.my.goods.domain;

import java.util.Date;

public class GoodsPayment {

	private int goodsNo;
	private int goodsAmount;
	private int goodsPrice;
	private int goodsDelivery;
	private String userId;
	private String userName;
	private String userAddr;
	private String userPhone;
	private String userEmail;
	private String userMsg;
	private Date paymentDate;
	
	public GoodsPayment() {}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getGoodsAmount() {
		return goodsAmount;
	}

	public void setGoodsAmount(int goodsAmount) {
		this.goodsAmount = goodsAmount;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public int getGoodsDelivery() {
		return goodsDelivery;
	}

	public void setGoodsDelivery(int goodsDelivery) {
		this.goodsDelivery = goodsDelivery;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddr() {
		return userAddr;
	}

	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserMsg() {
		return userMsg;
	}

	public void setUserMsg(String userMsg) {
		this.userMsg = userMsg;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Override
	public String toString() {
		return "GoodsPayment [goodsNo=" + goodsNo + ", goodsAmount=" + goodsAmount + ", goodsPrice=" + goodsPrice
				+ ", goodsDelivery=" + goodsDelivery + ", userId=" + userId + ", userName=" + userName + ", userAddr="
				+ userAddr + ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userMsg=" + userMsg
				+ ", paymentDate=" + paymentDate + "]";
	}
	
	
}