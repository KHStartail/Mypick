package com.pick.my.goods.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pick.my.community.domain.Community_File;
import com.pick.my.goods.domain.Cart;
import com.pick.my.goods.domain.Goods;
import com.pick.my.goods.domain.GoodsFile;
import com.pick.my.goods.domain.GoodsPageInfo;
import com.pick.my.goods.domain.GoodsPayment;
import com.pick.my.goods.domain.Review;
import com.pick.my.goods.domain.Search;
import com.pick.my.goods.domain.goodsPagination;
import com.pick.my.goods.domain.historyPagination;
import com.pick.my.goods.service.GoodsService;
import com.pick.my.member.domain.Member;

@Controller
public class GoodsController {

	@Autowired
	private GoodsService service;
	
	
	
	//리스트
	@RequestMapping(value="goodsList.pick", method=RequestMethod.GET)
	public ModelAndView showGoodsList(ModelAndView mv,
			@RequestParam(value="page", required = false)Integer page,HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		int currentPage = (page != null)? page : 1;
		int totalCount = service.getListCount();
		GoodsPageInfo pi = goodsPagination.getPageInfo(currentPage, totalCount);
		List<Goods> gList = service.printAll(pi);
		if(!gList.isEmpty()) {
			mv.addObject("loginUser",loginUser);
			mv.addObject("gList", gList);
			mv.addObject("pi", pi);
			mv.setViewName("goods/goodsList");
		}else {
			mv.addObject("msg","실패");
			mv.setViewName("goods/goodsList");
		}
		return mv;
	}
	
