package com.ict.mytravellist.MAIN.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.WeatherVO;

@Mapper
public interface MainDAO {
	public List<TravelDBVO> getRandomList();
	public List<TravelDBVO> getSearchList(String keyword) ;
	public List<TravelDBVO> searchKeywordAndRegion(String keyword, String region);
	public List<TravelDBVO> getTralDetail(String travelIdx);
	public List<WeatherVO> getWeatherList();
    public List<TravelDBVO> getDetailList(String trrsrtNm);
	
}
