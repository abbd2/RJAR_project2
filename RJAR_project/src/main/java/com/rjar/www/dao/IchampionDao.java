package com.rjar.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rjar.www.bean.Champion;

public interface IchampionDao {

	List<Champion> getChampionList();

	List<Champion> getTierList(@Param("tier") String tier, @Param("lane") String lane);

	List<Champion> getLaneChamp(String lane);

	List<Champion> getRotaion(@Param("championId1") int championId1, @Param("championId2") int championId2, @Param("championId3") int championId3, @Param("championId4") int championId4,
	         @Param("championId5") int championId5, @Param("championId6") int championId6, @Param("championId7") int championId7, @Param("championId8") int championId8,
	         @Param("championId9") int championId9, @Param("championId10") int championId10, @Param("championId11") int championId11, @Param("championId12") int championId12,
	         @Param("championId13") int championId13, @Param("championId14") int championId14, @Param("championId15") int championId15, @Param("championId16") int championId16);

	List<Champion> getSelectChamp(String text);

	Champion getChampionName1(int championId);

	Champion getChampionName2(String championName);

}
