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
}
