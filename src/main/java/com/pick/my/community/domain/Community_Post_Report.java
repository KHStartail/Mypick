package com.pick.my.community.domain;

public class Community_Post_Report {
	private int reportNo;
	private int postNo;
	private String postTitle;
	private String userNickName;
	private String writerNickName;
	
	public Community_Post_Report() {}

	public int getReportNo() {
		return reportNo;
	}

	public void setReportNo(int reportNo) {
		this.reportNo = reportNo;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	
	

	public String getWriterNickName() {
		return writerNickName;
	}

	public void setWriterNickName(String writerNickName) {
		this.writerNickName = writerNickName;
	}

	@Override
	public String toString() {
		return "Community_Post_Report [reportNo=" + reportNo + ", postNo=" + postNo + ", postTitle=" + postTitle
				+ ", userNickName=" + userNickName + ", writerNickName=" + writerNickName + "]";
	}
	
	
	
}
