package com.ict.mytravellist.WTHR.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ict.mytravellist.WTHR.service.WeatherService;
import com.ict.mytravellist.WTHR.vo.RegionVO;
import com.ict.mytravellist.vo.WeatherVO;

@Controller
public class WeatherController {

	@Autowired
	private WeatherService weatherService;

	@GetMapping("/load_weather")
	public void getWthrDatas(HttpServletRequest request) {
		try {
			// DB 초기화
			weatherService.deleteWthrInfo();

			for (int i = 1; i < 17; i++) {
				getWthrDataRegion(i);
				System.out.println(i + "번째 성공");
			}

			request.setAttribute("result", "1");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void getWthrDataRegion(int regionNum) {
		int i = 0;
		String region = String.valueOf(regionNum);

		String shorts = weatherShort(region);
		int tMinIdx = 0;
		int skyIdx = 0;
		int dateIdx = 0;
		int ptyIdx = 0;
		int popIdx = 0;
		int tMaxIdx = 0;

		while (i < 3) {
			WeatherVO pvo = new WeatherVO();
			tMinIdx = shorts.indexOf("TMN", tMinIdx + 1);
			String wthrTMin = shorts.substring(tMinIdx + 79, shorts.indexOf("</fcstValue>", tMinIdx) - 2);
			String wthrDate = shorts.substring(tMinIdx + 24, tMinIdx + 28) + "-"
					+ shorts.substring(tMinIdx + 28, tMinIdx + 30) + "-"
					+ shorts.substring(tMinIdx + 30, shorts.indexOf("</fcstDate>", tMinIdx));

			dateIdx = shorts.indexOf("<fcstTime>1200</fcstTime>", dateIdx + 1);
			skyIdx = shorts.indexOf("SKY", dateIdx + 1);
			String wthrSKY = shorts.substring(skyIdx + 79, shorts.indexOf("</fcstValue>", skyIdx));
			ptyIdx = shorts.indexOf("PTY", dateIdx + 1);
			String wthrPTY = shorts.substring(ptyIdx + 79, shorts.indexOf("</fcstValue>", ptyIdx));

			String wthrSKY_PTY = "";
			switch (wthrSKY) {
			case "1":
				wthrSKY_PTY += "맑음";
				break;
			case "3":
				wthrSKY_PTY += "구름많음";
				break;
			case "4":
				wthrSKY_PTY += "흐림";
				break;
			}
			switch (wthrPTY) {
			case "1":
				wthrSKY_PTY += " (비)";
				break;
			case "2":
				wthrSKY_PTY += " (비/눈)";
				break;
			case "3":
				wthrSKY_PTY += " (눈)";
				break;
			case "4":
				wthrSKY_PTY += " (소나기)";
				break;
			}
			popIdx = shorts.indexOf("POP", dateIdx + 1);
			String wthrPOP = shorts.substring(popIdx + 79, shorts.indexOf("</fcstValue>", popIdx));

			dateIdx = shorts.indexOf("<fcstTime>1300</fcstTime>", dateIdx + 1);

			tMaxIdx = shorts.indexOf("TMX", tMaxIdx + 1);
			String wthrTMax = shorts.substring(tMaxIdx + 79, shorts.indexOf("</fcstValue>", tMaxIdx) - 2);

			pvo.setWthrDate(wthrDate);
			pvo.setWthrTMin(wthrTMin);
			pvo.setWthrTMax(wthrTMax);
			pvo.setWthrSKY_PTY(wthrSKY_PTY);
			pvo.setWthrPOP(wthrPOP);
			pvo.setRegion(region);

			weatherService.insertWthrInfo(pvo);
			i++;
		}

		String longs = weatherLong(region);
		LocalDate now = LocalDate.now();
		while (i < 11) {

			WeatherVO pvo = new WeatherVO();
			String wthrDate = now.plusDays(i).toString();

			tMinIdx = longs.indexOf(String.valueOf("<taMin" + i + ">"));
			tMaxIdx = longs.indexOf(String.valueOf("<taMax" + i + ">"));

			String wthrTMin = null;
			String wthrTMax = null;

			if (i == 10) {
				wthrTMin = longs.substring(tMinIdx + 9, longs.indexOf(String.valueOf("</taMin" + i + ">")));
				wthrTMax = longs.substring(tMaxIdx + 9, longs.indexOf(String.valueOf("</taMax" + i + ">")));
			} else {
				wthrTMin = longs.substring(tMinIdx + 8, longs.indexOf(String.valueOf("</taMin" + i + ">")));
				wthrTMax = longs.substring(tMaxIdx + 8, longs.indexOf(String.valueOf("</taMax" + i + ">")));
			}

			String wthrPOP = null;
			String wthrSKY_PTY = null;
			int skyptyIdx = 0;

			if (i < 8) {
				popIdx = longs.indexOf(String.valueOf("<rnSt" + i + "Pm>"));
				skyptyIdx = longs.indexOf(String.valueOf("<wf" + i + "Pm>"));

				wthrPOP = longs.substring(popIdx + 9, longs.indexOf(String.valueOf("</rnSt" + i + "Pm>")));
				wthrSKY_PTY = longs.substring(skyptyIdx + 7, longs.indexOf(String.valueOf("</wf" + i + "Pm>")));
			} else if (i < 10) {
				popIdx = longs.indexOf(String.valueOf("<rnSt" + i + ">"));
				skyptyIdx = longs.indexOf(String.valueOf("<wf" + i + ">"));

				wthrPOP = longs.substring(popIdx + 7, longs.indexOf(String.valueOf("</rnSt" + i + ">")));
				wthrSKY_PTY = longs.substring(skyptyIdx + 5, longs.indexOf(String.valueOf("</wf" + i + ">")));
			} else {
				popIdx = longs.indexOf(String.valueOf("<rnSt" + i + ">"));
				skyptyIdx = longs.indexOf(String.valueOf("<wf" + i + ">"));

				wthrPOP = longs.substring(popIdx + 8, longs.indexOf(String.valueOf("</rnSt" + i + ">")));
				wthrSKY_PTY = longs.substring(skyptyIdx + 6, longs.indexOf(String.valueOf("</wf" + i + ">")));
			}

			pvo.setWthrDate(wthrDate);
			pvo.setWthrTMin(wthrTMin);
			pvo.setWthrTMax(wthrTMax);
			pvo.setWthrSKY_PTY(wthrSKY_PTY);
			pvo.setWthrPOP(wthrPOP);
			pvo.setRegion(region);

			weatherService.insertWthrInfo(pvo);
			i++;
		}
	}

	public String weatherShort(String region) {
		RegionVO wvo = weatherService.getRegInfo(region);

		String nx = wvo.getNx();
		String ny = wvo.getNy();

		// 오늘 날짜
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		String today = sdf.format(now);

		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = null;

		// 단기 예보
		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=Phsud7RN2nkw6wPmg2Fa7q%2BQZbDH%2Bnpp3W8%2F4SPFFTtGDYQFO89qKkyqQwLKFEV9cBRvLktzL3E0TueDq3%2B2bw%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("1000", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("XML", "UTF-8")); /* 요청자료형식(XML/JSON) Default: XML */
			urlBuilder.append("&" + URLEncoder.encode("base_date", "UTF-8") + "=" + URLEncoder.encode(today, "UTF-8"));
			urlBuilder.append("&" + URLEncoder.encode("base_time", "UTF-8") + "="
					+ URLEncoder.encode("0200", "UTF-8")); /* 02시 발표 */
			urlBuilder.append(
					"&" + URLEncoder.encode("nx", "UTF-8") + "=" + URLEncoder.encode(nx, "UTF-8")); /* 예보지점의 X 좌표값 */
			urlBuilder.append(
					"&" + URLEncoder.encode("ny", "UTF-8") + "=" + URLEncoder.encode(ny, "UTF-8")); /* 예보지점의 Y 좌표값 */
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			System.out.println("Response code: " + conn.getResponseCode());

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}
			sb = new StringBuilder();

			String line;
			while ((line = rd.readLine()) != null) {
				sb.append(line);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rd.close();
				conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return sb.toString();
	}

	public String weatherLong(String region) {
		RegionVO wvo = weatherService.getRegInfo(region);
		String regId = wvo.getReg_id_short();

		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		Date now = new Date();
		String today = sdf.format(now);

		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = null;

		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=Phsud7RN2nkw6wPmg2Fa7q%2BQZbDH%2Bnpp3W8%2F4SPFFTtGDYQFO89qKkyqQwLKFEV9cBRvLktzL3E0TueDq3%2B2bw%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("XML", "UTF-8")); /* 요청자료형식(XML/JSON)Default: XML */
			urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8") + "=" + URLEncoder.encode(regId, "UTF-8"));
			urlBuilder.append(
					"&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode(today + "0600", "UTF-8"));
			URL url = new URL(urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			System.out.println("Response code2: " + conn.getResponseCode());

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			sb = new StringBuilder();
			String line;

			while ((line = rd.readLine()) != null) {
				if (line.equals("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")) {
					sb.append(line);
					continue;
				}
				int start = line.indexOf("<item>");
				int end = line.lastIndexOf("</item>");
				sb.append(line.substring(start, end));
			}

			String result = weatherLong2(region, today);
			sb.append(result);

			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				rd.close();
				conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	public String weatherLong2(String region, String today) {
		BufferedReader rd = null;
		HttpURLConnection conn = null;
		StringBuilder sb = null;

		RegionVO wvo = weatherService.getRegInfo(region);
		String regIdLong = wvo.getReg_id_long();

		try {
			StringBuilder urlBuilder = new StringBuilder(
					"http://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst"); /* URL */
			urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8")
					+ "=Phsud7RN2nkw6wPmg2Fa7q%2BQZbDH%2Bnpp3W8%2F4SPFFTtGDYQFO89qKkyqQwLKFEV9cBRvLktzL3E0TueDq3%2B2bw%3D%3D"); /*
																																 * Service
																																 * Key
																																 */
			urlBuilder.append(
					"&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /* 페이지번호 */
			urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "="
					+ URLEncoder.encode("10", "UTF-8")); /* 한 페이지 결과 수 */
			urlBuilder.append("&" + URLEncoder.encode("dataType", "UTF-8") + "="
					+ URLEncoder.encode("XML", "UTF-8")); /* 요청자료형식(XML/JSON)Default: XML */
			urlBuilder.append("&" + URLEncoder.encode("regId", "UTF-8") + "="
					+ URLEncoder.encode(regIdLong, "UTF-8")); /* 11B0000 서울, 인천, 경기도 11D10000 등 (활용가이드 하단 참고자료 참조) */
			urlBuilder.append(
					"&" + URLEncoder.encode("tmFc", "UTF-8") + "=" + URLEncoder.encode(today + "0600", "UTF-8"));
			/*-일 2회(06:00,18:00)회 생성 되며 발표시각을 입력 YYYYMMDD0600(1800)-최근 24시간 자료만 제공*/URL url = new URL(
					urlBuilder.toString());
			conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			System.out.println("Response code3: " + conn.getResponseCode());

			if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
				rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			} else {
				rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
			}

			sb = new StringBuilder();
			String line;

			while ((line = rd.readLine()) != null) {
				if (line.equals("<?xml version=\"1.0\" encoding=\"UTF-8\"?>")) {
					continue;
				}
				int start = line.indexOf("<item>") + 6;
				int end = line.lastIndexOf("</item>") + 7;
				sb.append(line.substring(start, end));
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				rd.close();
				conn.disconnect();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

}
