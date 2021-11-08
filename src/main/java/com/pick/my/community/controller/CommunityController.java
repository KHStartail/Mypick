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
							System.out.println("파일DB저장성공");
						}else {
							System.out.println("실패");
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
		return strResult;
	}
	@RequestMapping(value="mainView.pick")
	public String mainView() {
		return"community/main";
	}
	@RequestMapping(value="WriteView.pick")
	public String writeView() {
		return"community/Write";
	}
	@RequestMapping(value="detailView.pick")
	public String detailView() {
		return"community/detail";
	}
	@RequestMapping(value="modifyView.pick")
	public String modifyView() {
		return"community/modify";
	}
	@RequestMapping(value = "Register.pick", method = RequestMethod.GET)
	public String postRegister (Model model,HttpServletRequest request,Community_Post post) {
		String postContents = request.getParameter("contents");
		String postTitle = request.getParameter("title");
		post.setPostContents(postContents);
		post.setPostTitle(postTitle);
		System.out.println("내용"+postContents+"제목"+postTitle);
		int result = service.registerCoummunityPost(post);
		if(result>0) {
			System.out.println("성공");
			return "redirect:index";
		}else {
			System.out.println("실패");
			return "Write";
		}
	}
	
	
}
