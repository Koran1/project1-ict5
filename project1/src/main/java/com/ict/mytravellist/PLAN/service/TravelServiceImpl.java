package com.ict.mytravellist.PLAN.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.PLAN.dao.TravelDAO;
import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.TrvlPlanVO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private TravelDAO travelDAO;

	@Override
	public List<TravelDBVO> selectTravelList() throws Exception {
		return travelDAO.selectTravelList();
	}

	@Override
	public TravelDBVO selectOne(String travelIdx) throws Exception {
		return travelDAO.selectOne(travelIdx);
	}

	@Override
	public TravelDBVO selectOneReg(String region) throws Exception {
		return travelDAO.selectOneReg(region);
	}

	@Override
	public List<TrvlPlanVO> selectTrvlPlans(String userId) throws Exception {
		return travelDAO.selectTrvlPlans(userId);
	}

	@Override
	public TrvlPlanVO selectOneTrvlPlan(String trvlPlanIdx) throws Exception {
		return travelDAO.selectOneTrvlPlan(trvlPlanIdx);
	}
	
}
