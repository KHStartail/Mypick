package com.pick.my.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PageInfo;
import com.pick.my.common.Pagination;
import com.pick.my.community.domain.Community_File;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.GoodsFile;
import com.pick.my.goods.domain.GoodsPayment;
import com.pick.my.goods.domain.Review;
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
//			@RequestParam(value="subFile2", required = false)List<MultipartFile> subFile,
//			HttpServletRequest request,
			MultipartHttpServletRequest mRequest,
			Model model) {

		if(!mainFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(mainFile, mRequest);
			if(filePath != null ) {
				goods.setImgPath(mainFile.getOriginalFilename());
				goods.setImgSize(mainFile.getSize());
			}
		}
		int mainResult = service.registerGoods(goods);
		
		String contextRoot = mRequest.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		List<MultipartFile> subFile = mRequest.getFiles("sec-File");
		
		int fileResult = 0;
			// 파일이 있으면.
			if(subFile.size() > 0 && !subFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:subFile) {
					fileRoot = contextRoot + "\\goodsSubFiles\\";
					System.out.println(fileRoot);
					File folder = new File(fileRoot);
					if (!folder.exists()) {
						folder.mkdir(); // 폴더 생성
					}
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot+savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						GoodsFile subImg = new GoodsFile();
						subImg.setImgName(file.getOriginalFilename());
						subImg.setImgReName(savedFileName);
						subImg.setImgSize(file.getSize());
						System.out.println(subImg.toString());
						fileResult += service.insertSubFile(subImg);
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}

		if(mainResult > 0) {
			return "redirect:goodsList.pick";				
		}else {
			model.addAttribute("msg","등록 실패");
			return "common/errorPage";
		}
			}	
			return "redirect:goodsList.pick";
	}
	

	//멀티 파일
	public String saveFile(MultipartFile mainFile, MultipartHttpServletRequest mRequest) {
		String root = mRequest.getSession().getServletContext().getRealPath("resources");
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
	
	//기본파일
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
		List<GoodsFile> fList = service.showFileList(goodsNo);
		List<Review> rList = service.showReviewList(goodsNo);
		List<Review> reList = service.showReplyList(goodsNo);
		if(goods != null) {
			mv.addObject("goods",goods);
			mv.addObject("fList",fList);
			mv.addObject("rList", rList);
			mv.addObject("reList",reList);
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
			@RequestParam("imgPath")String imgPath,
			HttpServletRequest request) {
		
		int result = service.removeGoods(goodsNo);
		if(result > 0) {
			if(imgPath != "") {
				deleteFile(imgPath, request);
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
		List<GoodsFile> fList = service.showFileList(goodsNo);
		model.addAttribute("goods", goods);
		model.addAttribute("fList", fList);
		return"goods/goodsUpdate";
	}
	
	@RequestMapping(value="goodsModify.pick", method = RequestMethod.POST)
	public String goodsModify(@ModelAttribute Goods goods,
//			Model model,
			HttpServletRequest request,
			@RequestParam("goodsNo") int goodsNo,
			@RequestParam(value="reloadMainFile", required = false)MultipartFile reloadFile,
			MultipartHttpServletRequest mRequest,
			Model model) {
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(goods.getImgPath() != null) {
				deleteFile(goods.getImgPath(), request);
			}
			String savePath = saveFile(reloadFile, request);
			if(savePath != null) {
				goods.setImgPath(reloadFile.getOriginalFilename());
				goods.setImgSize(reloadFile.getSize());
			}
		}
		int result = service.updateGoods(goods);
		
		
		String contextRoot = mRequest.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		List<MultipartFile> reloadSubFile = mRequest.getFiles("reloadSubFile");

		
		int fileResult = 0;
		if(reloadSubFile.size() > 0 && !reloadSubFile.get(0).getOriginalFilename().equals("")) {
			for(MultipartFile file:reloadSubFile) {
				fileRoot = contextRoot + "\\goodsSubFiles\\";
				System.out.println(fileRoot);
				File folder = new File(fileRoot);
				if (!folder.exists()) {
					folder.mkdir(); // 폴더 생성
				}
				String originalFileName = file.getOriginalFilename();	//오리지날 파일명
				String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
				String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
				
				File targetFile = new File(fileRoot+savedFileName);	
				try {
					InputStream fileStream = file.getInputStream();
					FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
					GoodsFile subImg = new GoodsFile();
					subImg.setGoodsNo(goodsNo);
					subImg.setImgName(file.getOriginalFilename());
					subImg.setImgReName(savedFileName);
					subImg.setImgSize(file.getSize());
					System.out.println(subImg.toString());
					fileResult += service.updateFileList(subImg);
				} catch (Exception e) {
					//파일삭제
					FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
					e.printStackTrace();
					break;
				}
			}
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goods.getGoodsNo();
		}else {
			model.addAttribute("msg", "수정 실패");
			return "common/errorPage";
		}
		}
		return "redirect:goodsDetail.pick?goodsNo="+goods.getGoodsNo();
	}
	
	//검색
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
	
	
	//리뷰등록
	@RequestMapping(value="goodsReviewInsert.pick", method=RequestMethod.POST)
	public String registerReview(@ModelAttribute Review review,
			@RequestParam(value="revFile", required = false)MultipartFile revFile,
			@RequestParam(value="goodsNo")int goodsNo,
			HttpServletRequest request,
			Model model) {
		
		if(!revFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(revFile, request);
			if(filePath != null) {
				review.setImgPath(revFile.getOriginalFilename());
				review.setImgSize(revFile.getSize());
			}
		}
		
		int result = service.registerReview(review);
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo;
		}else {
			model.addAttribute("msg","등록실패");
			return "common/errorPage";
		}
		
	}
	
	
	//리뷰삭제
	@RequestMapping(value="goodsReviewDelete.pick", method = RequestMethod.GET)
	public String reviewDelete(Model model,
			@RequestParam("revNo") int revNo,
			@RequestParam("imgPath")String imgPath,
			@RequestParam("goodsNo")int goodsNo,
			HttpServletRequest request) {
		
		int result = service.removeReview(revNo);
		if(result > 0) {
			if(imgPath != "") {
				deleteFile(imgPath, request);
			}
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo;
		}else {
			model.addAttribute("msg","삭제 실패");
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo;
		}
	}
	
	
	
	//리뷰수정
	@ResponseBody
	@RequestMapping(value="goodsReviewModify.pick", method=RequestMethod.POST)
	public String modifyReview(@ModelAttribute Review review) {
		int result = service.modifyReview(review);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	//답글 등록
	@ResponseBody
	@RequestMapping(value="insertReply.pick", method = RequestMethod.POST)
	public String insertReply(@ModelAttribute Review review) {

		int result = service.insertReply(review);
		if(result > 0) {
			return "success";
		}else {
			return "fail";			
		}
		
	}
	
	//답글삭제
	@RequestMapping(value="goodsReplyDelete.pick", method = RequestMethod.GET)
	public String deleteReply(Model model,
			@RequestParam("revNo")int revNo,
			@RequestParam("goodsNo")int goodsNo,
			HttpServletRequest request) {
		
		int result = service.removeReply(revNo);
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo;
		}else {
			model.addAttribute("msg","삭제 실패");
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo;
		}
		

	}
	
	
	//답글수정
	@ResponseBody
	@RequestMapping(value="goodsReplyModify.pick", method=RequestMethod.POST)
	public String modifyReply(@ModelAttribute Review review) {
		int result = service.modifyReply(review);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	
	//결제창 출력
//	@RequestMapping(value="goodsPaymentView.pick", method = RequestMethod.GET)
//	public String goodsPaymentView() {
//		
//		return "goods/goodsPayment";
//	}
	
	
	@RequestMapping(value="goodsPayment.pick", method = RequestMethod.GET)
	public ModelAndView goodsPayment(ModelAndView mv,
			@RequestParam("goodsNo")int goodsNo,
			@RequestParam("goodsAmount")String amount) {
		System.out.println(amount);
		Goods goods = service.printOne(goodsNo);
		if(goods != null) {
			goods.setGoodsAmount(amount);
			mv.addObject("goods", goods);
			mv.setViewName("goods/goodsPayment");
		}else {
			mv.addObject("msg","조회 실패");
			mv.setViewName("goods/goodsDetail?goodsNo="+goodsNo);
		}

		return mv;
	}
	
	//결제정보입력
	@RequestMapping(value="goodsPayInfo.pick", method=RequestMethod.POST)
	public String goodsPayInfo(HttpServletRequest request,
			@ModelAttribute GoodsPayment pay,
			@RequestParam("userPhone1") String userPhone1,
			@RequestParam("userPhone2") String userPhone2,
			@RequestParam("userPhone3") String userPhone3) {
		
		pay.setUserPhone(userPhone1+userPhone2+userPhone3);
		
		try {
			int result = service.registerPayInfo(pay);
			if(result > 0) {
				return "goods/goodsList";
			}else {
				request.setAttribute("msg", "실패");
				return "";
			}
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	
	
	
	
	
}
