package com.ict.mytravellist.mypage.service;

import java.util.List;

import com.ict.mytravellist.vo.TourTalkVO;
import com.ict.mytravellist.vo.UserVO;

public interface ProjectService {
	
	public String  getUserUpdate(UserVO uvo) throws Exception;
	public List<TourTalkVO> getTTList(String userId, int offset, int limit) throws Exception;
	public String delTTOne(String tourTalkIdx) throws Exception;
	public String delTTChked(String[] chkedIdx) throws Exception;
	public UserVO getUserDetail(String userId) throws Exception;
	public int countData(String userId) throws Exception;
	public int getChangePw(UserVO uvo) throws Exception;
	public int getUserOut(String userId) throws Exception;
}
