package com.ict.mytravellist.PLAN.vo;

public class RoadVO {
	private String name;
	private int distance;
	private int duration;
	private double[] vertexes;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

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

	public double[] getVertexes() {
		return vertexes;
	}

	public void setVertexes(double[] vertexes) {
		this.vertexes = vertexes;
	}

}
