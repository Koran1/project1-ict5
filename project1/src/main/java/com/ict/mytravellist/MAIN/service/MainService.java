package com.ict.mytravellist.MAIN.service;

import java.util.List;

import com.ict.mytravellist.MAIN.vo.TravelDBVO;
import com.ict.mytravellist.MAIN.vo.WeatherVO;

public interface MainService {

	public List<TravelDBVO> getRandomList();
	public List<WeatherVO> getWeatherList(String travelIdx, String region);
	public List<TravelDBVO> getTralDetail(String travelIdx);
	public List<TravelDBVO> getSearchList(String keyword) ;
    public List<TravelDBVO> searchKeywordAndRegion(String keyword, String region);
    public List<TravelDBVO> getDetailList(String trrsrtNm);
	
}