package com.rjar.www.dao;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import com.rjar.www.bean.summonersearch.GameDetailShowInfo;

public interface ISummonerSearch {

	List<GameDetailShowInfo> SearchGame(String ss_gameId);
	
	boolean insertGameData(Map<String, Object> preMap);


}
