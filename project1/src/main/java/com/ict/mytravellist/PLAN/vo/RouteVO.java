package com.ict.mytravellist.PLAN.vo;

import java.util.List;

public class RouteVO {

	private SummaryVO summary;
	private List<SectionVO> sections;

	public List<SectionVO> getSections() {
		return sections;
	}

	public void setSections(List<SectionVO> sections) {
		this.sections = sections;
	}

	public SummaryVO getSummary() {
		return summary;
	}

	public void setSummary(SummaryVO summary) {
		this.summary = summary;
	}

}
