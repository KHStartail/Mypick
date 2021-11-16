package com.pick.my.member.store.logic;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pick.my.member.domain.Member;
import com.pick.my.member.store.MemberStore;


@Repository
public class MemberStoreLogic implements MemberStore{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public Member loginMember(Member memberOne) {
		Member mOne = sqlSession.selectOne("memberMapper.selectLoginMember", memberOne);
		return mOne;
	}

	@Override
	public int checkIdDup(String userId) {
		int result = sqlSession.selectOne("memberMapper.checkIdDup", userId);
		return result;
	}

	@Override
	public int registerMember(Member member) {
		int result = sqlSession.insert("memberMapper.insertMember", member);
		return result;
	}

	@Override
	public int modifyMember(Member member) {
		int result = sqlSession.update("memberMapper.updateMember", member);
		return result;
	}  

	@Override
	public int removeMember(String userId) {
		int result = sqlSession.update("memberMapper.deleteMember", userId);
		return result;
	}

	@Override
	public int searchId(int userNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int searchPwd(Member memberOne) {
		// TODO Auto-generated method stub
		return 0;
	}

}
