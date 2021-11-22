package com.pick.my.member.service.logic;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.member.domain.Member;
import com.pick.my.member.service.MemberService;
import com.pick.my.member.store.MemberStore;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberStore store;

	@Override
	public Member loginMember(Member memberOne) {
		Member mOne = store.loginMember(memberOne);
		return mOne;
	}

	@Override
	public int checkIdDup(String userId) {
		int result = store.checkIdDup(userId);
		return result;
	}

	@Override
	public int registerMember(Member member) {
		int result = store.registerMember(member);
		return result;
	}
	@Override
	public int registerManager(Member member) {
		int result = store.registerManager(member);
		return result;
	}
	@Override
	public int modifyMember(Member member) {
		int result = store.modifyMember(member);
		return result;
	}

	@Override
	public int removeMember(String userId) {
		int result = store.removeMember(userId);
		return result;
	}

	@Override
	public String searchId(int phoneNumber) {
		String userId = store.searchId(phoneNumber);
		return userId;
	}

	@Override
	public Member searchPwd(Member member) {
		Member member2 = store.searchPwd(member);
		return member2;
	}
	public void certifiedPhoneNumber(String userPhoneNumber, int randomNumber) { 
		String api_key = "NCSYUKDSLQQNRQPN"; 
		String api_secret = "3ZGPGS23M4LICFVSZ35HL5GVSFY2JCOG"; 
		Message coolsms = new Message(api_key, api_secret); 
		// 4 params(to, from, type, text) are mandatory. must be filled 
		HashMap<String, String> params = new HashMap<String, String>(); 
		params.put("to", userPhoneNumber); // 수신전화번호 
		params.put("from", "01022903185"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨 
		params.put("type", "SMS"); 
		params.put("text", "[TEST] 인증번호는" + "["+randomNumber+"]" + "입니다."); // 문자 내용 입력 
		params.put("app_version", "test app 1.2"); // application name and version 
		
		try { JSONObject obj = (JSONObject) coolsms.send(params); 
		System.out.println(obj.toString()); 
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
			}
		}
	@Override
	public int modifyPwd(Member member) {
		int result = store.modifyPwd(member);
		return result;
	}

	@Override
	public Member userchk(Member userEmail) {
		Member chk = store.userchk(userEmail);
		return chk;
	}

}

	

