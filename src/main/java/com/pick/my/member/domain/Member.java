package com.pick.my.member.domain;

import java.sql.Date;

public class Member {
  private int userNo;
  private String userId;
  private String userPwd;
  private String userNickName;
  private String userEmail;
  private String userAddr;
  private int userPhone;
  private String userGrade;
  private Date userEng;
  private int businessNo;
  private int fileNo;
  private String fileName;
  private String filePath;
  private long fileSize;
  private Object kakao;

  public Member() {
	  super();
  }

public Member(int userNo, String userId, String userPwd, String userNickName, String userEmail, String userAddr,
		int userPhone, String userGrade, Date userEng, int businessNo, int fileNo, String fileName, String filePath,
		long fileSize) {
	super();
	this.userNo = userNo;
	this.userId = userId;
	this.userPwd = userPwd;
	this.userNickName = userNickName;
	this.userEmail = userEmail;
	this.userAddr = userAddr;
	this.userPhone = userPhone;
	this.userGrade = userGrade;
	this.userEng = userEng;
	this.businessNo = businessNo;
	this.fileNo = fileNo;
	this.fileName = fileName;
	this.filePath = filePath;
	this.fileSize = fileSize;
}

public int getUserNo() {
	return userNo;
}

public void setUserNo(int userNo) {
	this.userNo = userNo;
}

public String getUserId() {
	return userId;
}

public void setUserId(String userId) {
	this.userId = userId;
}

public String getUserPwd() {
	return userPwd;
}

public void setUserPwd(String userPwd) {
	this.userPwd = userPwd;
}

public String getUserNickName() {
	return userNickName;
}

public void setUserNickName(String userNickName) {
	this.userNickName = userNickName;
}

public String getUserEmail() {
	return userEmail;
}

public void setUserEmail(String userEmail) {
	this.userEmail = userEmail;
}

public String getUserAddr() {
	return userAddr;
}

public void setUserAddr(String userAddr) {
	this.userAddr = userAddr;
}

public int getUserPhone() {
	return userPhone;
}

public void setUserPhone(int userPhone) {
	this.userPhone = userPhone;
}

public String getUserGrade() {
	return userGrade;
}

public void setUserGrade(String userGrade) {
	this.userGrade = userGrade;
}

public Date getUserEng() {
	return userEng;
}

public void setUserEng(Date userEng) {
	this.userEng = userEng;
}

public int getBusinessNo() {
	return businessNo;
}

public void setBusinessNo(int businessNo) {
	this.businessNo = businessNo;
}

public int getFileNo() {
	return fileNo;
}

public void setFileNo(int fileNo) {
	this.fileNo = fileNo;
}

public String getFileName() {
	return fileName;
}

public void setFileName(String fileName) {
	this.fileName = fileName;
}

public String getFilePath() {
	return filePath;
}

public void setFilePath(String filePath) {
	this.filePath = filePath;
}

public long getFileSize() {
	return fileSize;
}

public void setFileSize(long fileSize) {
	this.fileSize = fileSize;
}

public Object getKakao() {
	return kakao;
}

public void setKakao(Object kakao) {
	this.kakao = kakao;
}

@Override
public String toString() {
	return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userNickName=" + userNickName
			+ ", userEmail=" + userEmail + ", userAddr=" + userAddr + ", userPhone=" + userPhone + ", userGrade="
			+ userGrade + ", userEng=" + userEng + ", businessNo=" + businessNo + ", fileNo=" + fileNo + ", fileName="
			+ fileName + ", filePath=" + filePath + ", fileSize=" + fileSize + "]";
}


	  
  
}
