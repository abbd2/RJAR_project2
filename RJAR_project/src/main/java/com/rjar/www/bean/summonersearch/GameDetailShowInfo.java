package com.rjar.www.bean.summonersearch;

import lombok.Data;

import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class GameDetailShowInfo {

	// 사용하지 않는 것들은 지울 예정
	private String ss_gameId;
	private int ss_participantId;
	private int ss_championId;
	private String ss_championName; // 검색한 소환사의 챔피언 이름

	// ---------------- 게임 내용에 필요한 데이터 ----------------
	private int ss_champLevel;
	private String ss_summonerName; // 소환사 이름
	private String ss_win; // 경기 결과

	private int ss_spell1; // D 스펠
	private int ss_spell2; // F 스펠
	private int ss_mainRune; // 매 인룬
	private int ss_subRune;// 서브 룬

	private int ss_kills; // 킬
	private int ss_deaths; // 데스
	private int ss_assists; // 어시스트
	private double ss_killParticipation; // 해당 게임의 킬 관여율
	private int ss_totalDamageDealtToChampions; // 챔피언 딜량
	private int ss_totalDamageTaken; // 챔피언 받은 피해량

	private int ss_visionWardBuy;
	private int ss_wardKilled;
	private int ss_wardPlaced;
	private int ss_cs; // cs

	private String ss_items; // 0번 아이템 슬롯
	private int ss_earnGold;
	private int ss_dragon;
	private int ss_baron;
	private int ss_tower;


}
