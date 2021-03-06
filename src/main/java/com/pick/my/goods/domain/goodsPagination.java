package com.pick.my.goods.domain;


public class goodsPagination {

	public static GoodsPageInfo getPageInfo(int currentPage, int totalCount) {
		GoodsPageInfo pi = null;
		
		int naviLimit = 5; //한 페이지에서 보여주는 페이징수
		int boardLimit = 12; //한 페이지에서 보여주는 게시글 수 
		int maxPage;		//전체 페이지에서
		int startNavi;		//한 페이지에서 시작하는 페이지 번호
		int endNavi;		//한 페이지에서 끝나는 페이지 번호
		
		maxPage = (int)((double)totalCount/boardLimit + 0.9);
		startNavi = (((int)((double)currentPage/naviLimit+0.9)) -1) * naviLimit + 1;
		endNavi = startNavi +naviLimit -1;
		if(maxPage < endNavi) {
			endNavi = maxPage;
		}
		pi = new GoodsPageInfo(currentPage, boardLimit,naviLimit,startNavi,endNavi,totalCount,maxPage);
				
		return pi;
	}
}

