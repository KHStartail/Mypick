package com.pick.my.community.domain;

import java.sql.Date;

public class Community_Post {

	private int postNo;
	private int groupNo;
	private String userId;
	private String postTitle;
	private String postContents;
	private int viewsCount;
	private Date createDate;
	private Date updateDate;
	private String userNickName;
	private String status;
	private int heartCount;
	
	public Community_Post() {}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPostTitle() {
		return postTitle;
	}

	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
	}

	public String getPostContents() {
		return postContents;
	}

	public void setPostContents(String postContents) {
		this.postContents = postContents;
	}

	public int getViewsCount() {
		return viewsCount;
	}

	public void setViewsCount(int viewsCount) {
		this.viewsCount = viewsCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getHeartCount() {
		return heartCount;
	}

	public void setHeartCount(int heartCount) {
		this.heartCount = heartCount;
	}

	@Override
	public String toString() {
		return "Community_Post [postNo=" + postNo + ", groupNo=" + groupNo + ", userId=" + userId + ", postTitle="
				+ postTitle + ", postContents=" + postContents + ", viewsCount=" + viewsCount + ", createDate="
				+ createDate + ", updateDate=" + updateDate + ", userNickName=" + userNickName + ", status=" + status
				+ ", heartCount=" + heartCount + "]";
	}
}
