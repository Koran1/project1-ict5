package com.ict.mytravellist.MAIN.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.mytravellist.PLAN.service.TravelService;
import com.ict.mytravellist.PLAN.vo.TravelDBVO;

@RestController
public class MainAjaxController {

	@Autowired
	private TravelService travelService;
	
	@RequestMapping(value="/renew_main", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reNewMainPage(String region) {
		TravelDBVO tvo = travelService.selectOneReg(region);
		if(tvo != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(tvo);
			return jsonString;
		}
		return "fail";
	}
}
