package com.pick.my.idol.domain;

public class Idol {
	private int idolNo;
	private String idolName;
	private String groupName;
	private int filePath;
	private int fileSize;
	
	public Idol() {}

	public int getIdolNo() {
		return idolNo;
	}

	public void setIdolNo(int idolNo) {
		this.idolNo = idolNo;
	}

	public String getIdolName() {
		return idolName;
	}

	public void setIdolName(String idolName) {
		this.idolName = idolName;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public int getFilePath() {
		return filePath;
	}

	public void setFilePath(int filePath) {
		this.filePath = filePath;
	}

	public int getFileSize() {
		return fileSize;
	}

	public void setFileSize(int fileSize) {
		this.fileSize = fileSize;
	}

	@Override
	public String toString() {
		return "Idol [idolNo=" + idolNo + ", idolName=" + idolName + ", groupName=" + groupName + ", filePath="
				+ filePath + ", fileSize=" + fileSize + "]";
	}
	
}
