package com.pick.my.idol.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.pick.my.idol.service.IdolService;

@Controller
public class IdolController {
	
	@Autowired
	private IdolService service;
	
}
