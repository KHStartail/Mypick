package com.pick.my.common;

import java.sql.Date;

import com.pick.my.member.domain.Member;

public class PaymentHistory {
	private int payNo;
	private int supNo;
	private String supTitle;
	private int supAmount;
	private Member userId;
	private String userName;
	private String userPhone;
	private Date paymentDate;
	
	public PaymentHistory() {}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}

	public String getSupTitle() {
		return supTitle;
	}

	public void setSupTitle(String supTitle) {
		this.supTitle = supTitle;
	}

	public int getSupAmount() {
		return supAmount;
	}

	public void setSupAmount(int supAmount) {
		this.supAmount = supAmount;
	}

	public Member getUserId() {
		return userId;
	}

	public void setUserId(Member userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	@Override
	public String toString() {
		return "PaymentHistory [payNo=" + payNo + ", supNo=" + supNo + ", supTitle=" + supTitle + ", supAmount="
				+ supAmount + ", userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", paymentDate=" + paymentDate + "]";
	}
}
