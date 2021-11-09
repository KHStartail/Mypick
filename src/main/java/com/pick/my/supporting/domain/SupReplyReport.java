package com.pick.my.supporting.domain;

public class SupReplyReport {
	private int reportNo;
	private int supReAllNo;
	private int supNo;
	private int userNo;
	
	public SupReplyReport() {};
	
	public int getReportNo() {
		return reportNo;
	}
	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}
	public int getSupReAllNo() {
		return supReAllNo;
	}
	public void setSupReAllNo(int supReAllNo) {
		this.supReAllNo = supReAllNo;
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
	
	@Override
	public String toString() {
		return "SupReplyReport [reportNo=" + reportNo + ", supReAllNo=" + supReAllNo + ", supNo=" + supNo + ", userNo="
				+ userNo + "]";
	}
	
}
