package com.pick.my.member.service;

import com.pick.my.member.domain.Member;

public interface MemberService {
	public Member loginMember(Member memberOne);
	public int checkIdDup(String userId);
	public int registerMember(Member member);
	public int modifyMember(Member member);
	public int removeMember(String userId);
	public int searchId(int userNo);
	public int searchPwd(Member memberOne);
	public void certifiedPhoneNumber(String userPhoneNumber,int randomNumber);
}
