package com.pick.my.common;

public class PageInfo {
	private int currentPage; //현재페이지
	private int boardLimit; //한페이지당 게시글 수
	private int naviLimit; //한페이지당 네비수
	private int startNavi; //네비 첫번째 값
	private int endNavi; //네비 마지막 값
	private int totalCount; //전체게시물수
	private int maxPage; //페이지 마지막번호
	
	public PageInfo() {};
	
	public PageInfo(int currentPage, int boardLimit, int naviLimit, int startNavi, int endNavi, int totalCount,
			int maxPage) {
		super();
		this.currentPage = currentPage;
		this.boardLimit = boardLimit;
		this.naviLimit = naviLimit;
		this.startNavi = startNavi;
		this.endNavi = endNavi;
		this.totalCount = totalCount;
		this.maxPage = maxPage;
	}

	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getBoardLimit() {
		return boardLimit;
	}
	public void setBoardLimit(int boardLimit) {
		this.boardLimit = boardLimit;
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
	public int getEndNavi() {
		return endNavi;
	}
	public void setEndNavi(int endNavi) {
		this.endNavi = endNavi;
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
	@Override
	public String toString() {
		return "PageInfo [currentPage=" + currentPage + ", boardLimit=" + boardLimit + ", naviLimit=" + naviLimit
				+ ", startNavi=" + startNavi + ", endNavi=" + endNavi + ", totalCount=" + totalCount + ", maxPage="
				+ maxPage + "]";
	}
}
