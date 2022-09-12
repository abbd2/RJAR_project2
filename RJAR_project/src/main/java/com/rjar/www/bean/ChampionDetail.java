package com.rjar.www.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class ChampionDetail {
	
	private String tier;
	private String lane;
   
	private String championName;
	private String champion_kr_name;
	
	//스펠
	private String spell1;
	private String spell2;
	private String spell_winrate;
	private String spell_pick;
	private int spell_cnt;
	private int spell_win;
	private int spell_total; // 해당 라인 판수
	
	//아이템
	private String start1;
	private String start2;
	private int start_cnt;
	private int start_win;
	private double start_winrate;
	private double start_pick;
	
	private int main_rune;
	private int main_under1;
	private int main_under2;
	private int main_under3;
	private int main_under4;
	private int sub_rune;
	private int sub_under1;
	private int sub_under2;
	private String statperks; //처음에 검색한 결과값
	private double rune_winRate;
	private int rune_pick;
	
	private int runes_id;
	private String runes_icon;
	
	@Override // spell, lane 비교
	public boolean equals(Object obj) {
		ChampionDetail cmp=(ChampionDetail)obj;
		if(spell1==cmp.spell2 || spell2==cmp.spell1 || lane==cmp.lane)
			return true;
		return false;
	}

}
