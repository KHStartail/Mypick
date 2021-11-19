package com.pick.my.community.store;

import java.util.List;
import java.util.Map;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Post_Report;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Community_Report_Reply;
import com.pick.my.community.domain.Heart;
import com.pick.my.community.domain.PageInfo;

public interface CommunityStore {
	public int getListcount();
	public Community_Post selectOnePost(int postNo);
	public int addReadCount(int postNo);
	public int insertCoummunityPost(Community_Post post);
	public int insertFile(Community_File File);
	public int updateCommunityPost(Community_Post communityPost);
	public List<Community_Reply> selectAllReply(int postNo);
	public int insertReply(Community_Reply reply);
	public int updateReply(Community_Reply reply);
	public int deleteReply(Community_Reply reply);
	public int insertHeart(Heart heart);
	public int deleteHeart(Heart heart);
	public List<Community_Post> selectAllPost(Map<String, Object> map);
	public List<Community_Post> selectSearchAll(PageInfo pi);
	public int getSearchListcount(String searchKeyword);
	public List<Community_File> selectOnePostFile(int postNo);
	public int deletePost(int postNo);
	public int deleteFile(int postNo);
	public int updatePost(Community_Post communityPost);
	public int ReinsertFile(Community_File File);
	public Community_Post selectCommunityPostNo(Community_Post communityPost);
	public int updateFile(List<String> fileNames);
	public int selectHeart(Heart heart);
	public int insertHeartCount(int postNo);
	public int deleteHeartCount(int postNo);
	public int insertReplyReport(Community_Report_Reply reply);
	public Community_Report_Reply doubleReport(Community_Report_Reply report);
	public int insertPostReport(Community_Post_Report postReport);
	public Community_Post_Report checkReport(Community_Post_Report postReport);
}
