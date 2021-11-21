package com.pick.my.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MypageController {

	@RequestMapping(value="myPageMain.pick", method=RequestMethod.GET)
	public String myPageMainView() {
		return "myPage/mypageMain";
	}

	@RequestMapping(value="myPageModify.pick", method = RequestMethod.GET)
	public String myPageModify() {
		return "myPage/mypageModify";
	}
	
	
	@RequestMapping(value="historySupport.pick", method = RequestMethod.GET)
	public String historySupport() {
		return "myPage/historySupport";
	}
	
	@RequestMapping(value="postCommunity.pick", method = RequestMethod.GET)
	public String postCommunity() {
		return "myPage/postCommunity";
	}
	
	@RequestMapping(value="postSupport.pick", method = RequestMethod.GET)
	public String postSupport() {
		return "myPage/postSupport";
	}
	


}

