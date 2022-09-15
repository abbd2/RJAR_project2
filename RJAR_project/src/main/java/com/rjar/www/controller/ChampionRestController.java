package com.rjar.www.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.rjar.www.bean.Champion;
import com.rjar.www.bean.Reply;
import com.rjar.www.service.championDetail.ChampionDetailMM;


@RestController
public class ChampionRestController {
	
	@Autowired
	private ChampionDetailMM champmm;
	
	@GetMapping(value = "/tierList" , produces="text/plain;charset=utf-8")
	public String restTierList(Champion champ) {
		String tierList = champmm.restTierList(champ);
		return tierList;
	}
	
	@GetMapping(value = "/laneImg", produces="text/plain;charset=utf-8")
	public String restChampionList(Champion champ) {
		String championList = champmm.restChampionList(champ);
		return championList;
	}
	
	@GetMapping(value = "/rotation", produces="text/plain;charset=utf-8")
	public String getRotationChamp() {
		String rotationChamp = champmm.getRotationChamp();
		return rotationChamp;
	}
	
	@GetMapping(value = "/selectChamp", produces = "application/json;charset=utf-8")
	public List<Champion> getselectChamp(String text) {
		List<Champion> selectChamp = champmm.getSelectChamp(text);
		return selectChamp;
	}
	
	@GetMapping(value = "/replyInsert", produces = "application/json;charset=utf-8")
	public List<Reply> replyInsert(Reply reply, HttpSession session) {
		reply.setR_id(session.getAttribute("m_id").toString());
		List<Reply> rList = champmm.replyInsert(reply);
		return rList;
	}
	
	@GetMapping(value = "/selectReply", produces = "application/json;charset=utf-8")
	public List<Reply> selectReply(Reply reply, HttpSession session) {
		List<Reply> rList = champmm.selectReply(reply);
		return rList;
	}
	
	@GetMapping(value = "/deleteReply", produces = "application/json;charset=utf-8")
	public List<Reply> deleteReply(Reply reply, HttpSession session) {
		List<Reply> rList = champmm.deleteReply(reply);
		return rList;
	}
	
	
	
	


}
