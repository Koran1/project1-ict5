package com.ict.mytravellist.PLAN.vo;

import java.util.List;

public class SectionVO {
	private int distance;
	private int duration;
	private List<RoadVO> roads;

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public List<RoadVO> getRoads() {
		return roads;
	}

	public void setRoads(List<RoadVO> roads) {
		this.roads = roads;
	}
}
