package com.spring.project.service;

import java.util.HashMap;
import java.util.List;

import com.spring.project.vo.Preply;

public interface PreplyService {
	
	List<HashMap<String, Preply>> getReplyList(Preply rvo);
	int totalRecord(int id);
	int rInsert(int pboard1_id, Preply rvo);
	HashMap<String,Object> rDetail(Preply rvo);
	int rUpdate(Preply rvo);
	int rDelete(int pboard1_id, Preply rvo);
	int rChoiceUpdate(int pboard1_id);
}