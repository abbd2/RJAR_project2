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
	
	private String spell1;
	private String spell2;
	private double spellwinrate;
	private int spellpick;
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
	
	

}
