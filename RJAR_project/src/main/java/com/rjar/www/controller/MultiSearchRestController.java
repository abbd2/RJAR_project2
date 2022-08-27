package com.rjar.www.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.StringTokenizer;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rjar.www.bean.summonersearch.MultiSearchBean;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController // @ResponseBody 생략
@RequiredArgsConstructor
@RequestMapping(value = "/multiSearch")
public class MultiSearchRestController {

	private final MultiSearchBean msb;

	private final static String api_key = "RGAPI-08c7da92-9810-4c40-8560-b6af5f2443ac";

	@GetMapping(value = "/executeMultiSearch")
	public ArrayList<MultiSearchBean> multiSearch(String summoners) throws IOException {

		long beforeTime = System.currentTimeMillis(); // 코드 실행 전의 시간

		ArrayList<MultiSearchBean> msbList = getSummonersInfo(summoners); // 멀티서치에 뿌릴 정보 받아오기

		long afterTime = System.currentTimeMillis(); // 코드 실행 후의 시간
		double secDiffTime = ((double) afterTime - beforeTime) / 1000;

		for (int i = 0; i < msbList.size(); i++) {
			System.out.println("---------- 최종 데이터 값 모두 출력 ----------");
			System.out.println("소환사 이름 : " + msbList.get(i).getSummonerName());
			System.out.println("티어 : " + msbList.get(i).getTier());
			System.out.println("랭크 : " + msbList.get(i).getRank());
			System.out.println("LP : " + msbList.get(i).getLp());
			System.out.println("종합 승리 : " + msbList.get(i).getTotalWins());
			System.out.println("종합 패배 : " + msbList.get(i).getTotalLosses());
			System.out.println("종합 승률 : " + msbList.get(i).getTotalWinRate());
			for (int j = 0; j < 10; j++) {
				System.out.println("이제부터 10개씩 저장된 값");
				System.out.println("챔피언 이름 : " + msbList.get(i).getChampionName()[j]);
				System.out.println("라인 : " + msbList.get(i).getLanes()[j]);
				System.out.println("킬 : " + msbList.get(i).getKilss()[j]);
				System.out.println("데스 : " + msbList.get(i).getDeaths()[j]);
				System.out.println("어시스트 : " + msbList.get(i).getAssists()[j]);
				System.out.println("결과 : " + msbList.get(i).getWins()[j]);
				System.out.println("게임을 언제 했는지 : " + msbList.get(i).getAgoTimeDate()[j]);
				System.out.println();
			}
		}

		System.out.println("총 걸린 시간 : " + secDiffTime);

		return msbList;
	}

	public ArrayList<MultiSearchBean> getSummonersInfo(String summoners) throws IOException {

		// 나중에 summoners 유무 체크
		String replaceVal = "님이 방에 참가했습니다.";

		// 소환사 이름 가공
		log.info("검색창에서 넘어온 값 : " + summoners);
		String summoners1 = summoners.replace(replaceVal, ""); // replaceVal 제거
		log.info("replaceval 제거 : " + summoners1);

		// 개행과 쉼표 문자를 기준으로 나누어서 소환사 이름 저장
		String[] summonerName = summoners1.split("\\R|,");

		for (int i = 0; i < summonerName.length; i++) {
			summonerName[i] = summonerName[i].trim(); // 앞뒤 공백 제거
			log.info("앞뒤 공백 제거 : " + summonerName[i]);
		}

		ArrayList<MultiSearchBean> msbList = new ArrayList<>();

		for (int i = 0; i < summonerName.length; i++) {
			System.out.println(summonerName[i] + "의 puuid 받아오는중...");

			msb.setSummonerName(summonerName[i]); // 소환사의 이름 저장
			msbList.add(getPuuid(summonerName[i])); // 데이터 받아오기
			System.out.println((++i) + "명 완료...");
			System.out.println();
		}
		return msbList;
	}

	// 소환사 이름으로 puuid 받아오기
	public MultiSearchBean getPuuid(String summonerName) throws IOException {

		// puuid검색을 위해 닉네임의 공백이 있을경우 공백 제거
		summonerName = summonerName.replaceAll("\\s", "");
		String proFileUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName
				+ "?api_key=" + api_key;

		String result = connectURL(proFileUrl); // url connect
		JsonNode json = parseStringToJson(proFileUrl, result); // String(json모양) -> JsonNode

		JsonNode jsonId = json.get("id"); // JsonNode에서 id 저장
		JsonNode jsonPuuid = json.get("puuid"); // JsonNode에서 puuid 저장

		String id = replaceQuotationMarks(jsonId.toString()); // 큰따옴표 제거한 값 저장
		String puuid = replaceQuotationMarks(jsonPuuid.toString()); // 큰따옴표 제거한 값 저장

		System.out.println("id : " + id);
		System.out.println("puuid : " + puuid);

		// 리그 정보 저장
		leagueInfo(id);
		// 게임 정보 저장
		getGameId(puuid.toString());

		return msb;
	}

