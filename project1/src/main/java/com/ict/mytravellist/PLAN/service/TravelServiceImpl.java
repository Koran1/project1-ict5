package com.ict.mytravellist.PLAN.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.PLAN.dao.TravelDAO;
import com.ict.mytravellist.vo.TravelDBVO;

@Service
public class TravelServiceImpl implements TravelService{
	
	@Autowired
	private TravelDAO travelDAO;

	@Override
	public List<TravelDBVO> selectTravelList() {
		return travelDAO.selectTravelList();
	}

	@Override
	public TravelDBVO selectOne(String travelIdx) {
		return travelDAO.selectOne(travelIdx);
	}

	@Override
	public TravelDBVO selectOneReg(String region) {
		return travelDAO.selectOneReg(region);
	}
	
}
