package com.pick.my.community.service;

import java.util.List;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Heart;

public interface CommunityService {
	public int getListcount();
	public Community_Post printOnePost(Community_Post communityPost);
	public int addReadCount(int postNo);
	public int registerCoummunityPost(List<Community_Post> cList);
	public int insertFile(Community_File File);
	public int modifyCommunityPost(Community_Post communityPost);
	public List<Community_Reply> printAllReply(List<Community_Reply> rList);
	public int registerReply(Community_Reply reply);
	public int modifyReply(Community_Reply reply);
	public int removeReply(Community_Reply reply);
	public int saveHeart(Heart heart);
	public int removeHeart(Heart heart);
	
}
