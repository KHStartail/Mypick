package com.pick.my.community.store.logic;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Heart;
import com.pick.my.community.domain.PageInfo;
import com.pick.my.community.store.CommunityStore;
@Repository
public class CommunityStoreLogic implements CommunityStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListcount() {
		int count = sqlSession.selectOne("CommunityPostMapper.selectListCount");
		return count;
	}

	@Override
	public Community_Post selectOnePost(int postNo) {
		Community_Post post = sqlSession.selectOne("CommunityPostMapper.selectOnePost",postNo);
		return post;
	}

	@Override
	public int addReadCount(int postNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertCoummunityPost(Community_Post post) {
		int result = sqlSession.insert("CommunityPostMapper.insertPost",post);
		return result;
	}

	@Override
	public int insertFile(Community_File File) {
		int result = sqlSession.insert("CommunityPostMapper.uploadFile",File);
		return result;
	}

	@Override
	public int updateCommunityPost(Community_Post communityPost) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Community_Reply> selectAllReply(List<Community_Reply> rList) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertReply(Community_Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReply(Community_Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReply(Community_Reply reply) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insertHeart(Heart heart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteHeart(Heart heart) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Community_Post> selectAllPost(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getCommunityLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getCommunityLimit());
		List<Community_Post> cList = sqlSession.selectList("CommunityPostMapper.selectAllList",pi,rowBounds);
		return cList;
	}

	@Override
	public List<Community_Post> selectSearchAll(PageInfo pi) {
		int offset = (pi.getCurrentPage() -1 ) * pi.getCommunityLimit();
		RowBounds rowBounds = new RowBounds(offset,pi.getCommunityLimit());
		List<Community_Post> searchList = sqlSession.selectList("CommunityPostMapper.selectSearchList",pi,rowBounds);
		return searchList;
	}

	@Override
	public int getSearchListcount(String searchKeyword) {
		int count = sqlSession.selectOne("CommunityPostMapper.selectSearchListCount",searchKeyword);
		return count;
	}

	@Override
	public List<Community_File> selectOnePostFile(int postNo) {
		List<Community_File> fileList = sqlSession.selectList("CommunityPostMapper.selectOnePostFile",postNo);
		return fileList;
	}

	@Override
	public int deletePost(int postNo) {
		int result = sqlSession.delete("CommunityPostMapper.deletePost",postNo);
		return result;
	}

	@Override
	public int deleteFile(int postNo) {
		int result = sqlSession.delete("CommunityPostMapper.deleteFile",postNo);
		return result;
	}

	@Override
	public int updatePost(Community_Post communityPost) {
		int result = sqlSession.update("CommunityPostMapper.updatePost",communityPost);
		return result;
	}


	@Override
	public int ReinsertFile(Community_File File) {
		int result = sqlSession.insert("CommunityPostMapper.reUpload",File);
		return result;
	}

	@Override
	public Community_Post selectCommunityPostNo(Community_Post communityPost) {
		Community_Post postNo = sqlSession.selectOne("CommunityPostMapper.postNo",communityPost);
		return postNo;
	}

	@Override
	public int updateFile(List<String> fileNames) {
		int result = sqlSession.delete("CommunityPostMapper.deleteFileName",fileNames);
		return result;
	}

}
