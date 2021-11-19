package com.pick.my.supporting.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.pick.my.common.PageInfo;
import com.pick.my.common.Pagination;
import com.pick.my.common.PaymentHistory;
import com.pick.my.member.domain.Member;
import com.pick.my.supporting.domain.SupFile;
import com.pick.my.supporting.domain.SupParticipation;
import com.pick.my.supporting.domain.SupReply;
import com.pick.my.supporting.domain.SupReplyReport;
import com.pick.my.supporting.domain.Supporting;
import com.pick.my.supporting.service.SupportingService;

@Controller
public class SupportingController {
	@Autowired
	private SupportingService service;
	
	//모집중 서포팅 게시글 전체 조회
	@RequestMapping(value="presupportingList.pick", method=RequestMethod.GET)
	public ModelAndView preSupportingListView(ModelAndView mv
			, @RequestParam(value="page", required=false) Integer page) {
		int currentPage = (page != null) ? page : 1;
		int totalCount = service.getPreSupListCount();
		PageInfo pi =  Pagination.getPageInfo(currentPage, totalCount); 
		List<Supporting> pList = service.printAllPreSupporting(pi); 
		 if(!pList.isEmpty()) { 
			 mv.addObject("pList", pList); 
			 mv.addObject("pi", pi);
			 mv.setViewName("supporting/preSupportingList");
		 }else {
			 mv.addObject("msg", "모집중 서포팅 게시글 전체조회 실패"); 
			 mv.setViewName("supporting/supportError"); 
		 }
		 return mv;
	}
	
