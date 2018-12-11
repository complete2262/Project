package com.spring.project.service;

import java.util.HashMap;
import java.util.List;

import com.spring.project.vo.Bridge;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;

public interface PboardService {
	
	
	List<HashMap<String,Object>> getBoardList(Page pvo,  Pboard bvo);
	List<HashMap<String,Object>> getlatestList(Page pvo,  Pboard bvo);
	List<HashMap<String,Object>> getlikeList(Page pvo,  Pboard bvo);
	int totalRecord_board(Pboard bvo);
	int totalRecord_reply(int id);
	int bInsert(Pboard bvo);
	HashMap<String,Object> bDetail(Pboard bvo);
	int bUpdate(Pboard bvo);
	int bDelete(Pboard bvo);
	int bridgeCheck(Bridge evo);
	int bridge2Check(int pboard1_id);
	int bridgeInsert(Bridge evo, Pboard bvo); 
	int bridgeDelete(Bridge evo, Pboard bvo); 
	int viewCount(Pboard bvo);
	List<Pboard> getSearchList(Page pvo);
	int searchRecordCount(Page pvo);
}