package com.pick.my.community.domain;

public class Heart {
	private int heartNo;
	private String userId;
	private int postNo;
	
	public Heart() {}

	public int getHeartNo() {
		return heartNo;
	}

	public void setHeartNo(int heartNo) {
		this.heartNo = heartNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "Heart [heartNo=" + heartNo + ", userId=" + userId + ", postNo=" + postNo + "]";
	}
	
	
}