	// 리그정보 가져오기
	public void leagueInfo(String id) throws IOException {

		String leagueUrl = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key="
				+ api_key;
		String result = connectURL(leagueUrl); // url connect
		result = replaceSquareBrackets(result); // 대괄호 제거
		JsonNode json = parseStringToJson(leagueUrl, result); // String to jsonNode

		System.out.println("프로필 데이터 저장중...");

		// tier 저장
		System.out.println("티어");
		JsonNode jsonTier = json.get("tier"); // JsonNode에서 tier 저장
		System.out.println("jsonTier : " + jsonTier);

		String jsonTier2 = replaceQuotationMarks(jsonTier.toString()); // 큰따옴표 제거
		msb.setTier(jsonTier2.toString()); // 큰따옴표 제거한 값 저장
		System.out.println("Tier : " + msb.getTier());

		// 랭크 저장
		System.out.println("랭크");
		JsonNode jsonRank = json.get("rank"); // JsonNode에서 tier 저장
		System.out.println("jsonRank : " + jsonRank);

		String jsonRank2 = replaceQuotationMarks(jsonRank.toString()); // 큰따옴표 제거
		msb.setRank(jsonRank2); // 큰따옴표 제거한 값 저장
		System.out.println("rank : " + msb.getRank());

		// LP 저장
		System.out.println("LP");
		JsonNode jsonLP = json.get("leaguePoints"); // JsonNode에서 tier 저장
		System.out.println("jsonLP : " + jsonLP);

		msb.setLp(jsonLP.toString()); // 큰따옴표 제거한 값 저장
		System.out.println("leaguePoints : " + msb.getLp());

		// 전체 경기 승리 수 저장
		System.out.println("전체 경기 승리 수");
		JsonNode jsonWins = json.get("wins"); // JsonNode에서 tier 저장
		System.out.println("jsonWins : " + jsonWins);

		msb.setTotalWins(Integer.parseInt(jsonWins.toString())); // 큰따옴표 제거한 값 저장
		System.out.println("wins : " + msb.getTotalWins());

		// 전체 경기 패배 수 저장
		System.out.println("전체 패배 수");
		JsonNode jsonLosses = json.get("losses"); // JsonNode에서 tier 저장
		System.out.println("jsonLosses : " + jsonLosses);

		msb.setTotalLosses(Integer.parseInt(jsonLosses.toString())); // 큰따옴표 제거한 값 저장
		System.out.println("losses : " + msb.getTotalLosses());

		// 전체 경기의 승률 저장
		System.out.println("승률");
		if (msb.getTotalLosses() > 0) {
			double winRate = 0;
			winRate = (double) msb.getTotalWins() / (msb.getTotalWins() + msb.getTotalLosses()) * 100;
			msb.setTotalWinRate(Math.round((int) winRate));
		} else {
			msb.setTotalWinRate(-1);
		}
		System.out.println("totalWinRate : " + msb.getTotalWinRate());
	}

	// puuid로 gameid 10개씩 받기
	public void getGameId(String puuid) throws IOException {

		System.out.println("gmaeID 가져오는 중...");
		String matchUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + puuid
				+ "/ids?start=0&count=10&api_key=" + api_key;
		String result = connectURL(matchUrl); // url connect
		String gameId = replaceSquareBrackets(result); // 대괄호 제거한 값 저장
		gameId = replaceQuotationMarks(gameId); // 큰따옴표 제거한 값 저장

		// 쉼표를 기준으로 나누기
		String[] gameIds = gameId.split(",");

		String[] championName = new String[10];
		String[] lanes = new String[10];
		int[] kills = new int[10];
		int[] deaths = new int[10];
		int[] assists = new int[10];
		String[] wins = new String[10]; // 승패 여부
		String[] endTimeDate = new String[10]; // 경기 끝난 시간

		// 게임이아디에서 데이터 가져오기
		for (int i = 0; i < gameIds.length; i++) {
			System.out.println("검색할 게임 아이디 : " + gameIds[i]);
			Object[] data = getGameData(gameIds[i]); // 게임아이디와 인덱스를 넘겨줌
			System.out.println("반환된 데이터 : " + Arrays.toString(data));

			championName[i] = replaceQuotationMarks(data[0].toString()); // 큰따옴표 제거
			lanes[i] = replaceQuotationMarks(data[1].toString()); // 큰따옴표 제거
			kills[i] = Integer.parseInt(data[2].toString());
			deaths[i] = Integer.parseInt(data[3].toString());
			assists[i] = Integer.parseInt(data[4].toString());
			wins[i] = data[5].toString(); // 큰따옴표 제거
			endTimeDate[i] = data[6].toString();

			System.out.println("---------- 받아온 데이터 ----------");
			System.out.println(Arrays.toString(data));
			System.out.println("-------------------------------");
		}

		msb.setChampionName(championName);
		msb.setLanes(lanes);
		msb.setKilss(kills);
		msb.setDeaths(deaths);
		msb.setAssists(assists);
		msb.setWins(wins);
		msb.setAgoTimeDate(endTimeDate);
	}

