package com.pick.my.member.service.logic;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pick.my.member.store.MemberStore;


@Service
public class MemberServiceImpl {
	
	@Autowired
	private MemberStore store;
}
