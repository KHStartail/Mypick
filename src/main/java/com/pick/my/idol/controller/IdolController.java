package com.pick.my.idol.controller;

import java.io.File;
import java.io.IOException;
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

import com.pick.my.idol.domain.Idol;
import com.pick.my.idol.domain.IdolSearch;
import com.pick.my.idol.service.IdolService;

@Controller
public class IdolController {
	
	@Autowired
	private IdolService service;
	
	@RequestMapping(value="idolRegister.pick", method=RequestMethod.POST)
	public String registerIdol (
			@ModelAttribute Idol idol
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request
			, Model model){
		if(!uploadFile.getOriginalFilename().equals("")) {
			String filePath = saveFile(uploadFile, request);
			if(filePath != null) {
				idol.setFilePath(uploadFile.getOriginalFilename());
			}
		}
		int result = service.registerIdol(idol);
		if(result>0) {
			return "redirect:index.jsp";
		}else {
			return "redirect:index.jsp";
		}
	}

	private String saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession()
				.getServletContext().getRealPath("resources");
		String savePath = root + "\\idolloadFiles";
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
	
	
	
	@RequestMapping(value="idolDelete.pick", method=RequestMethod.GET)
	public String idolDelete(
			@RequestParam("idolNo") int iNo
			, Model model
			, HttpServletRequest request) {
		Idol idol = service.printOndIdol(iNo);
		int result = service.removeIdol(iNo);
		if(result > 0) {
			if(idol.getFilePath() != null) {
				deleteFile(idol.getFilePath(), request);
			}
			return "redirect:index.jsp";
		}else {
			return "redirect:index.jsp";
		}
	}

	private void deleteFile(String filePath, HttpServletRequest request) {
		String root = request.getSession()
				.getServletContext().getRealPath("resources");
		String deletePath = root + "\\idolloadFiles";
		File deleteFile = new File(deletePath + "\\" + filePath);
		if(deleteFile.exists()) {
			deleteFile.delete();
		}
	}
	
	@RequestMapping(value="idolJoinView.pick", method=RequestMethod.GET)
	public String idolJoinView() {
		return "idol/idolJoin";
	}
	
	
	@RequestMapping(value="idoldetail.pick", method=RequestMethod.GET)
	public String printOneIdol(
			@RequestParam("idolNo") int iNo
			,Model model) {
		try {
			Idol idol = service.printOndIdol(iNo);
			if(idol != null) {
				model.addAttribute("idol", idol);
				return "idol/idolDetailView";
			}else {
				return "redirect:index.jsp";
			}
		}catch(Exception e) {
			System.out.println(e);
			return "redirect:index.jsp";
		}
	}
	
	
	@RequestMapping(value = "idolSearch.pick", method=RequestMethod.GET)
	public String idolSearchList(
			@ModelAttribute IdolSearch search
			, Model model) {
		List<Idol> searchList = service.printSearchAll(search);
		if(!searchList.isEmpty()) {
			model.addAttribute("iList", searchList);
			model.addAttribute("search", search);
			return "idol/idolListView";
		}else {
			return "idol/idolListView";
		}
	}
	
	@RequestMapping(value = "idolModify.pick", method=RequestMethod.GET)
	public String idolModify(
			@RequestParam("idolNo") int iNo
			,Model model) {
		Idol idol = service.printOndIdol(iNo);
		model.addAttribute("idol", idol);
		return "idol/idolUpdateView";
	}
	
	@RequestMapping(value = "idolUpdate.pick", method=RequestMethod.POST)
	public String idolUpdate(@ModelAttribute Idol idol
			, Model model
			, HttpServletRequest request
			, @RequestParam("reloadFile") MultipartFile reloadFile) {
		if(reloadFile != null && !reloadFile.isEmpty()) {
			if(idol.getFilePath() != null) {
				deleteFile(idol.getFilePath(), request);
			}
			String savePath = saveFile(reloadFile, request);
			if(savePath != null) {
				idol.setFilePath(reloadFile.getOriginalFilename());
			}
		}
		int result = service.modifyIdol(idol);
		System.out.println(idol.toString());
		if(result > 0) {
			return "redirect:idoldetail.pick?idolNo="+idol.getIdolNo();
		}else {
			System.out.println(idol.toString());
			return "redirect:index.jsp";
		}
	}
	
}