	// 게임아이디로 데이터 가져오기
	private Object[] getGameData(String gameId) throws IOException {

		System.out.println("게임아이디를 이용해 데이터 가져오는중...");

		System.out.println("gameId : " + gameId);
		String gameUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/" + gameId + "?api_key=" + api_key;

		String result = connectURL(gameUrl); // url connect
		JsonNode json = parseStringToJson(gameUrl, result); // Stinrg -> JsonNode

		System.out.println("------------------------------------");
		System.out.println("gameid json : " + json);
		System.out.println("------------------------------------");

		// 소환사 이름 저장
		System.out.println("검색할 소환사 이름 : " + msb.getSummonerName());

		Object[] data = new Object[7]; // 데이터 담을 공간
		String summonerName = "\"" + msb.getSummonerName() + "\""; // 포맷 맞춰주기

		long currentTime = System.currentTimeMillis() / 1000; // 현재 시간 구하기
		long endTimeDate = Long.parseLong(json.get("info").get("gameEndTimestamp").toString()) / 1000; // 게임이 끝난 시간
		System.out.println("현재 유닉스 시간 : " + currentTime);
		System.out.println("게임이 끝난 유닉스 시간 : " + endTimeDate);

		long agoTime = currentTime - endTimeDate; // 몇시간 전에 했는지 구하기
		System.out.println("agoTime : " + agoTime);

//		// 맞춰진 형식으로 띄우기 위해 계산
		if (agoTime / 2592000 >= 1) {
			long monTime = agoTime / 2592000;
			data[6] = monTime + "달 전";
		} else if (agoTime / 86400 >= 1) { // 일 계산
			long dayTime = agoTime / 86400;
			data[6] = dayTime + "일 전"; // 하루 이상이면
		} else if (agoTime / 3600 >= 1) {
			long hourTime = agoTime / 3600;
			data[6] = hourTime + "시간 전"; // 1시간 이상이면
		} else if (agoTime / 60 >= 1) {
			long minTime = agoTime / 60;
			data[6] = minTime + "분 전"; // 1분 이상이면
		}

		System.out.println("게임한 시간 : " + data[6]);

//		10명의 소환사의 이름과 비교한 후 같으면 데이터 저장
		for (int j = 0; j < 10; j++) {
			String sumNameToComp = json.get("info").get("participants").get(j).get("summonerName").toString();
			System.out.println(j + "번째 소환사 이름 : " + sumNameToComp);

			if (sumNameToComp.equals(summonerName)) { // 검색한 소환사 이름과 같으면
				System.out.println("----- 소환사 이름 일치 -----");
				data[0] = json.get("info").get("participants").get(j).get("championName");
				data[1] = json.get("info").get("participants").get(j).get("lane");
				data[2] = json.get("info").get("participants").get(j).get("kills");
				data[3] = json.get("info").get("participants").get(j).get("deaths");
				data[4] = json.get("info").get("participants").get(j).get("assists");
				data[5] = json.get("info").get("participants").get(j).get("win");

				System.out.println(Arrays.toString(data));
				System.out.println();
				return data;
			}
		}

		return data;
	}

	// url 커넥션
	public static String connectURL(String getUrl) throws IOException {

		System.out.println("URL connecting...");
		URL url = new URL(getUrl);
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
		urlconnection.setRequestMethod("GET");
		BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));

		String brRead = "";
		String result = "";

		// br,readLine() 한 줄 이상이 있다면
		while ((brRead = br.readLine()) != null) {
			result += brRead;
			System.out.println("connectURL : " + result);
		} // while end

		// url에서 긁어온 값을 String으로 반환
		return result;
	}

	// 문자열 -> JsonNode
	public static JsonNode parseStringToJson(String getUrl, String result) throws IOException {

		System.out.println("String to JsonNode...");

//		JsonParser jsonParser = new JsonParser();
//		JsonObject jsonNode = (JsonObject) jsonParser.parse(result);

		ObjectMapper objMapper = new ObjectMapper();
		JsonNode jsonNode = objMapper.readTree(result); // String을 JsonNode로 변환
		System.out.println("jsonNode : " + jsonNode);

		return jsonNode;
	}

	// 큰따옴표 제거 메소드
	public static String replaceQuotationMarks(String str) {
		System.out.println("큰따옴표 제거 전 : " + str);
		str = str.replace("\"", ""); // 큰따옴표 제거
		System.out.println("큰따옴표 제거 후 : " + str);
		return str;
	}

	// 대괄호 제거 메소드
	public static String replaceSquareBrackets(String str) {
		System.out.println("대괄호 제거 전 : " + str);
		str = str.replace("[", ""); // 대괄호 제거
		str = str.replace("]", ""); // 대괄호 제거
		System.out.println("대괄호 제거 후 : " + str);
		return str;
	}

}
