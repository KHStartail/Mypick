package com.pick.my.community.domain;

import java.sql.Date;

public class Community_File {
	private int fileNo;
	private String userId;
	private String fileName;
	private String fileRename;
	private int fileSize;
	private Date uploadDate;
	private int postNo;
	
	public Community_File() {
	}

	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFileRename() {
		return fileRename;
	}

	public void setFileRename(String fileRename) {
		this.fileRename = fileRename;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getPostNo() {
		return postNo;
	}

	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}

	@Override
	public String toString() {
		return "Community_File [fileNo=" + fileNo + ", userId=" + userId + ", fileName=" + fileName + ", fileRename="
				+ fileRename + ", fileSize=" + fileSize + ", uploadDate=" + uploadDate + ", postNo=" + postNo + "]";
	}
	
	
}
