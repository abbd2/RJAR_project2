package com.rjar.www.service.search;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.rjar.www.bean.summonersearch.GameDetailShowInfo;
import com.rjar.www.dao.ISummonerSearch;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class SummonerSearchMM {

	@Autowired
	private ISummonerSearch isc;

	// 전적 검색에 필요한 데이터를 API로 받아오기
	ModelAndView mav;
	String api_key = "RGAPI-4843ae9e-7ede-4140-8341-164bbda24a7b";
	BufferedReader br = null;
	JsonParser jsonParser = new JsonParser();

	public ModelAndView sSummonerSearch(String summonerName) {

		log.info("소환사 이름: " + summonerName);
		mav = new ModelAndView();

		try {
			// 소환사 프로필 정보 및 id(puuid, accountId) 추출
			String apiUrl = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/" + summonerName
					+ "?api_key=" + api_key;
			String urlBr = getUrl(apiUrl);

			// bufferedReader로 가져온 urlBr 데이터를 json 객체로 Parser
			JsonObject k = (JsonObject) jsonParser.parse(urlBr);
			int profileIconId = k.get("profileIconId").getAsInt();
			String puuid = k.get("puuid").getAsString();
			long summonerLevel = k.get("summonerLevel").getAsLong();
			String id = k.get("id").getAsString();
			String name = k.get("name").getAsString();

			// 소환사 상세정보 추출(전체게임 승률, 티어, 티어포인트)
			String apiUrl1 = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/" + id + "?api_key="
					+ api_key;

			urlBr = getUrl(apiUrl1);
			JsonArray jsonArray = (JsonArray) jsonParser.parse(urlBr);

			String freeTier = null;
			int freeLeaguePoint = 0;
			int freeWins = 0;
			int freeLosses = 0;
			double freeWinRate = 0;

			String soloTier = null;
			int soloLeaguePoint = 0;
			int soloWins = 0;
			int soloLosses = 0;
			double soloWinRate = 0;

			// 위에 jsonArray를 parser하고난 후에 json object를 구하기 위한 과정이다.
			// solo rank와 free rank가 추출되는데, 둘다, 둘중 하나 혹은 하나도 출력되지 않는 경우도 있기에 아래와 같이 수식을
			// 작성하였다.
			if (jsonArray.size() == 2) {
				JsonObject p = (JsonObject) jsonArray.get(0);
				JsonObject p1 = (JsonObject) jsonArray.get(1);

				if (p.get("queueType").getAsString().equals("RANKED_FLEX_SR")) {
					freeTier = p.get("tier").getAsString();
					freeLeaguePoint = p.get("leaguePoints").getAsInt();
					freeWins = p.get("wins").getAsInt();
					freeLosses = p.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = p1.get("tier").getAsString();
					soloLeaguePoint = p1.get("leaguePoints").getAsInt();
					soloWins = p1.get("wins").getAsInt();
					soloLosses = p1.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;
				} else {
					freeTier = p1.get("tier").getAsString();
					freeLeaguePoint = p1.get("leaguePoints").getAsInt();
					freeWins = p1.get("wins").getAsInt();
					freeLosses = p1.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = p.get("tier").getAsString();
					soloLeaguePoint = p.get("leaguePoints").getAsInt();
					soloWins = p.get("wins").getAsInt();
					soloLosses = p.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;

				}
			} else if (jsonArray.size() == 1) {
				JsonObject p = (JsonObject) jsonArray.get(0);
				if (p.get("queueType").getAsString().equals("RANKED_FLEX_SR")) {
					freeTier = p.get("tier").getAsString();
					freeLeaguePoint = p.get("leaguePoints").getAsInt();
					freeWins = p.get("wins").getAsInt();
					freeLosses = p.get("losses").getAsInt();
					freeWinRate = Math.round(((double) freeWins / (freeWins + freeLosses)) * 100) / 100.0;
					soloTier = "unranked";
				} else {
					soloTier = p.get("tier").getAsString();
					soloLeaguePoint = p.get("leaguePoints").getAsInt();
					soloWins = p.get("wins").getAsInt();
					soloLosses = p.get("losses").getAsInt();
					soloWinRate = Math.round(((double) soloWins / (soloWins + soloLosses)) * 100) / 100.0;
					freeTier = "unranked";
				}
			} else {
				soloTier = "unranked";
				freeTier = "unranked";
			}

			System.out.println(freeTier);
			System.out.println(freeLeaguePoint);
			System.out.println(freeWins);

			ModelAndView matchData = summonerMatchDetail(puuid);

			mav.addObject("profileIconId", profileIconId);
			mav.addObject("LV", summonerLevel);
			mav.addObject("name", name);
			mav.addObject("freeTier", freeTier);
			mav.addObject("freeLeaguePoint", freeLeaguePoint);
			mav.addObject("freeWins", freeWins);
			mav.addObject("freeLosses", freeLosses);
			mav.addObject("freeWinRate", (int) (freeWinRate * 100));
			mav.addObject("soloTier", soloTier);
			mav.addObject("soloLeaguePoint", soloLeaguePoint);
			mav.addObject("soloWins", soloWins);
			mav.addObject("soloLosses", soloLosses);
			mav.addObject("soloWinRate", (int) (soloWinRate * 100));

		} catch (Exception e) {
			System.out.println("오류=" + e.getMessage());
		}

		return mav;

	}

	private String getUrl(String apiUrl) throws Exception {
		URL url = new URL(apiUrl);
		// URL에서 URLConnection 객체 얻기(프로토콜이 http://인 경우 아래 객체로 캐스팅 가능)
		HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection(); // openConnection() 메서드는
																					// IOException 발생
		urlconnection.setRequestMethod("GET");
		br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(), "UTF-8"));
		System.out.println(br);

		String result = "";
		String line;
		while ((line = br.readLine()) != null) {
			result += line;
		}

		return result;
	}

	private ModelAndView summonerMatchDetail(Object object) {

		mav = new ModelAndView();
		String summonerMatch = "https://asia.api.riotgames.com/lol/match/v5/matches/by-puuid/" + object
				+ "/ids?start=0&count=10&api_key=" + api_key;
		try {
			String urlBr = getUrl(summonerMatch);
			JsonParser jsonParser = new JsonParser();
			JsonArray jsonArray = (JsonArray) jsonParser.parse(urlBr);
			System.out.println("gameData=" + jsonArray);

			ArrayList<String> matchDataList = new ArrayList<String>();
			if (jsonArray != null) {
				for (int i = 0; i < jsonArray.size(); i++) {
					matchDataList.add(jsonArray.get(i).toString());
				}
			}

			System.out.println("gameData=" + matchDataList.get(0).replaceAll("\"", ""));
			String matchUrl = "https://asia.api.riotgames.com/lol/match/v5/matches/";

			for (int k = 0; k < matchDataList.size(); k++) {
				GameDetailShowInfo sg = isc.SearchGame(matchDataList.get(k).replaceAll("\"", ""));

				if (sg == null) {
					String urlBr1 = getUrl(matchUrl + matchDataList.get(k).replaceAll("\"", "") + "?api_key=" + api_key);

					JsonParser jsonParser1 = new JsonParser();
					JsonObject p = (JsonObject) jsonParser1.parse(urlBr1);
					JsonObject info = (JsonObject) p.get("info");
					JsonArray participants = info.getAsJsonArray("participants");
					
					for (int j = 0; j < 10; j++) {
						Map<String, String> preMap = new HashMap<String, String>();
						JsonObject participant = (JsonObject) participants.get(j);
						JsonObject challenges = (JsonObject) participant.get("challenges");
						JsonObject perks = (JsonObject) participant.get("perks");
						JsonArray styles = perks.getAsJsonArray("styles");
						JsonObject PrimeSelections = (JsonObject) styles.get(0);
						JsonObject SubSelections = (JsonObject) styles.get(1);
						JsonArray prime = PrimeSelections.getAsJsonArray("selections");
						JsonObject mainPrime = (JsonObject) prime.get(0);
						

						preMap.put("summonerName", participant.get("summonerName").getAsString());
						preMap.put("championName", participant.get("championName").getAsString());
						preMap.put("championId", participant.get("championId").getAsString());
						preMap.put("champLevel", participant.get("champLevel").getAsString());
						preMap.put("win", participant.get("win").getAsString());

						preMap.put("summoner1Id", participant.get("summoner1Id").getAsString());
						preMap.put("summoner2Id", participant.get("summoner2Id").getAsString());
						preMap.put("perk", mainPrime.get("perk").getAsString());
						preMap.put("style", SubSelections.get("style").getAsString());

						preMap.put("kills", participant.get("kills").getAsString());
						preMap.put("assists", participant.get("assists").getAsString());
						preMap.put("deaths", participant.get("deaths").getAsString());
						preMap.put("kda", challenges.get("kda").getAsString());
						preMap.put("killParticipation", challenges.get("killParticipation").getAsString());
						preMap.put("totalDamageDealtToChampions",participant.get("totalDamageDealtToChampions").getAsString());
						preMap.put("totalDamageTaken", participant.get("totalDamageTaken").getAsString());

						preMap.put("visionWardsBoughtIngame", participant.get("visionWardsBoughtInGame").getAsString());
						preMap.put("wardsKilled", participant.get("wardsKilled").getAsString());
						preMap.put("wardsPlaced", participant.get("wardsPlaced").getAsString());
						preMap.put("totalMinionsKilled", participant.get("totalMinionsKilled").getAsString());

						preMap.put("item0", participant.get("item0").getAsString());
						preMap.put("item1", participant.get("item1").getAsString());
						preMap.put("item2", participant.get("item2").getAsString());
						preMap.put("item3", participant.get("item3").getAsString());
						preMap.put("item4", participant.get("item4").getAsString());
						preMap.put("item5", participant.get("item5").getAsString());
						preMap.put("item6", participant.get("item6").getAsString());
						
						preMap.put("gameDuration",info.get("gameDuration").getAsString());
						preMap.put("gameEndTimestamp", info.get("gameEndTimestamp").getAsString());
//						String items = 
					}

//					GameCountMap.put(Integer.toString(i), gameData);
				}
			}
			mav.setViewName("jsonView");
//			mav.addObject("json", GameCountMap);

		} catch (Exception e) {
			System.out.println("오류=" + e.getMessage());
		}

		return mav;
	}

}