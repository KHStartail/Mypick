package com.pick.my.community.domain;

public class Community_Main {
	private String groupName;
	private String mainImgName;
	
	
	public Community_Main() {}


	public String getGroupName() {
		return groupName;
	}


	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}


	public String getMainImgName() {
		return mainImgName;
	}


	public void setMainImgName(String mainImgName) {
		this.mainImgName = mainImgName;
	}


	@Override
	public String toString() {
		return "Community_Main [groupName=" + groupName + ", mainImgName=" + mainImgName + "]";
	}
	
	
	
	
	
}
