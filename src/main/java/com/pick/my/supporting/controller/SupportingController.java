package com.pick.my.supporting.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PaymentHistory;
import com.pick.my.community.domain.Community_File;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.service.SupportingService;

@Controller
public class SupportingController {
	@Autowired
	private SupportingService service;
	private Supporting supporting;
	//모집중 서포팅 게시글 전체 조회
	@RequestMapping(value="presupportingList.pick", method=RequestMethod.GET)
	public ModelAndView preSupportingListView(ModelAndView mv) {
		List<Supporting> pList = service.printAllPreSupporting(); 
		 if(!pList.isEmpty()) { 
			 mv.addObject("pList", pList); 
			 mv.setViewName("supporting/preSupportingList");
		 }else {
			 mv.addObject("msg", "모집중 서포팅 게시글 전체조회 실패"); 
			 mv.setViewName("supporting/supportError"); 
		 }
		 return mv;
	}
	
	//진행중 서포팅 게시글 전체 조회
	@RequestMapping(value="supportingList.pick", method=RequestMethod.GET)
	public ModelAndView supportingListView(ModelAndView mv) {
//	Member loginUser = (Member)session.getAttribute("UserNickName");
//		if(loginUser != null) {
			List<Supporting> sList = service.printAllSupporting();//int supCategory);
			if(!sList.isEmpty()) {
				mv.addObject("sList", sList);
				mv.setViewName("supporting/supportingList");
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
	public ModelAndView presupportingDetail(@RequestParam("supNo") int supNo, ModelAndView mv) {
		Supporting supporting = service.preSupportingOne(supNo);
		System.out.println(supporting);
		if(supporting!=null) {
				mv.addObject("supporting", supporting);
				mv.setViewName("supporting/preSupportingDetailView");
		}else{
			mv.addObject("msg", "서포팅 상세조회 실패");
			mv.setViewName("supporting/supportError");
		}
		return mv;
	}
	//진행중 상세조회
	@RequestMapping(value="supportingDetail.pick", method=RequestMethod.GET)
	public  ModelAndView supportingDetail(HttpSession session, @RequestParam("supNo") int supNo,  ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		if(loginUser!=null) {
			Supporting supporting = service.supportingOne(supNo);
			if(supporting!=null) {
				mv.addObject("supporting", supporting);
				mv.setViewName("supporting/supportingDetailView");
			}else{
				mv.addObject("msg", "서포팅 상세조회 실패");
				mv.setViewName("supporting/supportError");
			}
		}else {
			mv.addObject("loginUser", loginUser);
			mv.setViewName("supporting/supportingDetailView");
		}
		return mv;
	}
	//서포팅 작성 이동
	@RequestMapping(value="supportingWriteView.pick", method=RequestMethod.GET)
	public String supportingWriteView() {
		return "supporting/supportingWrite";
	}
	//서포팅 작성하기
	@RequestMapping(value="supportingRegister.pick", method=RequestMethod.POST)
	public String registerSupporting(@RequestParam("sDate") String scheduleDate
			, @RequestParam("startDate") String supStartDate
			, @RequestParam("endDate") String supEndDate
			, @RequestParam(value= "uploadFile", required=false) MultipartFile uploadFile
			, @ModelAttribute Supporting supporting
			, @ModelAttribute SupFile supFile
			, MultipartHttpServletRequest multiRequest
			, Model model) {
		//HttpSession session) {
		//Member loginUser = (Member)session.getAttribute("UserNickName");
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//포맷시 date import: java.utill.Date
		supporting.setScheduleDate(scheduleDate);
		supporting.setSupStartDate(Date.valueOf(supStartDate));
		supporting.setSupEndDate(Date.valueOf(supEndDate));
		if(!uploadFile.getOriginalFilename().equals("")) {
			String renameFileName = saveFile(uploadFile, supporting, multiRequest);
			if(renameFileName != null) {
				supporting.setImgName(uploadFile.getOriginalFilename());
			}
		}
		int result = service.registerSupporting(supporting);
		List<MultipartFile> subFile = multiRequest.getFiles("subFile");
		String contextRoot =  multiRequest.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		int fileResult = 0;
		try {
			// 파일이 있으면.
 			if(subFile.size() > 0 && !subFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:subFile) {
					fileRoot = contextRoot + "\\supportingFiles";
				//	System.out.println(contextRoot);
					File folder = new File(fileRoot);
					System.out.println(folder);
					if (!folder.exists()) {
						folder.mkdir(); // 폴더 생성
					}
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
					String renameFile = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
					System.out.println(renameFile);
					String filePath = folder + "\\" +  renameFile;  
					System.out.println(filePath);
					File targetFile = new File(fileRoot + renameFile);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						supFile.setFileName(originalFileName);
						supFile.setFileReName(renameFile);
						supFile.setFilePath(filePath);
						fileResult += service.insertFile(supFile);
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
			}
			if(result > 0) {
				return "redirect:presupportingList.pick";
			}else {
				model.addAttribute("msg", "서포팅 등록 실패");
				return "supporting/supportError";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "서포팅 실패 : 관리자 문의");
			return "supporting/supportError";
		}
	}
	/**
	 * 대표이미지 업로드
	 * @param file
	 * @param uploadFile
	 * @param request
	 * @param model
	 * @return
	 */
	public String saveFile (
			MultipartFile uploadFile
			, Supporting supporting
			, MultipartHttpServletRequest multiRequest) {
		String root = multiRequest.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\supportingFiles";
		File folder = new File(savePath);
		System.out.println(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		String originalFileName = uploadFile.getOriginalFilename();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
		String renameFile = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
		String filePath = folder + "\\" +  renameFile;  
		try {
			uploadFile.transferTo(new File(filePath));
			supporting.setImgName(originalFileName);
			supporting.setImgReName(renameFile);
			supporting.setImgPath(filePath);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return renameFile;
	}
	//수정폼 이동
	@ResponseBody
	@RequestMapping(value="modifySupportingView.pick", method = RequestMethod.GET)
	public  ModelAndView modifySupportingView(ModelAndView mv
			, @RequestParam("supNo") int supNo) {
		Supporting supporting =service.preSupportingOne(supNo);
		List <SupFile> fList =service.printFileList(supNo);
		mv.addObject("supporting", supporting);
		mv.addObject("fList", fList);
		mv.setViewName("supporting/supportingUpdateView");
		return mv;
	}
	//글수정 
	@RequestMapping(value="supportingUpdate.pick", method=RequestMethod.POST)
	public String modifySupporting(
			@RequestParam("sDate") String scheduleDate
			, @RequestParam("startDate") String supStartDate
			, @RequestParam("endDate") String supEndDate
			, @RequestParam("supFileRename") String fileRename
			, @RequestParam(value= "reloadFile", required=false) MultipartFile reloadFile
			, @ModelAttribute Supporting supporting
			, @ModelAttribute SupFile supFile
			, MultipartHttpServletRequest multiRequest
			, Model model) {
		//수정시  업로드된 파일 있을경우, 삭제 후 다시 업로드
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//포맷시 date import: java.utill.Date
		supporting.setScheduleDate(scheduleDate);
		supporting.setSupStartDate(Date.valueOf(supStartDate));
		supporting.setSupEndDate(Date.valueOf(supEndDate));
		//기존파일삭제
		if(reloadFile!=null && !reloadFile.isEmpty()) {
			if(supporting.getImgPath()!=null) {
				deleteFile(supporting.getSupNo(),supporting.getImgReName(),multiRequest);
				deleteFileList(supFile.getSupNo(),supFile.getFileReName(), multiRequest);
			}
		}
		//새파일 업로드(대표이미지)
		String FileRename = saveFile(reloadFile, supporting, multiRequest);
		if(FileRename!=null) {
				supporting.setImgName(reloadFile.getOriginalFilename());
				supporting.setImgReName(fileRename);
		}
		int result = service.modifySupporting(supporting);
		List<MultipartFile> subFile = multiRequest.getFiles("subFile");
		String contextRoot =  multiRequest.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		int fileResult = 0;
		try {
			// 파일이 있으면.
 			if(subFile.size() > 0 && !subFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:subFile) {
					fileRoot = contextRoot + "\\supportingFiles\\";
				//	System.out.println(contextRoot);
					File folder = new File(fileRoot);
					System.out.println(folder);
					if (!folder.exists()) {
						folder.mkdir(); // 폴더 생성
					}
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
					String renameFile = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
					String filePath = folder + "\\" +  renameFile;  
					File targetFile = new File(fileRoot + renameFile);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						supFile.setFileName(originalFileName);
						supFile.setFileReName(renameFile);
						supFile.setFilePath(filePath);
						fileResult += service.insertFile(supFile);
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
			}
			if(result > 0) {
				return "redirect:presupportingList.pick";
			}else {
				model.addAttribute("msg", "서포팅 수정 실패");
				return "supporting/supportError";
			}
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("msg", "서포팅 실패 : 관리자 문의");
			return "supporting/supportError";
		}
	}

	//파일 재업로드
	@ResponseBody
	@RequestMapping(value = ".pick", method = RequestMethod.POST)
	public String fileReload(
			@RequestParam("reloadFile") List<MultipartFile> multipartFile
			, HttpServletRequest request
			, SupFile file
			,@RequestParam int supNo
			, MultipartFile reloadFile
			, Supporting supporting
			, MultipartHttpServletRequest multiRequest) {
	String root = multiRequest.getSession().getServletContext().getRealPath("resources");
	String savePath = root + "\\supportingFiles";
	File folder = new File(savePath);
	System.out.println(savePath);
	if(!folder.exists()) {
		folder.mkdir();
	}
	String originalFileName = reloadFile.getOriginalFilename();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
	String renameFile = sdf.format(new Date(System.currentTimeMillis()))+"."+originalFileName.substring(originalFileName.lastIndexOf(".")+1); 
	String filePath = folder + "\\" +  renameFile;  
	try {
		reloadFile.transferTo(new File(filePath));
		supporting.setImgName(originalFileName);
		supporting.setImgReName(renameFile);
		supporting.setImgPath(filePath);
	} catch (IllegalStateException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	}
	return renameFile;
}
	
	//서포팅 삭제
	@RequestMapping(value="supportingDelete.pick", method=RequestMethod.GET)
	public String deleteSupporitng(@RequestParam("supNo") int supNo
			, @RequestParam("fileNames") List<SupFile> fileNames
			, @RequestParam("imgName") String imgName
			, Model model, HttpServletRequest request) {
		int result = service.removeSupporting(supNo);
		if(result >  0) {
			if(fileNames != null) {
				deleteFile(supNo, imgName,request);
			}
			return "redirect:presupportingList.pick";
		}else {
			model.addAttribute("msg", "서포팅 삭제 실패!");
			return "supporting/supportError";
		}
	}
	
	//파일삭제
	public void deleteFile(int supNo, String imgName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\\supportingFiles";
		File file = new File(fullPath + "\\" + imgName);
			if(file.exists()) {
				file.delete();
				int result = service.deleteFile(supNo);
			}
	}
	
	//다중파일 삭제
	public void deleteFileList(int supNo, String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\supportingFiles";
	//	for(int i =0; i < filePath.(); i++) {
	//		File file = new File(filePath + "\\" +fileName.get(i));
	//		if(file.exists()) {
	//			file.delete();
	//		}
	//	}
	}
	//서포팅 
	//public String addSupReply(@RequestParam("supNo") int supNo, HttpServeltRequest, Model model){
		

	//public String addSupReplyChild(int, HttpServletRequest, Model) 
	//public String modifySupReply(int, Model, HttpServeltRequest)
	//public String modifySupReplyChild(int, Model, HttpServletRequest)
	//public String deleteSupReply(int, Model, HttpServletRequest
	//public String deleteSupReplyChild(int, Model, HttpServletRequest)
	//public String reportSupReply(SupReplyReport, Model, HttpServletRequest)
	//서포팅 결제
	public String getPayment(@ModelAttribute PaymentHistory ph, @RequestParam("supNo") int supNo, Model model) {
		return null;
	}
	//모집중에서 진행중으로 이동
	public String updateCategory(@RequestParam("supNo")int supNo, Model model){
	 return null;
	}
	//서포팅 참여
	public String addParticipation(@ModelAttribute SupParticipation sp, @RequestParam("supNo") int supNo, @RequestParam("userNo") int userNo) {
		
		return null;
	}
	//서폿 참여여부확인
	public String checkParticipation(@RequestParam("supNo") int supNo, @RequestParam("partiwon") int partiwon, Model model) {
		return null;
	}
	//서폿 참여취소
	public String cancelParticipation(@RequestParam("supNo") int supNo, @RequestParam("partiwon") int partiwon, Model model) {
		return null;
	}
	//서폿참여인원 +1 
	 //updatePartiwon(int, int, Model) : String

	public String updateCode(@RequestParam("supNo") int supNo, Model model){
		return null;
	}

	public String checkPartiwon(@RequestParam("supNo") int supNo, Model model) {
		return null;
	}
}
