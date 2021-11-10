package com.pick.my.supporting.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PageInfo;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.service.SupportingService;

@Controller
public class SupportingController {
	@Autowired
	private SupportingService service;
//	Member loginUser = (Member)session.getAttribute("UserNickName");
	
	//모집중 서포팅 게시글 전체 조회
	@RequestMapping(value="presupportingList.pick", method=RequestMethod.GET)
	public ModelAndView preSupportingListView(ModelAndView mv) {
		List<Supporting> psList = service.printAllPreSupporting(); //int supCategory);
		 if(!psList.isEmpty()) { 
			 mv.addObject("psList", psList); 
			 mv.setViewName("supporting/preSupportingList");
		 }else {
			 mv.addObject("msg", "모집중 서포팅 게시글 전체조회 실패"); 
			 mv.setViewName("supporting/supportError"); 
		 }
		 return mv;
	}
	//진행중 서포팅 게시글 전체 조회
	@RequestMapping(value="supportingList.pick", method=RequestMethod.POST)
	public ModelAndView supportingListView(ModelAndView mv) {
//		if(loginUser != null) {
			List<Supporting> ssList = service.printAllSupporting();//int supCategory);
			if(!ssList.isEmpty()) {
				mv.addObject("ssList", ssList);
				mv.setViewName("supporting/supportingList");;
			}else{
				mv.addObject("msg", "진행중 서포팅 게시글 전체조회 실패");
				mv.setViewName("supporting/supportError");
			}
			return mv;
		/*
		 * }else { 
		 * 	alert('로그인 후 이용해주세요');
		 * }
		 */
	}
	//모집중 검색
	@RequestMapping(value="",method=RequestMethod.GET)
	public String supportingSearchList() {
		
		return null;
	}
	//진행중 검색
	@RequestMapping(value="",method=RequestMethod.GET)
	public String presupportingSearchList() {
			
		return null;
	}
	
	//모집중 상세조회
	@RequestMapping(value="presupportingDetail.pick", method=RequestMethod.GET)
	public String presupportingDetail(@RequestParam("supTitle") String supTitle) {
		return null;
	}
	//진행중 상세조회
	@RequestMapping(value="supportingDetail.pick", method=RequestMethod.POST)
	public String supportingDetail() {
		return null;
	}
	//서포팅 작성 이동
	@RequestMapping(value="supportingWriteView.pick", method=RequestMethod.GET)
	public String supportingWriteView(HttpSession session) {
	//	Member loginUser = (Member)session.getAttribute("userNickName");
		return "supporting/supportingWrite";
	}
	//서포팅 작성하기
	@RequestMapping(value="", method=RequestMethod.GET)
	public String registerSupporting() {		
		return null;
	}
	
	//서포팅 수정
	@RequestMapping(value="supportingModify.pick", method=RequestMethod.GET)
	public String modifySupporting() {
		return null;
	}
	
	//서포팅 삭제
	@RequestMapping(value="supportingDelete.pick", method=RequestMethod.GET)
	public String deleteSupporting() {
		return null;
	}
	
	//파일삭제
	
	//서포팅 참여
}
