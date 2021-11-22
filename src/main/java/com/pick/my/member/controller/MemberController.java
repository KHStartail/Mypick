package com.pick.my.member.controller;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.json.simple.JSONObject;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.pick.my.member.domain.Member;
import com.pick.my.member.service.MemberService;

import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;

	@RequestMapping(value="loginView.pick",method=RequestMethod.GET)
	public String loginView() {
		return "common/login";
	}
	
	@ResponseBody
	@RequestMapping(value="/login.pick", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member memberOne = new Member();
		memberOne.setUserId(userId);
		memberOne.setUserPwd(userPwd);
		String answer = "success";
		try {
			Member loginUser = service.loginMember(memberOne);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				answer = "success";
			}else {
				answer = "no";
			}
			return answer;
			
			
		}catch(Exception e) {
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
	}
	
	@RequestMapping(value="/logout.pick", method=RequestMethod.GET)
	public String memberLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
			return "redirect:index.jsp";
			
		}else {
			request.setAttribute("msg", "로그아웃 실패!");
			return "common/errorPage";
		}
}
	
	@RequestMapping(value="enrollView.pick",method=RequestMethod.GET)
	public String enrollview() {
		return "member/memberJoin";
	}
	@RequestMapping(value="findIdPwdView.pick",method=RequestMethod.GET)
	public String findIdPwdView() {
		return "member/findid";
	}
	@RequestMapping(value="managerEnrollView.pick",method=RequestMethod.GET)
	public String managerEnrollview() {
		return "member/managerJoin";
	}
	@RequestMapping(value="home.pick",method=RequestMethod.GET)
	public String homeView() {
		return "redirect:index.jsp";
	}
	@RequestMapping(value="memberModifyView.pick",method=RequestMethod.GET)
	public String memberModifyView() {
		return "member/membermodify";
	}
	
	
	@RequestMapping(value="memberRegister.pick",method = RequestMethod.POST)
	public String memberRegister(HttpServletRequest request
			,@ModelAttribute Member member
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2
			) {

		member.setUserAddr(post+","+address1+","+address2);
		try {
			int result = service.registerMember(member);
			if(result > 0) {
				return  "redirect:index.jsp";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/erroePage";
			}
		}catch (Exception e) {
		request.setAttribute("msg", e.toString());
		return "common/errorPage";
		}
	}


	@RequestMapping(value="managerRegister.pick",method = RequestMethod.POST)
	public String managerRegister(HttpServletRequest request
			,@ModelAttribute Member member
			,@RequestParam("post") String post
			,@RequestParam("address1") String address1
			,@RequestParam("address2") String address2
			) {

		member.setUserAddr(post+","+address1+","+address2);
		try {
			int result = service.registerMember(member);
			if(result > 0) {
				return  "redirect:index.jsp";
			}else {
				request.setAttribute("msg", "회원가입 실패");
				return "common/erroePage";
			}
		}catch (Exception e) {
		request.setAttribute("msg", e.toString());
		return "common/errorPage";
		}
	}

	
	@ResponseBody 
	@RequestMapping(value="checkDupId.pick", method = RequestMethod.GET)
	public String idDuplicateCheck(@RequestParam("userId") String userId){
		int result = service.checkIdDup(userId);
		return String.valueOf(result); 
	}



	@RequestMapping(value = "/phoneCheck.pick", method = RequestMethod.GET)
	@ResponseBody 
	public String sendSMS(@RequestParam("userPhone") String userPhoneNumber) {
		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000);//난수 생성 
		service.certifiedPhoneNumber(userPhoneNumber,randomNumber); 
		return Integer.toString(randomNumber); 
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId.pick", method = RequestMethod.POST)
	public String searchId(@RequestParam("userPhone") int userPhone){
		//System.out.print("searchId");
		String userId = service.searchId(userPhone);
		return userId;
	}
    
	@RequestMapping(value ="/modifyPwd.pick", method = RequestMethod.POST)
	public ModelAndView modifyPwd(@RequestParam("userPwd") String userPwd,
			@RequestParam("userId") String userId,
			ModelAndView mv, 
			Member member) { 
		member.setUserId(userId);
		member.setUserPwd(userPwd);
		int result = service.modifyPwd(member);
		
		if(result > 0) {
			mv.setViewName("common/login");
		}else{
			
		}
		return mv; 
	}
	
	
	@RequestMapping(value = "/findPwd.pick", method = RequestMethod.POST)
	public ModelAndView searchPwd(@RequestParam("userId") String userId,
			@RequestParam("userPhone") int userPhone,
			Member member){
		ModelAndView mv = new ModelAndView();
		member.setUserId(userId);
		member.setUserPhone(userPhone);
		Member member2 = service.searchPwd(member);
		
		if(member2 != null) {
			mv.addObject("member",member.getUserId());
			mv.setViewName("member/modifypwd");
			
			
		}else {
			mv.setViewName("common/login");
		}
		return mv;
	}
	@RequestMapping(value = "memberDelete.pick", method = RequestMethod.GET)
	public String memberDelete(@RequestParam("userId") String userId, Model model) {
		int result = service.removeMember(userId);
		if (result>0) {
			return "redirect:logout.pick";
		}else {
			model.addAttribute("msg", "회원탈퇴 실패");
			return "common/errorPage";
		}
	}
	
	 }
	

