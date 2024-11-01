package com.ict.mytravellist.WTHR.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.mytravellist.WTHR.service.WeatherService;
import com.ict.mytravellist.WTHR.vo.ResultMapVO;
import com.ict.mytravellist.vo.WeatherVO;

@RestController
public class WeatherAjaxController {
	
	@Autowired
	private WeatherService weatherService;
	
	@RequestMapping(value="/getwthrinfo", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAjaxList2(String region) {
		List<WeatherVO> list = weatherService.getWthrInfo(region);
		if(list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			return jsonString;
		}
		return "fail";
	}
	
	
	
}
