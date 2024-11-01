package com.ict.mytravellist.PLAN.vo;

import java.util.List;

public class RouteInfoVO {
	
	private List<RouteVO> routes;
	
	public class RouteVO {
		private SummaryVO summary;
		private List<SectionVO> sections;

		public class SummaryVO {
			private LocationVO origin;
			private LocationVO destination;

			public class LocationVO {
				private String name;
				private double x;
				private double y;

				public String getName() {
					return name;
				}

				public void setName(String name) {
					this.name = name;
				}

				public double getX() {
					return x;
				}

				public void setX(double x) {
					this.x = x;
				}

				public double getY() {
					return y;
				}

				public void setY(double y) {
					this.y = y;
				}
			}

			public LocationVO getOrigin() {
				return origin;
			}

			public void setOrigin(LocationVO origin) {
				this.origin = origin;
			}

			public LocationVO getDestination() {
				return destination;
			}

			public void setDestination(LocationVO destination) {
				this.destination = destination;
			}

		}

		public class SectionVO {
			private int distance;
			private int duration;
			private List<RoadVO> roads;

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

	public List<RouteVO> getRoutes() {
		return routes;
	}

	public void setRoutes(List<RouteVO> routes) {
		this.routes = routes;
	}
	
}
