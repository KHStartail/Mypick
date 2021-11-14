package com.pick.my.community.domain;

import java.sql.Date;

public class Community_Reply {
	private int replyAllNo;
	private String replyContents;
	private Date replyDate;
	private int replyNo;
	private String replyChild;
	private int postNo;
	private String userId;
	private String userNickName;
	
	public Community_Reply() {
	}

	public int getReplyAllNo() {
		return replyAllNo;
	}

	public void setReplyAllNo(int replyAllNo) {
		this.replyAllNo = replyAllNo;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public Date getReplyDate() {
		return replyDate;
	}

	public void setReplyDate(Date replyDate) {
		this.replyDate = replyDate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public String getReplyChild() {
		return replyChild;
	}

	public void setReplyChild(String replyChild) {
		this.replyChild = replyChild;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	@Override
	public String toString() {
		return "Community_Reply [replyAllNo=" + replyAllNo + ", replyContents=" + replyContents + ", replyDate="
				+ replyDate + ", replyNo=" + replyNo + ", replyChild=" + replyChild + ", postNo=" + postNo + ", userId="
				+ userId + ", userNickName=" + userNickName + "]";
	}

	
	
	
}
