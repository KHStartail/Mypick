package com.pick.my.member.store;

import com.pick.my.member.domain.Member;

public interface MemberStore {
	public Member loginMember(Member memberOne);
	public int checkIdDup(String userId);
	public int registerMember(Member member);
	public int registerManager(Member member);
	public int modifyMember(Member member);
	public int removeMember(String userId);
	public String searchId(int phoneNumber);
	public Member searchPwd(Member member);
	public int modifyPwd(Member member);
	public Member userchk(Member member);
	public Member selectOne(int userNo);
	public int updateMember(Member member);
}
