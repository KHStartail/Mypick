package com.pick.my.community.domain;

import java.sql.Date;

public class Community_Post {

	private int postNo;
	private String groupName;
	private String userId;
	private String postTitle;
	private String postContents;
	private int viewsCount;
	private String createDate;
	private String updateDate;
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

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
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

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
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
		return "Community_Post [postNo=" + postNo + ", groupName=" + groupName + ", userId=" + userId + ", postTitle="
				+ postTitle + ", postContents=" + postContents + ", viewsCount=" + viewsCount + ", createDate="
				+ createDate + ", updateDate=" + updateDate + ", userNickName=" + userNickName + ", status=" + status
				+ ", heartCount=" + heartCount + "]";
	}

	

	

	
}
