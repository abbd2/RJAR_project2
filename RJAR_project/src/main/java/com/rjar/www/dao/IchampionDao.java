package com.rjar.www.dao;

import java.util.List;

<<<<<<< HEAD


=======
>>>>>>> 33f2b520a353617e195dfad65a7a01f597adf93f
import org.apache.ibatis.annotations.Param;

import com.rjar.www.bean.Champion;

public interface IchampionDao {

	List<Champion> getChampionList();

	List<Champion> getTierList(@Param("tier") String tier, @Param("lane") String lane);

	List<Champion> getLaneChamp(String lane);

	Champion getRotaion(int championId);

	List<Champion> getSelectChamp(String text);

}
