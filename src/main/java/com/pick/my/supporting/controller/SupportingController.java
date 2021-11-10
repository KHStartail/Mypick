package com.pick.my.supporting.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PageInfo;
import com.pick.my.supporting.service.SupportingService;

@Controller
public class SupportingController {
	@Autowired
	private SupportingService service;
	
	
	@RequestMapping(value="supportingList.pick", method=RequestMethod.GET)
	public ModelAndView supportingListView(ModelAndView mv, @RequestParam(value="page", required=false)Integer page) {
		int currentPage = (page!=null) ? page: 1;
		int totalCount = service.getListCount();
	//	PageInfo pi = PageInfo.getPageInfo(currentPage, totalCount);
		
		return mv;
	}
}
