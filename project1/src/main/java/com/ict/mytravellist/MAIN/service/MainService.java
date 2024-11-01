package com.ict.mytravellist.MAIN.service;

import java.util.List;

import com.ict.mytravellist.vo.TravelDBVO;
import com.ict.mytravellist.vo.WeatherVO;

public interface MainService {

	public List<TravelDBVO> getRandomList();
	public List<TravelDBVO> getSearchList(String keyword) ;
	public List<TravelDBVO> searchKeywordAndRegion(String keyword, String region);
	public List<TravelDBVO> getTralDetail(String travelIdx);
	public List<WeatherVO> getWeatherList();
    public List<TravelDBVO> getDetailList(String trrsrtNm);
	
}
