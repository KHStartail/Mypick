package com.pick.my.common;

import java.sql.Date;

public class PaymentHistory {
	private int payNo;
	private int supNo;
	private String supTitle;
	private int supAmount;
	private String userNickName;
	private String userName;
	private String userPhone;
	private String userEmail;
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

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
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


	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
				+ supAmount + ", userNickName=" + userNickName + ", userName=" + userName + ", userPhone=" + userPhone
				+ ", userEmail=" + userEmail + ", paymentDate=" + paymentDate + "]";
	}

}
