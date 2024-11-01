package com.ict.mytravellist.mypage.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ict.mytravellist.mypage.dao.ProjectDAO;
import com.ict.mytravellist.vo.TourTalkVO;
import com.ict.mytravellist.vo.UserVO;

@Service
public class ProjectServiceImpl implements ProjectService {

	@Autowired
	private ProjectDAO projectDAO ;
	
	@Override
	public String getUserUpdate(UserVO uvo) throws Exception {
		return projectDAO.getUserUpdate(uvo);
	}

	@Override
	public List<TourTalkVO> getTTList(String userId, int offset, int limit) throws Exception { // ?��?��?�� select all
		return projectDAO.getTTList(userId, offset, limit);
	}

	@Override
	public String delTTOne(String tourTalkIdx) throws Exception {
		return projectDAO.delTTOne(tourTalkIdx);
	}

	@Override
	public String delTTChked(String[] chkedIdx) throws Exception {
		return projectDAO.delTTChked(chkedIdx);
	}

	@Override
	public UserVO getUserDetail(String userId) throws Exception {
		return projectDAO.getUserDetail(userId);
	}

	@Override
	public int countData(String userId) throws Exception {
		return projectDAO.countData(userId);
	}

	@Override
	public int getChangePw(UserVO uvo) throws Exception {
		return projectDAO.getChangePw(uvo);
	}

	@Override
	public int getUserOut(String userId) throws Exception {
		return projectDAO.getUserOut(userId);
	}


	

}
