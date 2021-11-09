package com.pick.my.supporting.domain;

public class SupParticipation {
	private int pNo;
	private int userNo;
	private int supNo;
	
	public SupParticipation() {}

	public SupParticipation(int pNo, int userNo, int supNo) {
		super();
		this.pNo = pNo;
		this.userNo = userNo;
		this.supNo = supNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getSupNo() {
		return supNo;
	}

	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}

	@Override
	public String toString() {
		return "SupParticipation [pNo=" + pNo + ", userNo=" + userNo + ", supNo=" + supNo + "]";
	};
	
}
