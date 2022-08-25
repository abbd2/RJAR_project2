package com.rjar.www.dao;

import java.util.List;

import com.rjar.www.bean.Champion;


public interface IchampionDao {
	List<Champion> getChampionList(String tier);

	List<Champion> getwinRate(int champId, String tier);

}
