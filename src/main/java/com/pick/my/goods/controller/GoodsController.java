package com.pick.my.goods.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PageInfo;
import com.pick.my.common.Pagination;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.Search;
import com.pick.my.goods.service.GoodsService;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService service;
	
	
	
	//리스트
	@RequestMapping(value="goodsList.pick", method=RequestMethod.GET)
	public ModelAndView showGoodsList(ModelAndView mv,
			@RequestParam(value="page", required = false)Integer page) {
		int currentPage = (page != null)? page : 1;
		int totalCount = service.getListCount();
		PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		List<Goods> gList = service.printAll(pi);
		if(!gList.isEmpty()) {
			mv.addObject("gList", gList);
			mv.addObject("pi", pi);
			mv.setViewName("goods/goodsList");
		}else {
			mv.addObject("msg","실패");
			mv.setViewName("goods/goodsList");
		}
		return mv;
	}
	
	
	//인서트
	@RequestMapping(value="goodsInsertView.pick", method = RequestMethod.GET)
	public String goodsWirteView() {
		
		return "goods/goodsInsert";
	}
	
	@RequestMapping(value="goodsRegister.pick", method = RequestMethod.POST)
	public String registerBoard(@ModelAttribute Goods goods,
			@RequestParam(value="mainFile", required = false)MultipartFile mainFile,
			HttpServletRequest request,
			Model model) {
		
		if(!mainFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(mainFile, request);
			if(filePath != null ) {
				goods.setImgPath(mainFile.getOriginalFilename());
				goods.setImgSize(mainFile.getSize());
			}
		}
		
		int result = service.registerGoods(goods);
		if(result > 0) {
			return "redirect:goodsList.pick";
		}else {
			model.addAttribute("msg","등록 실패");
			return "common/errorPage";
			
		}
	}
	
	public String saveFile(MultipartFile mainFile, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root+"\\goodsFiles";
		File folder = new File(savePath);
		
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		
		String filePath = folder+"\\"+mainFile.getOriginalFilename();
		
		try {
			mainFile.transferTo(new File(filePath));			
		}catch(IllegalStateException e) {
			e.printStackTrace();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return filePath;
	}
	
	
	@RequestMapping(value="goodsDetail.pick", method = RequestMethod.GET)
	public ModelAndView goodsDetail(ModelAndView mv,
			@RequestParam("goodsNo")int goodsNo) {
		
		Goods goods = service.printOne(goodsNo);
		if(goods != null) {
			mv.addObject("goods",goods);
			mv.setViewName("goods/goodsDetail");
		}else {
			mv.addObject("msg","조회 실패");
			mv.setViewName("goods/goodsList");
		}
		
		return mv;
	}
	
	//삭제
	@RequestMapping(value="goodsDelete.pick", method=RequestMethod.GET)
	public String goodsDelete(Model model,
			@RequestParam("goodsNo") int goodsNo,
			@RequestParam("imgName")String imgName,
			HttpServletRequest request) {
		
		int result = service.removeGoods(goodsNo);
		if(result > 0) {
			if(imgName != "") {
				deleteFile(imgName, request);
			}
			return "redirect:goodsList.pick";
		}else {
			model.addAttribute("msg", "삭제 실패");
			return "goods/goodsList";			
		}
		
	}
	
	public void deleteFile(String imgName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root+"\\goodsFiles";
		File file = new File(fullPath+"\\"+imgName);
		if(file.exists()) {
			file.delete();
		}
	}
	
	
	//수정
	@RequestMapping(value="goodsUpdate.pick", method=RequestMethod.GET)
	public String goodsUpdateView(@RequestParam("goodsNo")int goodsNo,
			Model model) {
		Goods goods = service.printOne(goodsNo);
		model.addAttribute("goods", goods);
		
		return"goods/goodsUpdate";
	}
	
	@RequestMapping(value="goodsModify.pick", method = RequestMethod.POST)
	public String goodsModify(@ModelAttribute Goods goods,
			Model model,
			HttpServletRequest request,
			@RequestParam("reloadMainFile")MultipartFile reloadFile) {
		
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(goods.getImgPath() != null) {
				deleteFile(goods.getImgPath(), request);
			}
			String savePath = saveFile(reloadFile, request);
			if(savePath != null) {
				goods.setImgPath(reloadFile.getOriginalFilename());
			}
		}
		int result = service.updateGoods(goods);
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goods.getGoodsNo();
		}else {
			model.addAttribute("msg", "수정 실패");
			return "common/errorPage";
		}

	}
	
	
	@RequestMapping(value="goodsSearch.pick", method = RequestMethod.GET)
	public String goodsSearchList(@ModelAttribute Search search,
			Model model) {
		List<Goods> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("gList",searchList);
			model.addAttribute("search", search);
			return "goods/goodsList";
		}else {
			model.addAttribute("msg", "검색 실패");
			return "goods/goodsList";
		}
	}
	
	
	
	
	
	
	
	
}
