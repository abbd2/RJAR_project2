package com.rjar.www.dao;

import java.util.List;

import com.rjar.www.bean.summonersearch.GameDetailShowInfo;

public interface ISummonerSearch {

	List<GameDetailShowInfo> SearchGame(String ss_gameId);

}
