package com.pick.my.member.controller;



import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;


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
	
	@RequestMapping(value="/login.pick", method=RequestMethod.POST)
	public String memberLogin(HttpServletRequest request, HttpServletResponse response) {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		Member memberOne = new Member();
		memberOne.setUserId(userId);
		memberOne.setUserPwd(userPwd);
		try {
			Member loginUser = service.loginMember(memberOne);
			if(loginUser != null) {
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", loginUser);
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인 완료')");
				out.println("</script>");
			}else {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('아이디와 비밀번호를 확인해주세요.')");
				out.println("history.go(-1);");
				out.println("</script>");
			}
			return "redirect:index.jsp";
			
			
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
		}


