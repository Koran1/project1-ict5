package com.ict.mytravellist.MAIN.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.mytravellist.MAIN.service.MainServiceImpl;
import com.ict.mytravellist.MAIN.vo.TravelDBVO;

@RestController
public class MainController {

	@Autowired
	private MainServiceImpl mainService;
	
	// HOME
	@GetMapping("/main_go")
	public String maiPage(Model model) {
		System.out.println("main_go controller 통과");
		return "main";
	}
	
	// 랜덤 지역 이미지 불러오기
	@RequestMapping(value="/random_location", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reNewMainPage() {
	    List<TravelDBVO> list = mainService.getRandomList();  // 랜덤 이미지 조회
		if(list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			System.out.println();
			return jsonString;
		}
		return "fail";
	}
	
    // 키워드로 검색
    @GetMapping("/search_go")
    public ModelAndView mainSearch(@ModelAttribute("keyword") String keyword) {
        ModelAndView mv = new ModelAndView("search");
        List<TravelDBVO> list = mainService.getSearchList(keyword);

        mv.addObject("list", list);
        mv.addObject("keyword", keyword);
        System.out.println("search_go Controller 통과");
        return mv;
    }

    // 키워드와 지역으로 검색
@GetMapping("/region_search")
public ModelAndView regionSearch(
        @RequestParam("keyword") String keyword,
        @RequestParam(value = "region", required = false) String region) {

    	ModelAndView mv = new ModelAndView("search");
        List<TravelDBVO> list;

        if (region == null || region.isEmpty()) {
            list = mainService.getSearchList(keyword);
        } else {
            list = mainService.searchKeywordAndRegion(keyword, region);
        }

        mv.addObject("list", list);
        mv.addObject("keyword", keyword);
        mv.addObject("region", region);
        System.out.println("region_search Controller 통과");
        return mv;
    }

    // 특정 관광지의 상세 정보 조회
    @GetMapping("/detail_go")
    public ModelAndView detail(@ModelAttribute("travelIdx") String trrsrtNm) {
        ModelAndView mv = new ModelAndView("travlDetail");
        List<TravelDBVO> list = mainService.getDetailList(trrsrtNm);

        if (!list.isEmpty()) {
            mv.addObject("list", list.get(0));
            System.out.println("detail_go Controller 통과: " + trrsrtNm);
        } else {
            System.out.println("해당 관광지 정보를 찾을 수 없습니다: " + trrsrtNm);
        }

        return mv;
    }
    
    // 카카오맵 연동
    @GetMapping("/kakaoMap")
	public ModelAndView kakaoMap() {
    	
		return new ModelAndView("kakaoMap");
	}	
	
	
	
	
}






















