package com.ict.mytravellist.MAIN.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	
	@GetMapping("/main_page")
	public ModelAndView goMainPage() {
		ModelAndView mv = new ModelAndView("MAIN/main_page");
		mv.addObject("region1", 14);
		return mv;
	}

}
