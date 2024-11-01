package com.ict.mytravellist.PLAN.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.ict.mytravellist.PLAN.vo.RouteInfoVO;

@RestController
public class PlanAjaxController {
	
	@RequestMapping(value = "/kakaoRoadLine", produces = "application/json; charset=utf-8")
	public List<RouteInfoVO> kakaoRoad(
			@RequestParam("positions[]") double[] positions,
			@RequestParam("idx_container[]") String[] idx_container,
			HttpServletRequest request) {
		try {
			List<String> coordinates_string = new ArrayList<>();
			
			for (int i = 0; i < positions.length; i += 2) {
				String coord = String.valueOf(positions[i]) + "," + String.valueOf(positions[i + 1]);
				coordinates_string.add(coord);
			}
			
			Map<String, String> map = new HashMap<String, String>();
			for (int i = 0; i < idx_container.length; i++) {
				map.put(coordinates_string.get(i), idx_container[i]);
			}
			
			// Origin 설정
			String origin = coordinates_string.get(0);
			
			List<String> coordinates_string_final = new ArrayList<>();
			coordinates_string_final.add(origin);
			
			while (coordinates_string.size() > 2) {
				int distance = 1500000;
				int idx = 0;

				for (int i = 1; i < coordinates_string.size(); i++) {
					int tmp = getDistance(coordinates_string.get(0), coordinates_string.get(i));
					if (tmp < distance) {
						distance = tmp;
						idx = i;
					}
				}
				coordinates_string_final.add(coordinates_string.get(idx));
				coordinates_string.remove(idx);
			}
			
			if (coordinates_string.size() == 2) {
				coordinates_string_final.add(coordinates_string.get(1));
			}
			
			String[] orders = new String[idx_container.length];
			
			for (int i = 0; i < coordinates_string_final.size(); i++) {
				orders[i] = map.get(coordinates_string_final.get(i));
				
			}
			
			for (String s : orders) {
				System.out.println(s);
			}
			
			boolean isOrigin = false;
			List<RouteInfoVO> list = new ArrayList<RouteInfoVO>();
			for (int i = 0; i < coordinates_string_final.size() - 1; i++) {
				String origin2 = coordinates_string_final.get(i);
				String destination = coordinates_string_final.get(i + 1);
				RouteInfoVO rvo = getRouteInfo(origin2, destination);
				
				if(!isOrigin) {
					rvo.getRoutes().get(0).getSummary().getOrigin().setName(orders[0]);
					isOrigin = true;
				}
				rvo.getRoutes().get(0).getSummary().getDestination().setName(orders[i+1]);
				list.add(rvo);
			}
			return list;

			

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int getDistance(String mark1, String mark2) {
		try {
			String origin = mark1;
			String destination = mark2;
			String urlString = "https://apis-navi.kakaomobility.com/v1/directions?origin=" + origin + "&destination="
					+ destination;

			URL url = new URL(urlString);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setDoOutput(true);

			conn.setRequestProperty("Authorization", "KakaoAK 1a31dbd4bb00984c5b2d38a62c3d2f0f");
			conn.setRequestProperty("Content-type", "application/json");

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode(getDistance) : " + responseCode);

			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				StringBuffer sb2 = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sb2.append(line);
				}
				String result = sb2.toString();

				Gson gson = new Gson();
				RouteInfoVO routeInfo = gson.fromJson(result, RouteInfoVO.class);
				return routeInfo.getRoutes().get(0).getSections().get(0).getDistance();

			} else {
				// 오류 메세지 출력
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				String line = "";
				StringBuffer sbError = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sbError.append(line);
				}
				System.out.println("Error response: " + sbError.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public RouteInfoVO getRouteInfo(String mark1, String mark2) {
		try {
			String urlString = "https://apis-navi.kakaomobility.com/v1/directions?origin=" + mark1 + "&destination="
					+ mark2;

			URL url = new URL(urlString);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			conn.setRequestMethod("GET");
			conn.setDoOutput(true);

			conn.setRequestProperty("Authorization", "KakaoAK 1a31dbd4bb00984c5b2d38a62c3d2f0f");
			conn.setRequestProperty("Content-type", "application/json");

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode(GetRouteInfo) : " + responseCode);

			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				StringBuffer sb2 = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sb2.append(line);
				}
				String result = sb2.toString();

				Gson gson = new Gson();
				RouteInfoVO routeInfo = gson.fromJson(result, RouteInfoVO.class);

				return routeInfo;

			} else {
				// 오류 메세지 출력
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
				String line = "";
				StringBuffer sbError = new StringBuffer();
				while ((line = br.readLine()) != null) {
					sbError.append(line);
				}
				System.out.println("Error response: " + sbError.toString());
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
}
