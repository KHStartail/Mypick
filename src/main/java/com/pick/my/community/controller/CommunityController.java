package com.pick.my.community.controller;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

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

import com.pick.my.community.domain.Community_File;
import com.pick.my.community.domain.Community_Post;
import com.pick.my.community.domain.PageInfo;
import com.pick.my.community.domain.Pagination;
import com.pick.my.community.service.CommunityService;


@Controller
public class CommunityController {
	@Autowired
	public CommunityService service;
	
	@ResponseBody
	@RequestMapping(value = "upload.pick", method = RequestMethod.POST)
	public String fileUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request,Community_File File) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = request.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		try {
			// 파일이 있으면.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "\\upload\\";
					System.out.println(fileRoot);
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
						int result = service.insertFile(File);
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
	@RequestMapping(value="mainView.pick")
	public ModelAndView mainView(ModelAndView mv, @RequestParam(value="page", required=false) Integer page) {
	      int currentPage = (page != null) ? page : 1;
	      int totalCount = service.getListcount();
	      PageInfo pi = Pagination.getPageInfo(currentPage, totalCount);
	      List<Community_Post> cList = service.printAllPost(pi);
	      if(!cList.isEmpty()) {
	    	  mv.addObject("cList",cList);
	    	  mv.addObject("pi",pi);
	    	  mv.setViewName("community/main");
	      }else {
		         mv.addObject("msg", "게시글 전체조회 실패");
		         mv.setViewName("common/errorPage");
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
	public String writeView() {
		return"community/Write";
	}
	@RequestMapping(value="detailView.pick")
	public ModelAndView detailView(ModelAndView mv, @RequestParam("postNo") int postNo) {
		Community_Post communityPost = service.printOnePost(postNo);
		List<Community_File> file = service.printOnePostFile(postNo);
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
	public ModelAndView boardUpdate(@RequestParam("postNo")int postNo,ModelAndView mv,HttpServletRequest request,@ModelAttribute Community_Post communityPost,@RequestParam("title")String postTitle,@RequestParam("contents") String postContents) {
		communityPost.setPostTitle(postTitle);
		communityPost.setPostContents(postContents);
		communityPost.setPostNo(postNo);
		int result = service.modifyPost(communityPost);
		if(result > 0) {
			mv.setViewName("redirect:mainView.pick");
		}else {
			mv.addObject("msg","게시글 수정 실패").setViewName("common/errorPage");
		}
		return mv;
}
	@ResponseBody
	@RequestMapping(value = "update.pick", method = RequestMethod.POST)
	public String fileUpdate(@RequestParam("postNo") int postNo,@RequestParam("article_file") List<MultipartFile> multipartFile, HttpServletRequest request,Community_File File) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = request.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		
		try {
			// 파일이 있으면.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "\\upload\\";
					System.out.println(fileRoot);
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
						int result = service.insertFile(File);
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
	
	
	
	@RequestMapping(value="CommunityDelete.pick",method = RequestMethod.GET)
	public String CommunityDelete(Model model,@RequestParam("postNo")int postNo,@RequestParam(value="fileName", required=false) List<String> fileRenames,HttpServletRequest request) {
		int result = service.removePost(postNo);
		if(result > 0) {
			if(fileRenames != null) {
				int result2 = service.removeFile(postNo);
				deleteFile(fileRenames,request);
				if(result2 >0) {
					System.out.println("DB파일삭제성공");
					return "redirect:mainView.pick";
				}else {
					System.out.println("DB파일삭제실패");
					return "redirect:mainView.pick";
				}
			}else {
				
				return "redirect:mainView.pick";
			}
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
	public String postRegister (Model model,HttpServletRequest request,Community_Post post) {
		String postContents = request.getParameter("contents");
		String postTitle = request.getParameter("title");
		post.setPostContents(postContents);
		post.setPostTitle(postTitle);
		int result = service.registerCoummunityPost(post);
		if(result>0) {
			System.out.println("성공");
			return "redirect:mainView.pick";
		}else {
			System.out.println("실패");
			return "redirect:mainView.pick";
		}
	}
	@ResponseBody
	@RequestMapping(value = "deleteImg.pick", method = RequestMethod.POST)
	public String modifyImg(@RequestParam("fileNames") String fileName, HttpServletRequest request) {
		int result = service.modifyFile(fileName);
		if(result > 0) {
			modifyFile(fileName,request);		
		}
		System.out.println(String.valueOf(result));
		return String.valueOf(result);
	}
	
	
	public void modifyFile(String fileNames,HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");		
		String fullPath = root+"\\upload"; 					
			File file = new File(fullPath + "\\"+fileNames);				
			if(file.exists()) {
				file.delete(); 
			}
	}
	
	@ResponseBody
	@RequestMapping(value = "reUpload.pick", method = RequestMethod.POST)
	public String fileReUpload(
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request,Community_File File,@RequestParam int postNo) {
		
		String strResult = "{ \"result\":\"FAIL\" }";
		String contextRoot = request.getSession().getServletContext().getRealPath("resources");
		String fileRoot;
		try {
			// 파일이 있으면.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					fileRoot = contextRoot + "\\upload\\";
					System.out.println(fileRoot);
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
						int result = service.insertFile(File);
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
	
	
	}
	

