package com.pick.my.community.domain;

public class PageInfo {
	//현재 페이지
	private int currentPage;
	// 한페이지당 몇개의 게시글
	private int communityLimit;
	// 한페이지당 몇개의 네비게이션 수
	private int naviLimit;
	// 네비게이션 첫반째 값
	private int startNavi;
	// 네비게이션 마지막 값
	private int endnavi;
	// 전체 게시글 갯수
	private int totalCount;
	// 페이지 마지막 번호
	private int maxPage;
	
	private String searchKeyword;
	
	public PageInfo() {}
	
	
	
	public PageInfo(int currentPage, int communityLimit, int naviLimit, int startNavi, int endnavi, int totalCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.communityLimit = communityLimit;
		this.naviLimit = naviLimit;
		this.startNavi = startNavi;
		this.endnavi = endnavi;
		this.totalCount = totalCount;
		this.maxPage = maxPage;
	}



	public int getCurrentPage() {
		return currentPage;
	}



	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}



	public int getCommunityLimit() {
		return communityLimit;
	}



	public void setCommunityLimit(int communityLimit) {
		this.communityLimit = communityLimit;
	}



	public int getNaviLimit() {
		return naviLimit;
	}



	public void setNaviLimit(int naviLimit) {
		this.naviLimit = naviLimit;
	}



	public int getStartNavi() {
		return startNavi;
	}



	public void setStartNavi(int startNavi) {
		this.startNavi = startNavi;
	}



	public int getEndnavi() {
		return endnavi;
	}



	public void setEndnavi(int endnavi) {
		this.endnavi = endnavi;
	}



	public int getTotalCount() {
		return totalCount;
	}



	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}



	public int getMaxPage() {
		return maxPage;
	}



	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}



	public String getSearchKeyword() {
		return searchKeyword;
	}



	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}



	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", communityLimit=" + communityLimit + ", naviLimit="
				+ naviLimit + ", startNavi=" + startNavi + ", endnavi=" + endnavi + ", totalCount=" + totalCount
				+ ", maxPage=" + maxPage + ", searchKeyword=" + searchKeyword + ", getCurrentPage()=" + getCurrentPage()
				+ ", getCommunityLimit()=" + getCommunityLimit() + ", getNaviLimit()=" + getNaviLimit()
				+ ", getStartNavi()=" + getStartNavi() + ", getEndnavi()=" + getEndnavi() + ", getTotalCount()="
				+ getTotalCount() + ", getMaxPage()=" + getMaxPage() + ", getSearchKeyword()=" + getSearchKeyword()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}



	
	
	
}
