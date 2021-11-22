package com.pick.my.home.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.pick.my.goods.domain.Goods;
import com.pick.my.home.service.HomeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private HomeService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "home.pick", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		List<Goods> gList = service.printAllGoods();
		
		System.out.println(gList.toString());
		if(!gList.isEmpty()) {
			model.addAttribute("gList", gList);
			return "common/index2";			
		}else {
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping(value="slideGoodsDetail.pick",method = RequestMethod.GET)
	public String slideGoodsDetail(@RequestParam("goodsNo") int goodsNo,
			@RequestParam("groupName") String groupName) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		
		
		return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
	}
}
