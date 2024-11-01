package com.ict.mytravellist.PLAN.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.TrvlPlanVO;

@Repository
public class TravelDAOImpl implements TravelDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<TravelDBVO> selectTravelList() throws Exception{
		return sqlSessionTemplate.selectList("traveldb.list");
	}

	@Override
	public TravelDBVO selectOne(String travelIdx) throws Exception{
		return sqlSessionTemplate.selectOne("traveldb.onelist", travelIdx);
	}

	@Override
	public TravelDBVO selectOneReg(String region) throws Exception {
		return sqlSessionTemplate.selectOne("traveldb.onereg", region);
	}

	@Override
	public List<TrvlPlanVO> selectTrvlPlans(String userId) throws Exception {
		return null;
	}

	@Override
	public TrvlPlanVO selectOneTrvlPlan(String trvlPlanIdx) throws Exception {
		return null;
	}
	
	
}
