package com.rjar.www.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rjar.www.bean.Champion;
import com.rjar.www.service.championDetail.ChampionDetailMM;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
public class ChampionRestController {
	
	@Autowired
	private ChampionDetailMM champmm;
	
	@RequestMapping(value = "/tierList" , produces="text/plain;charset=utf-8")
	public String restTierList(Champion champ) {
		String tierList = champmm.restTierList(champ);
		System.out.println(tierList);
		return tierList;
	}


}
