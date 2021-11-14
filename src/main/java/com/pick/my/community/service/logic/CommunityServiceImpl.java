package com.pick.my.community.service.logic;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Heart;
import com.pick.my.community.domain.PageInfo;
import com.pick.my.community.service.CommunityService;
import com.pick.my.community.store.CommunityStore;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityStore store;

	@Override
	public int getListcount() {
		int totalCount = store.getListcount();
		return totalCount;
	}

	@Override
	public Community_Post printOnePost(int postNo) {
		Community_Post post = store.selectOnePost(postNo);
		return post;
	}

	@Override
	public int addReadCount(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int registerCoummunityPost(Community_Post post) {
		int result = store.insertCoummunityPost(post);
		return result;
	}

	@Override
	public int insertFile(Community_File File) {
			int result = store.insertFile(File);
			return result;
	}

	@Override
	public int modifyCommunityPost(Community_Post communityPost) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int registerReply(Community_Reply reply) {
		int result = store.insertReply(reply);
		return result;
	}

	@Override
	public int modifyReply(Community_Reply reply) {
		int result = store.updateReply(reply);
		return result;
	}

	@Override
	public int removeReply(Community_Reply reply) {
		int result =store.deleteReply(reply);
		return result;
	}

	@Override
	public int saveHeart(Heart heart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeHeart(Heart heart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Community_Post> printAllPost(PageInfo pi) {
		List<Community_Post> cList = store.selectAllPost(pi);
		return cList;
	}

	@Override
	public List<Community_Post> printSearchAll(PageInfo pi) {
		List<Community_Post> searchList = store.selectSearchAll(pi);
		return searchList;
	}

	@Override
	public int getSearchListcount(String searchKeyword) {
		int totalCount = store.getSearchListcount(searchKeyword);
		return totalCount;
	}

	@Override
	public List<Community_File> printOnePostFile(int postNo) {
		List<Community_File> fileList = store.selectOnePostFile(postNo);
		return fileList;
	}

	@Override
	public int removePost(int postNo) {
		int result = store.deletePost(postNo);
		return result;
	}

	@Override
	public int removeFile(int postNo) {
		int result = store.deleteFile(postNo);
		return result;
	}

	@Override
	public int modifyPost(Community_Post communityPost) {
		int result = store.updatePost(communityPost);
		return result;
	}
	

	@Override
	public List<Community_Reply> printAllReply(int postNo) {
		List<Community_Reply> rList = store.selectAllReply(postNo);
		return rList;
	}

	@Override
	public int ReinsertFile(Community_File File) {
		int result = store.ReinsertFile(File);
		return result;
	}

	@Override
	public Community_Post printCommunityPostNo(Community_Post communityPost) {
		Community_Post postNo = store.selectCommunityPostNo(communityPost);
		return postNo;
	}

	@Override
	public int modifyFile(List<String> fileNames) {
		int result =store.updateFile(fileNames);
		return result;
	}



}
