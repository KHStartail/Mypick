package com.pick.my.common;

import java.sql.Date;

public class PaymentHistory {
	private int orderNo;
	private int goodsNo;
	private int supNo;
	private int userNo;
	private int payAccount;
	private Date supDate;
	
	public PaymentHistory() {};
	
	public int getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	public int getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getSupNo() {
		return supNo;
	}
	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public int getPayAccount() {
		return payAccount;
	}
	public void setPayAccount(int payAccount) {
		this.payAccount = payAccount;
	}
	public Date getSupDate() {
		return supDate;
	}
	public void setSupDate(Date supDate) {
		this.supDate = supDate;
	}
	@Override
	public String toString() {
		return "PaymentHistory [orderNo=" + orderNo + ", goodsNo=" + goodsNo + ", supNo=" + supNo + ", userNo=" + userNo
				+ ", payAccount=" + payAccount + ", supDate=" + supDate + "]";
	}
}
