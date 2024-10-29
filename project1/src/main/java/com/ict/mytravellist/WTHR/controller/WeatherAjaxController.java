package com.ict.mytravellist.WTHR.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.mytravellist.WTHR.service.WeatherService;
import com.ict.mytravellist.WTHR.vo.PJWeatherVO;
import com.ict.mytravellist.WTHR.vo.ResultMapVO;

@RestController
public class WeatherAjaxController {
	
	@Autowired
	private WeatherService weatherService;
	
	@RequestMapping(value="/test01", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAjaxList2(String region) {
		List<PJWeatherVO> list = weatherService.getWthrInfo(region);
		// List<ResultMapVO> list = weatherService.getWthrInfo2(region);
		// List<ResultMapVO> list = weatherService.getWthrInfo3(region);
		if(list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			return jsonString;
		}
		return "fail";
	}
	
	
	
}
