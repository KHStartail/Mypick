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

	@Override
	public String toString() {
		return "Community_Post [게시글번호=" + postNo + ", 그룹번호=" + groupNo + ", 아이디=" + userId + ", 글제목="
				+ postTitle + ", 내용=" + postContents + ", 조회수=" + viewsCount + ", 작성날="
				+ createDate + ", 수정날=" + updateDate + ", 닉네임=" + userNickName + "]";
	}
	
	
}
