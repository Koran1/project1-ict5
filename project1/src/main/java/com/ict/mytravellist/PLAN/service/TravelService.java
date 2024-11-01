package com.ict.mytravellist.PLAN.service;

import java.util.List;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.TrvlPlanVO;

public interface TravelService {
	public List<TravelDBVO> selectTravelList() throws Exception;
	public TravelDBVO selectOne(String travelIdx) throws Exception;
	public TravelDBVO selectOneReg(String region) throws Exception;
	public List<TrvlPlanVO> selectTrvlPlans(String userId) throws Exception;
	public TrvlPlanVO selectOneTrvlPlan(String trvlPlanIdx) throws Exception;
}
