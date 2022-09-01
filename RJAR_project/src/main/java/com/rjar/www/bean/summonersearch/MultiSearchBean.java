package com.rjar.www.bean.summonersearch;

<<<<<<< HEAD
import org.springframework.beans.factory.annotation.Value;
import org.springframework.lang.Nullable;
=======
>>>>>>> 872ee7ab971e8f35afedbbbb2626b579f0d085ff
import org.springframework.stereotype.Repository;

import lombok.Data;

// 다시커밋
@Data
@Repository
public class MultiSearchBean {
	
	private String summonerName;
//	private String mainLane; // 후처리로 작업
	private String tier;
	private String rank;
	private String lp;
	private int totalWins;
	private int totalLosses;
	private int totalWinRate;
	
	private String[] championName;
	private String[] lanes;
	private int[] kilss;
	private int[] deaths;
	private int[] assists;
	private String[] wins; // 10게임 경경기 결과
	private String[] agoTimeDate;
	
	// most는 전체 게임 고려이기 때문에 따로 클래스를 만들지 고려하고 나중에
	private String[] mostChampionNames;
	private double[] mostChampionKDA;
	private int[] mostChampGameCount; // 모스트 챔피언들의 경기 수
	private int[] mostChampionWinRate; // 모스트 챔피언들의 경기 수
	
}
