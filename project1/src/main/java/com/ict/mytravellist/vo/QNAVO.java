package com.ict.mytravellist.vo;

import org.springframework.web.multipart.MultipartFile;

public class QNAVO {
	private String qnaIdx, userId, qnaSubject, qnaFile, qnaContent, qnaReg, 
		qnaReSubject, qnaReContent, qnaReRegdate, qnaStatus, qnaEtc01, qnaEtc02;
	
	private MultipartFile FileName;

	public String getQnaIdx() {
		return qnaIdx;
	}

	public void setQnaIdx(String qnaIdx) {
		this.qnaIdx = qnaIdx;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getQnaSubject() {
		return qnaSubject;
	}

	public void setQnaSubject(String qnaSubject) {
		this.qnaSubject = qnaSubject;
	}

	public String getQnaFile() {
		return qnaFile;
	}

	public void setQnaFile(String qnaFile) {
		this.qnaFile = qnaFile;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaReg() {
		return qnaReg;
	}

	public void setQnaReg(String qnaReg) {
		this.qnaReg = qnaReg;
	}

	public String getQnaReSubject() {
		return qnaReSubject;
	}

	public void setQnaReSubject(String qnaReSubject) {
		this.qnaReSubject = qnaReSubject;
	}

	public String getQnaReContent() {
		return qnaReContent;
	}

	public void setQnaReContent(String qnaReContent) {
		this.qnaReContent = qnaReContent;
	}

	public String getQnaReRegdate() {
		return qnaReRegdate;
	}

	public void setQnaReRegdate(String qnaReRegdate) {
		this.qnaReRegdate = qnaReRegdate;
	}

	public String getQnaStatus() {
		return qnaStatus;
	}

	public void setQnaStatus(String qnaStatus) {
		this.qnaStatus = qnaStatus;
	}

	public String getQnaEtc01() {
		return qnaEtc01;
	}

	public void setQnaEtc01(String qnaEtc01) {
		this.qnaEtc01 = qnaEtc01;
	}

	public String getQnaEtc02() {
		return qnaEtc02;
	}

	public void setQnaEtc02(String qnaEtc02) {
		this.qnaEtc02 = qnaEtc02;
	}

	public MultipartFile getFileName() {
		return FileName;
	}

	public void setFileName(MultipartFile fileName) {
		FileName = fileName;
	}
}