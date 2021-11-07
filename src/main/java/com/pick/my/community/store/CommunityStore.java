package com.pick.my.community.store;

import java.util.List;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Heart;

public interface CommunityStore {
	public int getListcount();
	public Community_Post selectOnePost(Community_Post communityPost);
	public int addReadCount(int postNo);
	public int insertCoummunityPost(List<Community_Post> cList);
	public int insertFile(Community_File File);
	public int updateCommunityPost(Community_Post communityPost);
	public List<Community_Reply> selectAllReply(List<Community_Reply> rList);
	public int insertReply(Community_Reply reply);
	public int updateReply(Community_Reply reply);
	public int deleteReply(Community_Reply reply);
	public int insertHeart(Heart heart);
	public int deleteHeart(Heart heart);
}
