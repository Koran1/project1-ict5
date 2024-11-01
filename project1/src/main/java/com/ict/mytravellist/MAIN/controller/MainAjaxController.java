package com.ict.mytravellist.MAIN.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.mytravellist.MAIN.service.MainService;
import com.ict.mytravellist.vo.TravelDBVO;

@RestController
public class MainAjaxController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reNewMainPage() {
	    List<TravelDBVO> list = mainService.getRandomList();  // 랜덤 이미지 조회
		if(list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			System.out.println(jsonString.length());
			return jsonString;
		}
		return "fail";
	}
}


