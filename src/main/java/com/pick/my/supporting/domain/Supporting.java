package com.pick.my.supporting.domain;

import java.util.Date;

public class Supporting {
	private int supNo;
	private String writer;
	private int supCategory;
	private String supTitle;
	private String supContents;
	private String scheduleDate;
	private String supPlace;
	private String groupName;
	private Date supStartDate;
	private Date supEndDate;
	private int sumMoney;
	private int goalMoney;
	private int supPartiwon;
	private int supGrade;
	private int imgNo;
	private String imgName;
	private String imgReName;
	private String imgPath;
	
	public Supporting() {};
	
	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}


	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getSupCategory() {
		return supCategory;
	}


	public void setSupCategory(int supCategory) {
		this.supCategory = supCategory;
	}


	public String getSupTitle() {
		return supTitle;
	}


	public void setSupTitle(String supTitle) {
		this.supTitle = supTitle;
	}


	public String getSupContents() {
		return supContents;
	}


	public void setSupContents(String supContents) {
		this.supContents = supContents;
	}


	public String getScheduleDate() {
		return scheduleDate;
	}


	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}


	public String getSupPlace() {
		return supPlace;
	}


	public void setSupPlace(String supPlace) {
		this.supPlace = supPlace;
	}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public Date getSupStartDate() {
		return supStartDate;
	}


	public void setSupStartDate(Date supStartDate) {
		this.supStartDate = supStartDate;
	}


	public Date getSupEndDate() {
		return supEndDate;
	}


	public void setSupEndDate(Date supEndDate) {
		this.supEndDate = supEndDate;
	}


	public int getSumMoney() {
		return sumMoney;
	}


	public void setSumMoney(int sumMoney) {
		this.sumMoney = sumMoney;
	}


	public int getGoalMoney() {
		return goalMoney;
	}


	public void setGoalMoney(int goalMoney) {
		this.goalMoney = goalMoney;
	}


	public int getSupPartiwon() {
		return supPartiwon;
	}


	public void setSupPartiwon(int supPartiwon) {
		this.supPartiwon = supPartiwon;
	}


	public int getSupGrade() {
		return supGrade;
	}


	public void setSupGrade(int supGrade) {
		this.supGrade = supGrade;
	}


	public int getImgNo() {
		return imgNo;
	}


	public void setImgNo(int imgNo) {
		this.imgNo = imgNo;
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

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "Supporting [supNo=" + supNo + ",writer=" + writer + ", supCategory=" + supCategory + ", supTitle="
				+ supTitle + ", supContents=" + supContents + ", scheduleDate=" + scheduleDate + ", supPlace="
				+ supPlace + ", groupName=" + groupName + ", supStartDate=" + supStartDate + ", supEndDate="
				+ supEndDate + ", sumMoney=" + sumMoney + ", goalMoney=" + goalMoney + ", supPartiwon=" + supPartiwon
				+ ", supGrade=" + supGrade + ", imgNo=" + imgNo + ", imgName=" + imgName + ", imgReName=" + imgReName
				+ ", imgPath=" + imgPath + "]";
	}
}
