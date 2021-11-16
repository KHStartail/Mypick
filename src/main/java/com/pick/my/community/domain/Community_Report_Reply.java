package com.pick.my.community.domain;

public class Community_Report_Reply {
	private int reportNo;
	private String userId;
	private int replyAllNo;
	private String rStatus;
	private String replyContents;
	private int postNo;
	public Community_Report_Reply() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getReplyAllNo() {
		return replyAllNo;
	}

	public void setReplyAllNo(int replyAllNo) {
		this.replyAllNo = replyAllNo;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}
	
	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "Community_Report_Reply [reportNo=" + reportNo + ", userId=" + userId + ", replyAllNo=" + replyAllNo
				+ ", rStatus=" + rStatus + ", replyContents=" + replyContents + ", postNo=" + postNo + "]";
	}

	
	
}
