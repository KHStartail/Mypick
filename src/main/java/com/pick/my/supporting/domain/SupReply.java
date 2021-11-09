package com.pick.my.supporting.domain;

import java.sql.Date;

public class SupReply {
	private int supReAllNo; //전체 댓글 개수
	private int supReChild; // 답글구분
	private int supReNo; //어떤 댓글의 답글인지 
	private int supNo; //서포팅번호
	private String supReContents; //내용
	private Date supReDate; //날짜
	private String supReWriter; //작성자
	
	public SupReply() {};
	public int getSupReAllNo() {
		return supReAllNo;
	}
	public void setSupReAllNo(int supReAllNo) {
		this.supReAllNo = supReAllNo;
	}
	public int getSupReChild() {
		return supReChild;
	}
	public void setSupReChild(int supReChild) {
		this.supReChild = supReChild;
	}
	public int getSupReNo() {
		return supReNo;
	}
	public void setSupReNo(int supReNo) {
		this.supReNo = supReNo;
	}
	public int getSupNo() {
		return supNo;
	}
	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	public String getSupReContents() {
		return supReContents;
	}
	public void setSupReContents(String supReContents) {
		this.supReContents = supReContents;
	}
	public Date getSupReDate() {
		return supReDate;
	}
	public void setSupReDate(Date supReDate) {
		this.supReDate = supReDate;
	}
	public String getSupReWriter() {
		return supReWriter;
	}
	public void setSupReWriter(String supReWriter) {
		this.supReWriter = supReWriter;
	}
	@Override
	public String toString() {
		return "SupReply [supReAllNo=" + supReAllNo + ", supReChild=" + supReChild + ", supReNo=" + supReNo + ", supNo="
				+ supNo + ", supReContents=" + supReContents + ", supReDate=" + supReDate + ", supReWriter="
				+ supReWriter + "]";
	}
	
}
