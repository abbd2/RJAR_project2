package com.rjar.www.dao;

import java.util.ArrayList;
<<<<<<< HEAD:RJAR_project/src/main/java/com/rjar/www/dao/ISummonerSearchDao.java



=======
import java.util.HashMap;
>>>>>>> 872ee7ab971e8f35afedbbbb2626b579f0d085ff:RJAR_project/src/main/java/com/rjar/www/dao/ISummonerSearch.java
import java.util.List;
import java.util.Map;

import com.rjar.www.bean.summonersearch.GameDetailShowInfo;

public interface ISummonerSearchDao {

	List<GameDetailShowInfo> SearchGame(String ss_gameId);
	
	boolean insertGameData(Map<String, Object> preMap);


}
