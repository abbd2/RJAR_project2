package com.rjar.www.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rjar.www.bean.Champion;

public interface IchampionDao {

   List<Champion> getChampionList();

   List<Champion> getTierList(@Param("tier") String tier,@Param("lane")String lane);

}
