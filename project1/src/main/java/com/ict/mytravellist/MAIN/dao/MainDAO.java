package com.ict.mytravellist.MAIN.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.WeatherVO;

@Mapper
public interface MainDAO {
	public List<TravelDBVO> getRandomList();
	public List<TravelDBVO> getSearchList(@Param("keyword") String keyword);
	public List<TravelDBVO> searchKeywordAndRegion(@Param("keyword") String keyword, @Param("region") String region);
	public List<TravelDBVO> getDetailList(@Param("trrsrtNm") String trrsrtNm);
	public List<WeatherVO> getWeatherList(String travelIdx, String region);
	public List<TravelDBVO> getTralDetail(String travelIdx);
}
