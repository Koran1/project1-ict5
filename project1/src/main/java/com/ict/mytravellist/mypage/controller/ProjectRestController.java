package com.ict.mytravellist.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ict.mytravellist.mypage.service.ProjectService;
import com.ict.mytravellist.mypage.vo.Paging;
import com.ict.mytravellist.vo.TourTalkVO;

@RestController
public class ProjectRestController {

	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private Paging paging;

	@RequestMapping(value = "/get_comment_data", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map<String, Object> getTTList(HttpServletRequest request) {
		try {
			String userId = (String) request.getSession().getAttribute("userId");
			
			int count = projectService.countData(userId);
			paging.setTotalCount(count);
			int numPerPage = paging.getNumPerPage();
			
			if (count <= numPerPage) {
				paging.setTotalPage(1);
			}else {
				int totalPage = (count / numPerPage);
				if ((count % numPerPage) == 0) {
					paging.setTotalPage(totalPage);
				}else {
					paging.setTotalPage(totalPage + 1);
				}
			}
			
			String nowPage = request.getParameter("nowPage");
		
			if (nowPage == null || nowPage.equals("undefined") || Integer.parseInt(nowPage) < 1) {
				paging.setNowPage(1);
			}else {
				paging.setNowPage(Integer.parseInt(nowPage));
			}
			
		
			paging.setOffset(numPerPage * (paging.getNowPage() - 1));
			paging.setStartBlock((int)((paging.getNowPage() - 1)) / paging.getBlockPerPage() * paging.getBlockPerPage() + 1);
			paging.setEndBlock(paging.getStartBlock() + paging.getBlockPerPage() - 1);
			
			if (paging.getEndBlock() > paging.getTotalPage()) {
				paging.setEndBlock(paging.getTotalPage());
			}

			List<TourTalkVO> list = projectService.getTTList(userId, paging.getOffset(), paging.getNumPerPage());
			
			if (list != null) { 
				for (TourTalkVO k : list) {  
					StringBuffer sb = new StringBuffer();
					sb.append(k.getTourTalkContent());
					if (sb.length() > 20) { 
						sb.setLength(20);
						sb.append("...");
						k.setTourTalkContent(sb.toString());
					}
				}
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("list", list);
				map.put("paging", paging);
				return map;
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	  @RequestMapping(value="/get_del_one", produces="text/plain; charset=utf-8")
	  @ResponseBody 
	  public String DeleteTTOne(String tourTalkIdx) {
	  try {
		  String result = projectService.delTTOne(tourTalkIdx);
		  return result;
	  } catch (Exception e) {
		System.out.println(e);
		return "error";
	  }
	  }
	  
	  @RequestMapping(value="/get_del_chked", produces="text/plain; charset=utf-8")
	  @ResponseBody 
	  public String getDeleteTTChked(@RequestParam("chkedIdx[]") String[] chkedIdx) {
		  try {
			  String result = projectService.delTTChked(chkedIdx);
			  
			  return result;
		  } catch (Exception e) {
			  System.out.println(e);
			  return "error";
		  }
	  }
	 
}
