package com.pick.my.goods.domain;

public class GoodsFile {

	private int imgNo;
	private long imgSize;
	private String imgPath;
	private int goodsNo;
	private String userId;
	private String imgName;
	private String imgReName;
	
	
	public GoodsFile() {}


	public int getImgNo() {
		return imgNo;
	}


	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
	}


	public long getImgSize() {
		return imgSize;
	}


	public void setImgSize(long imgSize) {
		this.imgSize = imgSize;
	}


	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
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


	public String getImgName() {
		return imgName;
	}


	public void setImgName(String imgName) {
		this.imgName = imgName;
	}


	public String getImgReName() {
		return imgReName;
	}


	public void setImgReName(String imgReName) {
		this.imgReName = imgReName;
	}


	@Override
	public String toString() {
		return "GoodsFile [imgNo=" + imgNo + ", imgSize=" + imgSize + ", imgPath=" + imgPath + ", goodsNo=" + goodsNo
				+ ", userId=" + userId + ", imgName=" + imgName + ", imgReName=" + imgReName + "]";
	}


	
	
}
