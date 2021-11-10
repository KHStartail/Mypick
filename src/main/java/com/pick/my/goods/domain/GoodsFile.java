package com.pick.my.goods.domain;

public class GoodsFile {

	private int imgNo;
	private long imgSize;
	private String imgPath;
	private int goodsNo;
	
	
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


	@Override
	public String toString() {
		return "GoodsFile [imgNo=" + imgNo + ", imgSize=" + imgSize + ", imgPath=" + imgPath + ", goodsNo=" + goodsNo
				+ "]";
	}
	
	
}
