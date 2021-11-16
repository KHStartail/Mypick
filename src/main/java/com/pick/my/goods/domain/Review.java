package com.pick.my.goods.domain;

import java.util.Date;

public class Review {

	private int revNo;
	private String revContents;
	private Date revDate;
	private int revStar;
	private String imgPath;
	private long imgSize;
	private int goodsNo;
	private String userId;
	private int replyNo;
	
	public Review() {}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevContents() {
		return revContents;
	}

	public void setRevContents(String revContents) {
		this.revContents = revContents;
	}

	public Date getRevDate() {
		return revDate;
	}

	public void setRevDate(Date revDate) {
		this.revDate = revDate;
	}

	public int getRevStar() {
		return revStar;
	}

	public void setRevStar(int revStar) {
		this.revStar = revStar;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	public long getImgSize() {
		return imgSize;
	}

	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}

	
	
	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	@Override
	public String toString() {
		return "Review [revNo=" + revNo + ", revContents=" + revContents + ", revDate=" + revDate + ", revStar="
				+ revStar + ", imgPath=" + imgPath + ", imgSize=" + imgSize + ", goodsNo=" + goodsNo + ", userId="
				+ userId + ", replyNo=" + replyNo + "]";
	}

	
	



	
	
	
}
