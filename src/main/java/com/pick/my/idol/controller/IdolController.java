package com.pick.my.idol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pick.my.idol.service.IdolService;

@Controller
public class IdolController {
	
	@Autowired
	private IdolService service;
	
	@RequestMapping(value="idolRegister.pi", method=RequestMethod.POST)
	public String registerIdol (){
		
		return "";
	}
	
}