	//진행중 서포팅 게시글 전체 조회
	@RequestMapping(value="supportingList.pick", method=RequestMethod.GET)
	public ModelAndView supportingListView(
			ModelAndView mv
			, HttpSession session
			, @RequestParam(value="page", required=false) Integer page) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int currentPage = (page != null)? page : 1;
		int totalCount = service.getPreSupListCount();
		PageInfo pi =  Pagination.getPageInfo(currentPage, totalCount); 
		List<Supporting> sList = service.printAllSupporting(pi);
		if(!sList.isEmpty()) {
			mv.addObject("userId", loginUser);
			mv.addObject("sList", sList);
			mv.setViewName("supporting/supportingList");
		}else{
			mv.addObject("msg", "진행중 서포팅 게시글 전체조회 실패");
			mv.setViewName("supporting/supportError");
		}
		return mv;
	}

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
		List<SupFile> fileList = service.printFileList(supNo);
		if(supporting!=null) {
			Member userOne = service.printOneUser(supporting.getUserNo());
				mv.addObject("userNickName", userOne.getUserNickName());
				mv.addObject("supporting", supporting);
				mv.addObject("fList",fileList);
				mv.setViewName("supporting/preSupportingDetailView");
		}else{
			mv.addObject("msg", "서포팅 상세조회 실패");
			mv.setViewName("supporting/supportError");
		}
		return mv;
	}
	//진행중 상세조회
	@RequestMapping(value="supportingDetail.pick", method=RequestMethod.GET)
	public  ModelAndView supportingDetail(HttpServletResponse response, HttpSession session, @RequestParam("supNo") int supNo,  ModelAndView mv) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Supporting supporting = service.supportingOne(supNo);
		List<SupFile> fileList = service.printFileList(supNo);
		String userId = loginUser.getUserId();
		String userNickName = loginUser.getUserNickName(); 
		//Member userOne = service.printOneUser(supporting.getUserNo());
		if(supporting!=null) {
				mv.addObject("userId", userId); 
				mv.addObject("supporting", supporting);
				mv.addObject("userNickName", userNickName);
				mv.addObject("fList", fileList);
				mv.setViewName("supporting/supportingDetailView");
		}else{
				mv.addObject("msg", "서포팅 상세조회 실패");
				mv.setViewName("supporting/supportError");
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
			, Model model, HttpSession session,HttpServletRequest request) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//포맷시 date import: java.utill.Date
		supporting.setScheduleDate(scheduleDate);
		supporting.setSupStartDate(Date.valueOf(supStartDate));
		supporting.setSupEndDate(Date.valueOf(supEndDate));
		supporting.setUserNo(loginUser.getUserNo());
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
			, @RequestParam("imgReName") String fileRename
			, @RequestParam("fileReName") String filesRename
			, @RequestParam(value= "reloadFile", required=false) MultipartFile reloadFile
			, @ModelAttribute Supporting supporting
			, @ModelAttribute SupFile supFile
			, MultipartHttpServletRequest multiRequest
			, Model model) {
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//포맷시 date import: java.utill.Date
		supporting.setScheduleDate(scheduleDate);
		supporting.setSupStartDate(Date.valueOf(supStartDate));
		supporting.setSupEndDate(Date.valueOf(supEndDate));
		//기존파일삭제
		if(reloadFile!=null && !reloadFile.isEmpty()) {
			if(supporting.getImgPath()!=null) {
				/*
				 * deleteFile(supporting.getSupNo(),supporting.getImgReName(),multiRequest);
				 *deleteFileList(supFile.getSupNo(),supFile.getFileReName(), multiRequest);
				 */	
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
				//	System.out.println(folder);
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
			, Model model, HttpServletRequest request) {
		List<SupFile> subFileList = service.printFileList(supNo);
		Supporting supporting = service.preSupportingOne(supNo);
		int result = service.removeSupporting(supNo);
		if(result >  0) {
			for(SupFile supFile : subFileList) {
				deleteFileList(supFile.getFileName(), supFile.getSupNo(), request);
			}
			deleteFile(supporting.getSupNo(), supporting.getImgName(), request);
			return "redirect:presupportingList.pick";
		}else {
			model.addAttribute("msg", "서포팅 삭제 실패!");
			return "supporting/supportError";
		}
	}
	
	//대표이미지파일삭제
	public void deleteFile(int supNo, String imgName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root + "\\supportingFiles";
		File file = new File(fullPath + "\\" + imgName);
		if(file.exists()) {
			file.delete();
		}
	}
	
	//다중파일 삭제
	public void deleteFileList(String fileNames, int supNo, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\supportingFiles";
		File file = new File(filePath + "\\" +fileNames);
		int result = service.deleteFile(supNo);
		if(file.exists()) {
			file.delete();
		}
	}
	//서포팅  댓글
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="addSupReply.pick", method=RequestMethod.POST) public
	 * String addSupReply(HttpSession session){
	 * 
	 * Member loginUser = (Member)session.getAttribute("loginUser"); String
	 * userNickName = loginUser.getUserNickName(); SupReply supReply = new
	 * SupReply(); supReply.setSupReWriter(userNickName); int result =
	 * service.registerSupReply(supReply); if(result> 0) { return "success"; }else {
	 * return "fail"; } }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="supReplyList.pick", method=RequestMethod.GET) public
	 * String addSupReplyChild(HttpSession session, @ModelAttribute SupReply
	 * supReply) { Member loginUser = (Member)session.getAttribute("loginUser");
	 * String userNickName = loginUser.getUserNickName();
	 * supReply.setSupReWriter(userNickName); int result =
	 * service.registerSupReplyChild(supReply); if(result > 0 ) { return "success";
	 * }else{ return "fail"; } }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="modifySupReply.pick", method=RequestMethod.POST)
	 * public String modifySupReply(@ModelAttribute SupReply supReply, HttpSession
	 * session) { int result = service.modifyrSupReply(supReply); if(result>0) {
	 * return "success"; }else{ return "fail"; } } public String
	 * modifySupReplyChild(@ModelAttribute SupReply supReply) { int result =
	 * service.removeSupReplyChild(supReply); if(result>0) { return "success"; }else
	 * { return "fail"; } }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="deleteSupReply.pick", method=RequestMethod.GET) public
	 * String deleteSupReply(@ModelAttribute SupReply supReply) { int result =
	 * service.removeSupReply(supReply); if(result > 0) { return "success"; }else {
	 * return "fail"; } }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="deleteSupReply.pick", method=RequestMethod.GET) public
	 * String deleteSupReplyChild(@ModelAttribute SupReply supReply) { int result =
	 * service.removeSupReplyChild(supReply); if(result>0) { return "success"; }else
	 * { return "fail"; } }
	 */
	//신고하기
	@ResponseBody
	@RequestMapping(value="reportSupReply.pick", method=RequestMethod.GET)
	public String reportSupReply(@ModelAttribute SupReplyReport report, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		int userNo = loginUser.getUserNo();
		report.setUserNo(userNo);
		
		int result = service.reportSupReply(report);
		if(result>0) {
			return "success";
		}else {
			return "fail";
		}
	}
	//결제페이지 이동
	@RequestMapping(value="movePayPage.pick", method=RequestMethod.POST)
	public ModelAndView movePayPage(HttpSession session
			, @RequestParam("userNickName") String userNickName
			, @RequestParam("supNo") int supNo
			, @RequestParam("supTitle") String supTitle
			, @RequestParam(value="money-check", required=false, defaultValue="0") int money
			, @RequestParam(value="money-check-etc") int plusMoney
			, ModelAndView mv) {
		Supporting supporting = service.supportingOne(supNo);
		Member loginUser = (Member)session.getAttribute("loginUser");
		String nickName = loginUser.getUserNickName();

		mv.addObject("supporting", supporting);
		mv.addObject("userNickName", userNickName);
		mv.addObject("nickName", nickName);
		mv.addObject("money",money);
		mv.addObject("plusMoney",plusMoney);
		mv.setViewName("supporting/paypage");
		return mv;
	}
	//서포팅 결제(DB저장)*이동만 확인
	@ResponseBody
	@RequestMapping(value="getPayment.pick", method=RequestMethod.POST)
	public ModelAndView getPayment(HttpSession session
			, @ModelAttribute PaymentHistory ph
			, @RequestParam("supNo") int supNo
			, @RequestParam("supTitle") String supTitle
			, @RequestParam("money") int supAmount
			, @RequestParam("userNickName") String userNickName
			, @RequestParam("userName") String userName
			, @RequestParam("userPhone") String userPhone
			, @RequestParam("userEmail") String userEmail
			, HttpServletResponse response
			, ModelAndView mv) {
		try {
			PrintWriter out = response.getWriter();
			ph.setSupNo(supNo);
			ph.setSupTitle(supTitle);
			ph.setSupAmount(supAmount);
			ph.setUserNickName(userNickName);
			ph.setUserName(userName);
			ph.setUserPhone(userPhone);
			ph.setUserEmail(userEmail);
			int result = service.addPaymentHistory(ph);
			if(result > 0) {
				out.println("<script>alert('결제내역은 마이페이지에서 확인바랍니다.');</script>");
				mv.setViewName("supporting/supportingList");
			}else {
				out.println("<script>alert('결제오류 : 관리자에게 알려주세요.');</script>");
				mv.setViewName("supporting/supportingList");
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mv;
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
