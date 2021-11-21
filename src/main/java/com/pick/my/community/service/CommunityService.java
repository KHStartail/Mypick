package com.pick.my.community.service;

import java.util.List;
import java.util.Map;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Main;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Post_Report;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Community_Report_Reply;
import com.pick.my.community.domain.Heart;
import com.pick.my.community.domain.PageInfo;

public interface CommunityService {
	public int getListcount(String groupName);
	public Community_Post printOnePost(int postNo);
	public int addReadCount(int postNo);
	public int registerCoummunityPost(Community_Post post);
	public int insertFile(Community_File File);
	public List<Community_Post> printAllPost(PageInfo pi);
	public int modifyCommunityPost(Community_Post communityPost);
	public List<Community_Reply> printAllReply(int postNo);
	public int registerReply(Community_Reply reply);
	public int modifyReply(Community_Reply reply);
	public int removeReply(Community_Reply reply);
	public int saveHeart(Heart heart);
	public int removeHeart(Heart heart);
	public List<Community_Post> printSearchAll(PageInfo pi);
	public int getSearchListcount(String searchKeyword);
	public List<Community_File> printOnePostFile(int postNo);
	public int removePost(int postNo);
	public int removeFile(int postNo);
	public int modifyPost(Community_Post communityPost);
	public int ReinsertFile(Community_File File);
	public Community_Post printCommunityPostNo (Community_Post communityPost);
	public int modifyFile(List<String> fileNames);
	public int printHeart(Heart heart);
	public int insertHeartCount(int postNo);
	public int removeHeartCount(int postNo);
	public int registerReplyReport(Community_Report_Reply reply);
	public Community_Report_Reply doubleReport(Community_Report_Reply report);
	public int registerPostReport(Community_Post_Report postReport);
	public Community_Post_Report checkReport(Community_Post_Report postReport);
	public int registerMainImg(Community_Main main);
	public int removeMainImg(Community_Main main);
	public Community_Main printMainImg(Community_Main groupName);
	public List<Community_Post>printMyPost(Map<String, Object> map);
	public int myPageListcount(String userId);
}
