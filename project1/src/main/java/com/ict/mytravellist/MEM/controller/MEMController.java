package com.ict.mytravellist.MEM.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MEMController {
	@RequestMapping("/mem_mypage")
	public ModelAndView goMEM_myPage() { 
		return new ModelAndView("MEM/myPage");
	}
}
