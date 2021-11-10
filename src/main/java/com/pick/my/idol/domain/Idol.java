package com.pick.my.idol.domain;

public class Idol {
	private int idolNo;
	private String idolName;
	private String groupName;
	private String filePath;
	
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

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	@Override
	public String toString() {
		return "Idol [idolNo=" + idolNo + ", idolName=" + idolName + ", groupName=" + groupName + ", filePath="
				+ filePath + "]";
	}
	
}
