package com.pick.my.supporting.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.service.SupportingService;

@Controller
public class SupportingController {
	@Autowired
	private SupportingService service;
	
	//모집중 서포팅 게시글 전체 조회
	@RequestMapping(value="presupportingList.pick", method=RequestMethod.GET)
	public ModelAndView preSupportingListView(ModelAndView mv) {
		List<Supporting> pList = service.printAllPreSupporting(); 
		 if(!pList.isEmpty()) { 
			 mv.addObject("pList", pList); 
			 mv.setViewName("supporting/preSupportingList");
			 System.out.println(pList);
		 }else {
			 mv.addObject("msg", "모집중 서포팅 게시글 전체조회 실패"); 
			 mv.setViewName("supporting/supportError"); 
		 }
		 return mv;
	}
	
	//진행중 서포팅 게시글 전체 조회
	@RequestMapping(value="supportingList.pick", method=RequestMethod.POST)
	public ModelAndView supportingListView(ModelAndView mv, HttpSession session) {
//	Member loginUser = (Member)session.getAttribute("UserNickName");
//		if(loginUser != null) {
			List<Supporting> sList = service.printAllSupporting();//int supCategory);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
				mv.setViewName("supporting/supportingList");;
			}else{
				mv.addObject("msg", "진행중 서포팅 게시글 전체조회 실패");
				mv.setViewName("supporting/supportError");
			}
			return mv;
	}
		/*
		 * }else { 
		 * 	alert('로그인 후 이용해주세요');
		 * }
		 */

	/*
	 * //모집중 검색
	 * 
	 * @RequestMapping(value="",method=RequestMethod.GET) public String
	 * presupportingSearchList(@RequestParam("groupName")String
	 * idolName, @RequestParam("keyword") String keyword, Model model){
	 * HashMap<String, String> searchMap = new HashMap<String, String>();
	 * searchMap.put("idolName", idolName); searchMap.put("keyword", keyword);
	 * List<Supporting> psList = service.findKeywordPreSupporting(searchMap);
	 * if(!psList.isEmpty()) { model.addAttribute("psList", psList);
	 * model.addAttribute("psList", psList); return "supporting/preSupportingList";
	 * }else { model.addAttribute("msg", "검색결과가 없습니다."); return
	 * "supporting/supportError"; } } //진행중 검색
	 * 
	 * @RequestMapping(value="",method=RequestMethod.GET) public String
	 * supportingSearchList(@RequestParam("groupName") String
	 * idolName, @RequestParam("keyword") String keyword,Model model) {
	 * HashMap<String, String> searchMap = new HashMap<String, String>();
	 * searchMap.put("idolName", idolName); searchMap.put("keyword", keyword);
	 * List<Supporting> ssList = service.findKeywordPreSupporting(searchMap);
	 * if(!ssList.isEmpty()) { model.addAttribute("ssList", ssList);
	 * model.addAttribute("ssList", ssList); return "supporting/supportingList";
	 * }else { model.addAttribute("msg", "검색결과가 없습니다."); return
	 * "supporting/supportError"; } }
	 */
	//모집중 상세조회
	@RequestMapping(value="presupportingDetail.pick", method=RequestMethod.GET)
	public String presupportingDetail(@RequestParam("supNo") int supNo) {
		
		return null;
	}
	//진행중 상세조회
	@RequestMapping(value="supportingDetail.pick", method=RequestMethod.POST)
	public String supportingDetail() {
		return null;
	}
	//서포팅 작성 이동
	@RequestMapping(value="supportingWriteView.pick", method=RequestMethod.GET)
	public String supportingWriteView() {
		return "supporting/supportingWrite";
	}
	//서포팅 작성하기
	@RequestMapping(value="supportingRegister.pick", method=RequestMethod.GET)
	public String registerSupporting(@ModelAttribute Supporting supporting, @RequestParam("fileSize") long fileSize, @ModelAttribute SupFile supFile, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile, HttpServletRequest request, Model model) {
		try {
			if(!uploadFile.getOriginalFilename().equals("")) {
				String renameFileName = saveFile(supFile, uploadFile, request, model);
				if(renameFileName != null) {
					supFile.setFileName(uploadFile.getOriginalFilename());
					supFile.setFileSize(fileSize);
				}
			}
			int result = service.registerSupporting(supporting);
			if(result > 0) {
					return "redirect:presupportingList.pick";
			}else {
				model.addAttribute("msg", "서포팅 등록 실패");
				return "supporting/supportError";
			}
		}catch(Exception e) {
			model.addAttribute("msg", "서포팅 실패 : 관리자 문의");
			return "supporting/supportError";
		}
	}
	@ResponseBody
	public String saveFile (@ModelAttribute SupFile file, MultipartFile uploadFile, HttpServletRequest request, Model model) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\SupportingFiles";
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		String originalFileName = file.getFileName();
		String renameFile = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
		String filePath = folder + "\\" +  renameFile;  
		file.setFileReName(renameFile);
		file.setFilePath(filePath);
		int result = service.insertFile(file);
		if(result>0) {
			try {
				uploadFile.transferTo(new File(filePath));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return renameFile;
		}else {
			model.addAttribute("msg", "file error");
			return "redirect:presupportingList.pick";
		}
	}
	
	//서포팅 수정
	@RequestMapping(value="supportingModify.pick", method=RequestMethod.GET)
	public String modifySupporting(@ModelAttribute Supporting supporting, Model model) {
		
		return null;
	}
	
	//서포팅 삭제
	@RequestMapping(value="supportingDelete.pick", method=RequestMethod.GET)
	public String deleteSupporting(@RequestParam("supNo") int supNo) {
		
		return null;
	}
	
	//파일삭제
	
	//서포팅 참여
}
