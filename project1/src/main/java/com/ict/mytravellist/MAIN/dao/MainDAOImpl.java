package com.ict.mytravellist.MAIN.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.WeatherVO;

@Repository
public class MainDAOImpl implements MainDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	} 
	
	// 랜덤 지역 이미지 불러오기
	@Override
	public List<TravelDBVO> getRandomList() {
	    // System.out.println("getRandomList MainDAO 통과");
	    return sqlSessionTemplate.selectList("main.randomList");  // 랜덤한 여행지 반환
	}
	
    // 키워드로 검색하는 메서드
	@Override
    public List<TravelDBVO> getSearchList(String keyword) {
        try {
            List<TravelDBVO> list = sqlSessionTemplate.selectList("main.getSearchList", keyword);
            System.out.println("getSearchList MainDAO 통과");
            return list;
        } catch (Exception e) {
            System.out.println("getSearchList 검색 중 오류 발생: " + e.getMessage());
            return null;
        }
    }
	
	 // 키워드와 지역으로 검색하는 메서드
	@Override
    public List<TravelDBVO> searchKeywordAndRegion(String keyword, String region) {
        try {
            Map<String, String> map = new HashMap<>();
            map.put("keyword", keyword);
            map.put("region", region);

            List<TravelDBVO> list = sqlSessionTemplate.selectList("main.getSearchKeyRegion", map);
            System.out.println("searchKeywordAndRegion MainDAO 통과");
            return list;
        } catch (Exception e) {
            System.out.println("searchKeywordAndRegion 검색 중 오류 발생: " + e.getMessage());
            return null;
        }
    }
	
    // 특정 관광지 이름으로 상세 정보를 가져오는 메서드
	@Override
    public List<TravelDBVO> getDetailList(String trrsrtNm) {
        try {
            List<TravelDBVO> list = sqlSessionTemplate.selectList("main.getDetailList", trrsrtNm);
            System.out.println("getDetailList MainDAO 통과");
            return list;
        } catch (Exception e) {
            System.out.println("getDetailList 검색 중 오류 발생: " + e.getMessage());
            return null;
        }
    }

	@Override
	public List<WeatherVO> getWeatherList() {
		return sqlSessionTemplate.selectList("main.getWeatherList");
	}

	@Override
	public List<TravelDBVO> getTralDetail(String travelIdx) {
		// TODO Auto-generated method stub
		return null;
	}
}
