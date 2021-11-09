package com.pick.my.supporting.domain;

import com.pick.my.common.PageInfo;

public class Pagination {

	
	public static PageInfo getPageInfo(int currentPage, int totalCount) {
		PageInfo pi = null;
		int naviLimit = 5; //네비수
		int boardLimit = 15; //게시물수
		int maxPage; //총 페이지수
		int startNavi; //첫번째 네비번호
		int endNavi; //마지막 네비번호
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit+ 0.9))-1) * naviLimit+1;
		endNavi = startNavi + naviLimit -1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new PageInfo(currentPage, boardLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
		return pi;
	}
}
