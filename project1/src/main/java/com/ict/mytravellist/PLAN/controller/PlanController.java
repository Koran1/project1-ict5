package com.ict.mytravellist.PLAN.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.PLAN.service.TravelService;
import com.ict.mytravellist.WTHR.service.WeatherService;
import com.ict.mytravellist.vo.TravelDBVO;

@Controller
public class PlanController {
	
	@Autowired
	private TravelService travelService;
	
	
	@RequestMapping("/index")
	public ModelAndView goIndex() { 
		return new ModelAndView("main_login");
	}
	@RequestMapping("/mytrvlplan")
	public ModelAndView goPLAN(HttpServletRequest request) { 
		ModelAndView mv = new ModelAndView("PLAN/mytrvlplan");
		
		// 유저 최애 travelIdx
		String travelIdx = "1,2,3,4,5,6,7,8,9,10,"
				+ "11,12,13,14,15,16,17,18,19,20";
		String[] travelIdxes = travelIdx.split(",");
		
		List<TravelDBVO> list = new ArrayList<TravelDBVO>();
		for (String k : travelIdxes) {
			TravelDBVO tbvo = travelService.selectOne(k);
			tbvo.setTravelIdx(k);
			list.add(tbvo);
		}
		// List<TravelDBVO> list = travelService.selectTravelList();
		// 관심지 하나씩이면 vo를 하나씩 받아서 쭉 넣어야함
		request.getSession().setAttribute("list", list);
		return mv;
	}
	
	@RequestMapping("/mytrvlplan_unlike")
	public ModelAndView goPLANUnlike(@RequestParam("travelIdx") List<Integer>  travelIdx) {
		ModelAndView mv = new ModelAndView("redirect:/mytrvlplan");
		for (Integer k : travelIdx) {
			System.out.println(k);
		}
		return mv;
	}
	
	@RequestMapping("/mytrvlplan_create")
	public ModelAndView goPLANCreate() { 
		return new ModelAndView("PLAN/mytrvlplan_create");
	}
	
	@RequestMapping("/mytrvlplan_list")
	public ModelAndView goPLANList() { 
		ModelAndView mv = new ModelAndView("PLAN/mytrvlplan_list");
		
		return mv;
	}
	
	@RequestMapping("/mytrvlplan_list_detail")
	public ModelAndView goPLANListDetail() { 
		ModelAndView mv = new ModelAndView("PLAN/mytrvlplan_list_detail");
		
		
		return mv;
	}
	
	// 이거 아마 상모님한테 있을거임
	@RequestMapping("/main_detail")
	public ModelAndView goMainDetail(@RequestParam("travelIdx") String travelIdx) {
		ModelAndView mv = new ModelAndView("MAIN/main_detail");
		
		// travelIdx 에 맞는 detail 구하기
		return mv;
	}
}
