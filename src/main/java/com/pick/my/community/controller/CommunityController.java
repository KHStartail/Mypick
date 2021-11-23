package com.pick.my.community.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
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

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Main;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.Community_Post_Report;
import com.pick.my.community.domain.Community_Reply;
import com.pick.my.community.domain.Community_Report_Reply;
import com.pick.my.community.domain.Heart;
import com.pick.my.community.domain.PageInfo;
import com.pick.my.community.domain.Pagination;
import com.pick.my.community.service.CommunityService;
import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.service.IdolService;
import com.pick.my.member.domain.Member;


@Controller
public class CommunityController {
	@Autowired
	private CommunityService service;
	@Autowired
	private IdolService idolService;
	
	@ResponseBody
	@RequestMapping(value = "upload.pick", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request,Community_File File,Community_Post post,HttpSession session,@RequestParam("gorupName")String gorupName) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String postContents = request.getParameter("contents");
		String postTitle = request.getParameter("postTitle");
		post.setPostContents(postContents);
		post.setPostTitle(postTitle);
		post.setUserId(loginUser.getUserId());
		post.setUserNickName(loginUser.getUserNickName());
		post.setGroupName(gorupName);
		int result = service.registerCoummunityPost(post);
		Community_Post postNo = service.printCommunityPostNo(post);
		String strResult = "{ \"result\":\"FAIL\" }";
		if(result > 0) {
		String contextRoot = request.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		try {
			// 파일이 있으면.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "\\upload\\";
					File folder = new File(fileRoot);
					if (!folder.exists()) {
						folder.mkdir(); // 폴더 생성
					}
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						File.setUserId(loginUser.getUserId());
						File.setFileName(file.getOriginalFilename());
						File.setFileRename(savedFileName);
						File.setFileSize(file.getSize());
						File.setPostNo(postNo.getPostNo());
						int result2 = service.insertFile(File);
						if(result2 > 0) {
						}else {
						}
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일이 없으면.
			else
				strResult = "{ \"result\":\"OK\" }";
		}catch(Exception e){
			e.printStackTrace();
		}
		}
		return strResult;
	}
	@RequestMapping(value="mainView.pick")
	public ModelAndView mainView(ModelAndView mv
			, @RequestParam(value="page", required=false) Integer page
			,@RequestParam("groupName")String groupName
			, HttpServletRequest request) throws Exception {
			HttpSession session = request.getSession();
			Member loginUser = (Member)session.getAttribute("loginUser");
			Community_Main setMain = new Community_Main();
			setMain.setGroupName(groupName);
			Community_Main main = service.printMainImg(setMain);
	      int currentPage = (page != null) ? page : 1;
	      int totalCount = service.getListcount(setMain.getGroupName());
	      PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
 	      pi.setGroupName(groupName);
	      if(main != null) {
	    	  List<Community_Post> cList = service.printAllPost(pi);
		      if(!cList.isEmpty()) {
				  Idol idol = idolService.printIdolImg(groupName);
				  if(idol != null) {
					mv.addObject("idol",idol);  
				  }
		    	  mv.addObject("mainImgName",main);
		    	  mv.addObject("groupName",groupName);
		    	  mv.addObject("loginUser",loginUser);
		    	  mv.addObject("cList",cList);
		    	  mv.addObject("pi",pi);
		    	  mv.setViewName("community/main");
		      }else {
			         mv.addObject("msg", "게시글 전체조회 실패");
			         mv.setViewName("common/errorPage");
		      }
	      }
	     
		return mv;
	}
	@RequestMapping(value="postSearch.pick")
	public String postSearchList(@RequestParam("searchKeyword")String searchKeyword,Model model,@RequestParam(value="page", required=false) Integer page){
		 int currentPage = (page != null) ? page : 1;
	      int totalCount = service.getSearchListcount(searchKeyword);
	      PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
	      pi.setSearchKeyword(searchKeyword);
		List<Community_Post> searchList = service.printSearchAll(pi);
		if(!searchList.isEmpty()) {
			model.addAttribute("cList",searchList);
			model.addAttribute("pi",pi);
			return "community/main";
		}else {
			model.addAttribute("msg","게시글 검색 실패");
			return "community/main";
		}
	}
	
	@RequestMapping(value="WriteView.pick")
	public String writeView(@RequestParam("groupName")String groupName,Model model) {
		model.addAttribute("gorupName",groupName);
		return"community/Write";
	}
	@RequestMapping(value="detailView.pick")
	public ModelAndView detailView(HttpServletResponse response,HttpServletRequest request,ModelAndView mv, @RequestParam("postNo") int postNo, HttpSession session) {
		Community_Post communityPost = service.printOnePost(postNo);
		List<Community_File> file = service.printOnePostFile(postNo);
		Member loginUser = (Member)session.getAttribute("loginUser");
        // 해당 게시판 번호를 받아 리뷰 상세페이지로 넘겨줌
		 Cookie[] cookies = request.getCookies();
	       
	        // 비교하기 위해 새로운 쿠키
	        Cookie viewCookie = null;
	 
	        // 쿠키가 있을 경우 
	        if (cookies != null && cookies.length > 0) 
	        {
	            for (int i = 0; i < cookies.length; i++)
	            {
	                // Cookie의 name이 cookie + postNo와 일치하는 쿠키를 viewCookie에 넣어줌 
	                if (cookies[i].getName().equals("cookie"+postNo))
	                { 
	                    viewCookie = cookies[i];
	                }
	            }
	        }
	        if (viewCookie == null) {    
	            // 쿠키 생성(이름, 값)
	            Cookie newCookie = new Cookie("cookie"+postNo, "|" + postNo + "|");
	            //쿠키 지속시간 (-1 브라우저종료,세션이 만료시 쿠키만료)
	            newCookie.setMaxAge(-1);
	            // 쿠키 추가
	            response.addCookie(newCookie);
	            // 쿠키를 추가 시키고 조회수 증가시킴
	            int result = service.addReadCount(postNo);
	        }else {
	                // 쿠키 값 받아옴.
	                String value = viewCookie.getValue();
	            }
        Heart heart = new Heart();
        heart.setPostNo(postNo);

        
        if(loginUser != null) {
            heart.setUserId(loginUser.getUserId());
            int result = service.printHeart(heart);
            mv.addObject("heart",result);
        }else {
        	mv.addObject("heart",0);
        }
		if(!file.isEmpty()) {
			if(communityPost != null) {
				mv.addObject("post",communityPost);
				mv.addObject("file",file);
				
				mv.setViewName("community/detail");
			}else {
				mv.addObject("msg","게시글 상세조회 실패");
				mv.setViewName("common/errorPage");
			}
		}else {
			if(communityPost != null) {
				mv.addObject("post",communityPost);
				mv.setViewName("community/detail");
		}else {
			mv.addObject("msg","게시글 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		}
        return mv;
	}
	@RequestMapping(value="modifyView.pick")
	public ModelAndView modifyView(ModelAndView mv,@RequestParam("postNo") int postNo) {
		Community_Post communityPost = service.printOnePost(postNo);
		List<Community_File> file = service.printOnePostFile(postNo);
		if(!file.isEmpty()) {
			if(communityPost != null) {
				mv.addObject("post",communityPost);
				mv.addObject("files",file);
				mv.setViewName("community/modify");
			}else {
				mv.addObject("msg","게시글 상세조회 실패");
				mv.setViewName("common/errorPage");
			}
		}else {
			if(communityPost != null) {
				mv.addObject("post",communityPost);
				mv.setViewName("community/modify");
		}else {
			mv.addObject("msg","게시글 상세조회 실패");
			mv.setViewName("common/errorPage");
		}
		}
		return mv;
	}
	@RequestMapping(value="update.pick",method=RequestMethod.GET)
	public ModelAndView boardUpdate(@RequestParam("postNo")int postNo,ModelAndView mv,HttpServletRequest request,@ModelAttribute Community_Post communityPost,@RequestParam("title")String postTitle,@RequestParam("contents") String postContents,@RequestParam("groupName")String groupName) throws UnsupportedEncodingException {
		communityPost.setPostTitle(postTitle);
		communityPost.setPostContents(postContents);
		communityPost.setPostNo(postNo);
		int result = service.modifyPost(communityPost);
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		if(result > 0) {
			mv.setViewName("redirect:mainView.pick?groupName="+encodedParam);
		}else {
			mv.addObject("msg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
}
	
	@RequestMapping(value="communityDelete.pick",method = RequestMethod.GET)
	public String CommunityDelete(
			Model model
			,@RequestParam("postNo")int postNo
			,@RequestParam("groupName")String groupName
			,@RequestParam(value="fileName", required=false) List<String> fileRenames
			,HttpServletRequest request) throws UnsupportedEncodingException {
		Community_Post post = service.printOnePost(postNo);
		String encodedParam = URLEncoder.encode(groupName, "UTF-8");
		int result = service.removePost(postNo);
		if(result > 0) {
			if(fileRenames != null) {
				int result2 = service.removeFile(postNo);
				deleteFile(fileRenames,request);
			}
			return "redirect:mainView.pick?groupName="+encodedParam; 
		}else {
			model.addAttribute("msg","게시글 삭제 실패");
			return "common/errorPage";
		}
	}
	public void deleteFile(List<String> fileNames,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");		
		String fullPath = root+"\\upload"; 					
		for(int i =0; i<fileNames.size(); i++) {
			File file = new File(fullPath + "\\"+fileNames.get(i));				
			if(file.exists()) {
				file.delete(); 
			}
		}
	}
	
	@RequestMapping(value = "Register.pick", method = RequestMethod.GET)
	public String postRegister (Model model,HttpServletRequest request,Community_Post post,HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		String postContents = request.getParameter("contents");
		String postTitle = request.getParameter("title");
		post.setPostContents(postContents);
		post.setPostTitle(postTitle);
		post.setUserId(loginUser.getUserId());
		post.setUserNickName(loginUser.getUserNickName());
		int result = service.registerCoummunityPost(post);
		
		if(result>0) {
			return "redirect:mainView.pick";
		}else {
			return "redirect:mainView.pick";
		}
	}
	@ResponseBody
	@RequestMapping(value = "deleteImg.pick", method = RequestMethod.POST)
	public String modifyImg(HttpServletRequest request,@RequestParam(value="deleteFiles")List<String> fileNames) {
		int result = 0;
		try {
			if(!fileNames.isEmpty()) {
				result = service.modifyFile(fileNames);
				if(result > 0) {
					modifyFile(fileNames,request);		
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return String.valueOf(result);
	}
	
	
	public void modifyFile(List<String> fileNames,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String fullPath = root+"\\upload";
			for(int i =0; i<fileNames.size();i++) {
				File file = new File(fullPath + "\\"+fileNames);				
				if(file.exists()) {
					file.delete(); 
				}
			}
			}
	
	@ResponseBody
	@RequestMapping(value = "reUpload.pick", method = RequestMethod.POST)
	public String fileReUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request,Community_File File,@RequestParam int postNo,HttpSession session) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = request.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		try {
			// 파일이 있으면.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "\\upload\\";
					File folder = new File(fileRoot);
					if (!folder.exists()) {
						folder.mkdir(); // 폴더 생성
					}
					String originalFileName = file.getOriginalFilename();	//오리지날 파일명
					String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
					String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
					
					File targetFile = new File(fileRoot + savedFileName);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						File.setFileName(file.getOriginalFilename());
						File.setFileRename(savedFileName);
						File.setFileSize(file.getSize());
						File.setPostNo(postNo);
						Member loginUser = (Member)session.getAttribute("loginUser");
						File.setUserId(loginUser.getUserId());
						int result = service.ReinsertFile(File);
						if(result > 0) {
							strResult = "{ \"result\":\"OK\" }";
						}else {
							strResult = "{ \"result\":\"FAIL\" }";
						}
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);	//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
//				strResult = "{ \"result\":\"OK\" }";
			}
			// 파일이 없으면.
//			else
//				strResult = "{ \"result\":\"OK\" }";
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return strResult;
	}
	@ResponseBody 
	@RequestMapping(value="addReply.pick",method=RequestMethod.POST)
	public String addReply(@ModelAttribute Community_Reply reply, HttpSession session) {
		 Member loginUser = (Member)session.getAttribute("loginUser");
		reply.setUserId(loginUser.getUserId());
		reply.setUserNickName(loginUser.getUserNickName());
		int result = service.registerReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	
	@RequestMapping(value="replyList.pick",method=RequestMethod.GET)
	public void getReplyList(@RequestParam("postNo") int postNo,HttpServletResponse response) throws JsonIOException, IOException {
		List<Community_Reply> rList = service.printAllReply(postNo);
		// JSONObject, JSONArray
		if(!rList.isEmpty()) {
			Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
			gson.toJson(rList,response.getWriter());     		//gson.toJson = gson에서 jSon형태로 만들 객체들
		}else {
		}
	}
	@ResponseBody
	@RequestMapping(value="deleteReply.pick",method=RequestMethod.GET)
	public String deleteReply(@ModelAttribute Community_Reply reply) {
		int result =service.removeReply(reply);
		if(result > 0) {
			return "success";
		}else {
			
			return "fail";			
		}
	}
	@ResponseBody
	@RequestMapping(value="modifyReply.pick",method=RequestMethod.POST)
	public String modifyReply(@ModelAttribute Community_Reply reply) {
		int result = service.modifyReply(reply);
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
	}
	@RequestMapping(value="summerImg.pick",method = RequestMethod.POST)
	public void profileUpload(String email, MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("upload");
		UUID uuid = UUID.randomUUID();
		email = "reply";
		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;


		String filepath = realFolder + "\\" + email + "\\" + str_filename;
		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);

		out.println("upload/"+email+"/"+str_filename);
		out.close();
	}
	

		@ResponseBody
	    @RequestMapping(value = "heart.pick", method = RequestMethod.POST, produces = "application/json")
	    public int heart(HttpServletRequest httpRequest,HttpSession session) throws Exception {
	        int heart = Integer.parseInt(httpRequest.getParameter("heart"));
	        int postNo = Integer.parseInt(httpRequest.getParameter("postNo"));
	        Heart Heart = new Heart();
			 Member loginUser = (Member)session.getAttribute("loginUser");
	        Heart.setPostNo(postNo);
	        Heart.setUserId(loginUser.getUserId());
	        if(heart >= 1) {
	            service.removeHeart(Heart);
	            service.removeHeartCount(postNo);
	            heart=0;
	        } else {
	            service.saveHeart(Heart);
	            service.insertHeartCount(postNo);
	            heart=1;
	        }
	        return heart;
	    }
		@ResponseBody
		@RequestMapping(value = "reportReply.pick")
		public String reportReply(HttpSession session,@RequestParam("postNo")int postNo,@RequestParam("replyContents")String replyContents,@RequestParam("replyAllNo")int replyAllNo,Community_Report_Reply report) {
			 Member loginUser = (Member)session.getAttribute("loginUser");
			 String answer = "success";
			report.setReplyContents(replyContents);
			report.setReplyAllNo(replyAllNo);
			report.setPostNo(postNo);
			report.setUserId(loginUser.getUserId());
			report.setUserNickName(loginUser.getUserNickName());
			Community_Report_Reply report2 = service.doubleReport(report);
			int result = 0;
			if(report2 != null) {
				 answer = "error";
			}else {
				result = service.registerReplyReport(report);
				 answer = "success";
			}
			if(result > 0 ) {
				return answer;
			}else {
				return answer;
			}
		}
		@ResponseBody
		@RequestMapping(value="reportPost.pick",method = RequestMethod.POST)
		public String reportPost(@RequestParam("postNo")int postNo,HttpSession session,Community_Post_Report reportPost,Community_Post post) {
			Member loginUser = (Member)session.getAttribute("loginUser");
			post = service.printOnePost(postNo);
			reportPost.setPostTitle(post.getPostTitle());
			reportPost.setPostNo(postNo);
			reportPost.setUserNickName(post.getUserNickName());
			reportPost.setWriterNickName(loginUser.getUserId());
			Community_Post_Report reportPost2 = service.checkReport(reportPost); 
			String answer = "success";
			int result = 0;
			if(reportPost2 == null) {
				result = service.registerPostReport(reportPost);
				answer = "success";
			}else {
				answer = "error";
			}
			if(result >0 ) {
				return answer;
			}else {
				return answer;
			}
		}
		@ResponseBody
	    @RequestMapping(value="mainImg.pick",method = RequestMethod.POST)
	    public String result(@RequestParam("mainImg") MultipartFile mainImgName,HttpServletRequest request,HttpServletResponse response, Model model
	    		,@ModelAttribute Community_Main main,@RequestParam("groupName")String groupName,@RequestParam("deleteImg")String deleteImg
	    		){
			if(mainImgName != null && !mainImgName.isEmpty()) {
				if(deleteImg != null) {
					deleteFile(deleteImg, request);
				}
				String savePath = saveFile(mainImgName, request);
				if(savePath != null) {
					main.setGroupName(groupName);
					main.setMainImgName(mainImgName.getOriginalFilename());
					int result = service.removeMainImg(main);
					
					if(result > 0) {
						int result2 = service.registerMainImg(main);
						if(result2 > 0 ) {
							return "filelist";
					}
					}
				}
			}
	      
	        return "redirect:form";
	    }
		private String saveFile(MultipartFile file, HttpServletRequest request) {
			String root = request.getSession()
					.getServletContext().getRealPath("resources");
			String savePath = root + "\\mainImgs";
			File folder = new File(savePath);
			if(!folder.exists()) {
				folder.mkdir();
			}
			String filePath = folder + "\\" + file.getOriginalFilename();
			try {
				file.transferTo(new File(filePath)); 
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return filePath;
		}

		private void deleteFile(String filePath, HttpServletRequest request) {
			String root = request.getSession()
					.getServletContext().getRealPath("resources");
			String deletePath = root + "\\mainImgs";
			File deleteFile = new File(deletePath + "\\" + filePath);
			Community_Main main = new Community_Main();
			main.setMainImgName(filePath);
			if(deleteFile.exists()) {
				deleteFile.delete();
			}
		}
		
	    @RequestMapping(value="postCommunity.pick", method = RequestMethod.GET)
	    public ModelAndView postCommunity(@RequestParam(value="page", required=false) Integer page,ModelAndView mv,HttpSession session,ArrayList<Community_Post> pList) {
	    	Member loginUser = (Member)session.getAttribute("loginUser");
	    	Community_Post post = new Community_Post();
	    	post.setUserId(loginUser.getUserId());
	    	  int currentPage = (page != null) ? page : 1;
		      int totalCount = service.myPageListcount(post.getUserId());
		      PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
		  	Map<String,Object>map = new HashMap<String,Object>();
		  	 map.put("userId", post.getUserId());
		  	 map.put("pi", pi);
		      pList = (ArrayList<Community_Post>) service.printMyPost(map);
	    	if(!pList.isEmpty()) {
		    	  mv.addObject("pList",pList);
		    	  mv.addObject("pi",pi);
		    	  mv.addObject("loginUser",loginUser);
		    	  mv.setViewName("myPage/postCommunity");
	    	}else {
	    		  mv.setViewName("myPage/postCommunity");
	    	}
	        return mv;
	    }
	    @RequestMapping(value="reportCommunity.pick", method = RequestMethod.GET)
	    public ModelAndView reportCommunity(@RequestParam(value="page", required=false) Integer page,ModelAndView mv,HttpSession session) {
	    	List<Community_Post_Report> rList = service.printReportPost();
	    	if(!rList.isEmpty()) {
	    		mv.addObject("rList",rList);
		    	mv.setViewName("adminPage/postCommunity");
	    	}else {
	    		  mv.setViewName("myPage/postCommunity");
	    	}
	        return mv;
	    }
	}
	