	//알람뷰
	@RequestMapping(value = "goodsAlert.pick", method=RequestMethod.GET)
	public String goodsAlertView() {
		return "goods/goodsAlert";
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
			HttpSession session,
			Model model) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		goods.setUserId(loginUser.getUserId());
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
			@RequestParam("goodsNo")int goodsNo,
			@RequestParam("groupName") String groupName,
			HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Goods goods = service.printOne(goodsNo);
		List<Goods> gList = service.printSlideGoods(groupName);
		List<GoodsFile> fList = service.showFileList(goodsNo);
		List<Review> rList = service.showReviewList(goodsNo);
		List<Review> reList = service.showReplyList(goodsNo);
		if(goods != null) {
			mv.addObject("loginUser",loginUser);
			mv.addObject("goods",goods);
			mv.addObject("gList",gList);
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
			HttpSession session,
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
			@RequestParam("groupName")String groupName,
			@RequestParam(value="reloadMainFile", required = false)MultipartFile reloadFile,
			MultipartHttpServletRequest mRequest,
			Model model) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
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
			return "redirect:goodsDetail.pick?goodsNo="+goods.getGoodsNo()+"&groupName="+encodedParam;
		}else {
			model.addAttribute("msg", "수정 실패");
			return "common/errorPage";
		}
		}
		return "redirect:goodsDetail.pick?goodsNo="+goods.getGoodsNo()+"&groupName="+encodedParam;
	}
	
	//검색
	@RequestMapping(value="goodsSearch.pick", method = RequestMethod.GET)
	public String goodsSearchList(@ModelAttribute Search search,
			Model model,
			@RequestParam(value="page", required = false)Integer page) {
		
		int currentPage = (page != null)? page : 1;
		int totalCount = service.getListCount(search);
		GoodsPageInfo pi = goodsPagination.getPageInfo(currentPage, totalCount);
		pi.setGoodsName(search.getSearchValue());
		pi.setGroupName(search.getSearchValue());
		pi.setIdolName(search.getSearchValue());
		
		List<Goods> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("gList",searchList);
			model.addAttribute("search", search);
			model.addAttribute("pi",pi);
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
			@RequestParam(value="groupName")String groupName,
			HttpServletRequest request,
			HttpSession session,
			Model model) throws UnsupportedEncodingException {
		   String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		Member loginUser = (Member)session.getAttribute("loginUser");
		review.setUserId(loginUser.getUserId());
		
		if(!revFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(revFile, request);
			if(filePath != null) {
				review.setImgPath(revFile.getOriginalFilename());
				review.setImgSize(revFile.getSize());
			}
		}
		
		int result = service.registerReview(review);
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
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
			@RequestParam("groupName")String groupName,
			HttpServletRequest request) throws UnsupportedEncodingException{
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		int result = service.removeReview(revNo);
		if(result > 0) {
			if(imgPath != "") {
				deleteFile(imgPath, request);
			}
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
		}else {
			model.addAttribute("msg","삭제 실패");
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
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
	public String insertReply(@ModelAttribute Review review, HttpSession session) {

		Member loginUser = (Member)session.getAttribute("loginUser");
		review.setUserId(loginUser.getUserId());
		
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
			@RequestParam("groupName")String groupName,
			HttpServletRequest request) throws UnsupportedEncodingException {
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		int result = service.removeReply(revNo);
		if(result > 0) {
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
		}else {
			model.addAttribute("msg","삭제 실패");
			return "redirect:goodsDetail.pick?goodsNo="+goodsNo+"&groupName="+encodedParam;
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
			@RequestParam("goodsAmount")String amount,
			HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		Goods goods = service.printOne(goodsNo);
		if(goods != null) {
			goods.setGoodsAmount(amount);
			mv.addObject("loginUser",loginUser);
			mv.addObject("goods", goods);
			mv.setViewName("goods/goodsPayment");
		}else {
			mv.addObject("msg","조회 실패");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}
	
	//결제정보입력
	@RequestMapping(value="goodsPayInfo.pick", method=RequestMethod.POST)
	public String goodsPayInfo(HttpServletRequest request,
			@ModelAttribute GoodsPayment pay,
			@RequestParam("userPhone1") String userPhone1,
			@RequestParam("userPhone2") String userPhone2,
			@RequestParam("userPhone3") String userPhone3,
			@RequestParam("userAddr2") String userAddr2,
			@RequestParam("userAddr3") String userAddr3,
			HttpSession session){
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		pay.setUserId(loginUser.getUserId());
		pay.setUserPhone(userPhone1+userPhone2+userPhone3);
		pay.setUserAddr(userAddr2+userAddr3);
		
		try {
			int result = service.registerPayInfo(pay);
			if(result > 0) {
				return "goods/goodsAlert";
			}else {
				request.setAttribute("msg", "실패");
				return "common/errorPage";
			}
		}catch(Exception e) {
			e.printStackTrace();
			request.setAttribute("msg", e.toString());
			return "common/errorPage";
		}
		
	}
	
	//장바구니 등록
	@ResponseBody
	@RequestMapping(value="cartAdd.pick", method = RequestMethod.POST)
	public String registerCart(HttpServletRequest request,
			@ModelAttribute Cart cart,
			@RequestParam("goodsNo")int goodsNo,
			@RequestParam("goodsName")String goodsName,
			@RequestParam("goodsPrice")int goodsPrice,
			@RequestParam("goodsAmount")int goodsAmount,
			@RequestParam("imgPath") String imgPath,
			@RequestParam("groupName")String groupName,
			HttpSession session) {
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		cart.setUserId(loginUser.getUserId());
		cart.setGoodsNo(goodsNo);
		cart.setGoodsName(goodsName);
		cart.setGoodsPrice(goodsPrice);
		cart.setImgPath(imgPath);
		cart.setGroupName(groupName);
		System.out.println(cart.toString());
		String answer = "success";
		
		int result = service.insertCart(cart);
		if(result > 0) {
			answer = "success";
		}else {
			answer = "no";
		}

		return answer;
		
	}

	
	//마이페이지 결제내역
	
	@RequestMapping(value="showHistoryGoods.pick", method = RequestMethod.GET)
	public String historyGoods() {
		return "myPage/historyGoods";
	}
	
	@RequestMapping(value="historyGoods.pick", method = RequestMethod.GET)
	public ModelAndView showGoodsHistory(ModelAndView mv,
			@RequestParam(value="page",required = false)Integer page,
			HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		GoodsPayment pay = new GoodsPayment();
		pay.setUserId(loginUser.getUserId());
		
		int currentPage = (page != null)? page : 1;
		int totalCount = service.getMypageGoodsCount(pay.getUserId());
		GoodsPageInfo pi = historyPagination.getPageInfo(currentPage, totalCount);
		Map<String,Object>map = new HashMap<String,Object>();
		map.put("userId", pay.getUserId());
		System.out.println(pay.getUserId());
		map.put("pi",pi);
		List<GoodsPayment> pList = service.printGoodsHistory(map);
		if(!pList.isEmpty()) {
			mv.addObject("loginUser",loginUser);
			mv.addObject("pList",pList);
			mv.addObject("pi",pi);
			mv.setViewName("myPage/historyGoods");
		}else {
			mv.setViewName("myPage/historyGoods");
		}
		
		return mv;
	}
	
	//마이페이지 장바구니
	@RequestMapping(value="showMypageCart.pick", method = RequestMethod.GET)
	public String mypageCart() {
		return "myPage/mypageCart";
	}
	
	@RequestMapping(value="mypageCart.pick", method = RequestMethod.GET)	
	public ModelAndView showMyPageCart(ModelAndView mv,
			HttpSession session) {
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		Cart cart = new Cart();
		cart.setUserId(loginUser.getUserId());
		
		List<Cart> cList = service.printCartList(cart.getUserId());
		
		if(!cList.isEmpty()) {
			mv.addObject("loginUser",loginUser);
			mv.addObject("cList",cList);
			mv.setViewName("myPage/mypageCart");
		}else {
			mv.setViewName("myPage/mypageCart");
		}
		return mv;
	}
	
	
	//장바구니 삭제
	@ResponseBody
	@RequestMapping(value="deleteCart.pick", method=RequestMethod.POST)
	public String deleteCart(Model model,
			HttpServletRequest request,
			@RequestParam(value="choiceOne")List<String>choice) {

		int result = 0;
		for(int i =0; i<choice.size(); i++) {
			result = service.deleteCart(choice.get(i));
			System.out.println(result);
		}

		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}

	//카트 결제창 출력
	@RequestMapping(value="CartPaymentView.pick", method=RequestMethod.GET)
	public String cartPaymentView(HttpSession session) {
		
		

		return "goods/mypageCartPayment";
	}
	
	//장바구니 결제
	@ResponseBody
	@RequestMapping(value="paymentCart.pick", method = RequestMethod.POST)
	public String paymentCart(Model model,
			HttpServletRequest request,
			@RequestParam(value="choiceOne")List<String>choice,
			HttpSession session) {
		
		
		List<Cart> cList = new ArrayList<Cart>();
		for(int i =0; i<choice.size(); i++) {
			cList.addAll(service.printCartPayment(choice.get(i)));
		}
		System.out.println(cList.toString());
		
		if(!cList.isEmpty()) {
			session.setAttribute("cList", cList);
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@RequestMapping(value="cartPayInfo.pick", method = RequestMethod.POST)
	public String cartPayInfo(HttpServletRequest request,
			@RequestParam("userPhone1") String userPhone1,
			@RequestParam("userPhone2") String userPhone2,
			@RequestParam("userPhone3") String userPhone3,
			@RequestParam("userAddr2") String userAddr2,
			@RequestParam("userAddr3") String userAddr3,
			@RequestParam("userName") String userName,
			@RequestParam("userEmail") String userEmail,
			@RequestParam("userMsg") String userMsg,
			HttpSession session) {
		List<Cart> cList = (List<Cart>)session.getAttribute("cList");
		Member loginUser = (Member)session.getAttribute("loginUser");
//		List<GoodsPayment> pList = new ArrayList<GoodsPayment>();
		int result = 0;
		int result2 = 0;
		for(int i =0; i<cList.size(); i++) {
			GoodsPayment pay = new GoodsPayment();
			pay.setGoodsNo(cList.get(i).getGoodsNo());
			pay.setGoodsAmount(cList.get(i).getGoodsAmount());
			pay.setGoodsName(cList.get(i).getGoodsName());
			pay.setGoodsPrice(cList.get(i).getGoodsPrice());
			pay.setImgPath(cList.get(i).getImgPath());
			pay.setGroupName(cList.get(i).getGroupName());
			pay.setUserId(loginUser.getUserId());
			pay.setUserPhone(userPhone1+userPhone2+userPhone3);
			pay.setUserAddr(userAddr2+userAddr3);
			pay.setUserName(userName);
			pay.setUserEmail(userEmail);
			pay.setUserMsg(userMsg);
			
			result = service.registerCartPayInfo(pay);
		}
		
			if(result > 0) {
				for(int i =0; i<cList.size(); i++) {
					int cartNo = cList.get(i).getCartNo();
					result2 = service.deleteSuccessCart(cartNo);
				}
				if(result2 > 0) {
					return "goods/goodsAlert";					
				}else {
					request.setAttribute("msg", "실패");
					return "common/errorPage";					
				}
			}else {
				request.setAttribute("msg", "실패");
				return "common/errorPage";
			}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
