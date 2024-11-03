package com.ict.mytravellist.vo;

import org.springframework.web.multipart.MultipartFile;

public class TourTalkVO {
	private String tourTalkIdx, trrsrtNm, tourTalkContent, tourTalkReg, tourTalkEtc01, tourTalkEtc02, tourTalkIcon, hit;
	private MultipartFile file_name ;
	
	public String getTourTalkIdx() {
		return tourTalkIdx;
	}
	public void setTourTalkIdx(String tourTalkIdx) {
		this.tourTalkIdx = tourTalkIdx;
	}
	public String getTrrsrtNm() {
		return trrsrtNm;
	}
	public void setTrrsrtNm(String trrsrtNm) {
		this.trrsrtNm = trrsrtNm;
	}
	public String getTourTalkContent() {
		return tourTalkContent;
	}
	public void setTourTalkContent(String tourTalkContent) {
		this.tourTalkContent = tourTalkContent;
	}
	public String getTourTalkReg() {
		return tourTalkReg;
	}
	public void setTourTalkReg(String tourTalkReg) {
		this.tourTalkReg = tourTalkReg;
	}
	public String getTourTalkEtc01() {
		return tourTalkEtc01;
	}
	public void setTourTalkEtc01(String tourTalkEtc01) {
		this.tourTalkEtc01 = tourTalkEtc01;
	}
	public String getTourTalkEtc02() {
		return tourTalkEtc02;
	}
	public void setTourTalkEtc02(String tourTalkEtc02) {
		this.tourTalkEtc02 = tourTalkEtc02;
	}
	public String getTourTalkIcon() {
		return tourTalkIcon;
	}
	public void setTourTalkIcon(String tourTalkIcon) {
		this.tourTalkIcon = tourTalkIcon;
	}
	public MultipartFile getFile_name() {
		return file_name;
	}
	public void setFile_name(MultipartFile file_name) {
		this.file_name = file_name;
	}
	
	

}
