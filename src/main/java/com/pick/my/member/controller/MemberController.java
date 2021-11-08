package com.pick.my.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pick.my.member.service.MemberService;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="loginView.kh",method=RequestMethod.GET)
	public String loginView() {
		return "login";
	}
}
