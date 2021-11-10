package com.pick.my.supporting.domain;

public class SupFile {
	private int fileNo;
	private int supNo;
	private String fileName;
	private long fileSize;
	private String filePath;
	
	public SupFile() {};
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public int getSupNo() {
		return supNo;
	}
	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "SupFile [fileNo=" + fileNo + ", supNo=" + supNo + ", fileName=" + fileName + ", fileSize=" + fileSize
				+ ", filePath=" + filePath + "]";
	}
}
