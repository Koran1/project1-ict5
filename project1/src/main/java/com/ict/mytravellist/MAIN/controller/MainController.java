package com.ict.mytravellist.MAIN.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.ict.mytravellist.MAIN.common.MainPaging;
import com.ict.mytravellist.MAIN.service.MainService;
import com.ict.mytravellist.MAIN.service.TourTalkService;
import com.ict.mytravellist.vo.TourTalkVO;
import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.WeatherVO;

@RestController
public class MainController {

	@Autowired
	private MainService mainService;
	
	@Autowired
	private TourTalkService tourTalkService;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private MainPaging paging;
	
	// HOME
	@GetMapping("/main_go")
	public ModelAndView maiPage(Model model) {
		ModelAndView mv = new ModelAndView("MAIN/main");
		// System.out.println("main_go controller 통과");
		List<WeatherVO> list = mainService.getWeatherList();
		mv.addObject("list", list);
		return mv;
	}
	
	// 랜덤 지역 이미지 불러오기
	@RequestMapping(value="/random_location", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String reNewMainPage() {
	    List<TravelDBVO> list = mainService.getRandomList();  // 랜덤 이미지 조회
		if(list != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(list);
			// System.out.println();
			return jsonString;
		}
		return "fail";
	}

    // 키워드와 지역으로 검색
	@GetMapping("/region_search")
	public ModelAndView regionSearch(
	        @RequestParam("keyword") String keyword,
	        @RequestParam(value = "region", required = false) String region) {
	
	    	ModelAndView mv = new ModelAndView("MAIN/search");
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
	

	@GetMapping("/search_go")
	public ModelAndView boardList(@ModelAttribute("keyword") String keyword,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("MAIN/search");
		
		// 페이징 기법
		// 전체 게시물의 수 (DB처리)
		int count = mainService.getSearchCount(keyword);
		paging.setTotalRecord(count);					// 집어 넣는다
		
		// System.out.println("count : " + count);
		// 전체 페이지의 수를 구한다
		if(paging.getTotalRecord() <= paging.getNumPerPage()) {// 전체 게시물의 수가 1 page 전체 줄 표시 보다 작으면
			paging.setTotalPage(1);						// 1페이지를 보여라
		} else {

	        paging.setTotalPage((int) Math.ceil((double) paging.getTotalRecord() / paging.getNumPerPage()));
		}
		
		// 파라미터에서 넘어오는 cPage(보고싶은 페이지 번호)를 구하자
		String cPage = request.getParameter("cPage");
		// 만약 cPage 가 null 이면 무조건 1page 이다
		if (cPage == null) {
			paging.setNowPage(1);
		} else {
			paging.setNowPage(Integer.parseInt(cPage));
		}
		
		paging.setOffset(paging.getNumPerPage() * (paging.getNowPage() - 1));

	    // 현재 페이지 블록 계산
	    paging.setNowBlock((int) Math.ceil((double) paging.getNowPage() / paging.getPagePerBlock()));

	    // 현재 블록의 시작 페이지와 끝 페이지 설정
	    paging.setBeginBlock((paging.getNowBlock() - 1) * paging.getPagePerBlock() + 1);
	    paging.setEndBlock(paging.getBeginBlock() + paging.getPagePerBlock() - 1);
	    
		// 주의사항
		// endBlock(3, 6, 9...) 나온다. 그런데 실제 가지고 있는 총 페이지가 20개일 경우 4페이지까지만 나와야 한다. 4, 5, 6 나오면 안된다
		if (paging.getEndBlock() > paging.getTotalPage()) {
			paging.setEndBlock(paging.getTotalPage());
		}
		
		// DB 처리
		List<TravelDBVO> list = mainService.getSearchPageList(paging.getOffset(), paging.getNumPerPage(), keyword);
		if (list != null) {
			mv.addObject("list", list);
			mv.addObject("paging", paging);
			mv.addObject("keyword", keyword);
			mv.addObject("count", count);
			return mv;
		}
		return null;
	}


    // 특정 관광지의 상세 정보 조회
    @GetMapping("/travelDetail_go")
    public ModelAndView detail(@ModelAttribute("travelIdx") String travelIdx) {
        ModelAndView mv = new ModelAndView("MAIN/travelDetail");
        List<TravelDBVO> list = mainService.getDetailList(travelIdx);

        if (!list.isEmpty()) {
            mv.addObject("list", list.get(0));
            // System.out.println("detail_go Controller 통과: " + list);
        } else {
            System.out.println("해당 관광지 정보를 찾을 수 없습니다: " + travelIdx);
        }

        return mv;
    }
    

    
}






















