package com.pick.my.supporting.controller;

import java.util.List;

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
	
	//모집중 서포팅 게시글 전체 조회
		@RequestMapping(value="presupportingList.pick", method=RequestMethod.GET)
		public ModelAndView preSupportingListView(ModelAndView mv) {
	//		List<Supporting> psList	= service.printAllPreSupporting();
	//		if(!psList.isEmpty()) {
			//	mv.addObject("psList", psList);
				//	mv.setViewName("supporting/preSupportingList");;
		//	}else{
			//	mv.addObject("msg", "모집중 서포팅 게시글 전체조회 실패");
			//	mv.setViewName("supporting/supportError");
			//}
			return mv;
		}
	//진행중 서포팅 게시글 전체 조회
	@RequestMapping(value="supportingList.pick", method=RequestMethod.GET)
	public ModelAndView supportingListView(ModelAndView mv) {
		List<Supporting> ssList  =null;
		//	= service.printAllSupporting();//int supCategory);
		if(!ssList.isEmpty()) {
			mv.addObject("ssList", ssList);
			mv.setViewName("supporting/supportingList");;
		}else{
			mv.addObject("msg", "진행중 서포팅 게시글 전체조회 실패");
			mv.setViewName("supporting/supportError");
		}
		return mv;
	}
}
