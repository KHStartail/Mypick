package com.pick.my.community.domain;


public class Pagination {
   public static PageInfo getPageInfo(int currentPage, int totalCount) {
      PageInfo pi = null;
      int naviLimit = 5; // 페이지 수
      int communityLimit = 10; // 게시글 수 (네비게이터)
      int maxPage;
      int startNavi;
      int endNavi;
      maxPage = (int)((double)totalCount/communityLimit + 0.9);
      startNavi = (((int)((double)currentPage/naviLimit + 0.9)) -1) * naviLimit + 1;
      endNavi = startNavi + naviLimit - 1;
      if(maxPage < endNavi) {
         endNavi = maxPage;
      }
      pi = new PageInfo(currentPage, communityLimit, naviLimit, startNavi, endNavi, totalCount, maxPage);
      return pi;
   }
}