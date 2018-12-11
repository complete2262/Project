package com.spring.project.service.imple;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.service.PreplyService;
import com.spring.project.vo.Preply;

// alt + shift + t => Extract Interface
@Repository("reply")
public class PreplyServiceImple implements PreplyService {
	
	@Inject
	private SqlSession rDAO;
	
	private static final String ns = "Preply.Mapper";
	
	
	
	@Override
	@Transactional
	public List<HashMap<String, Preply>> getReplyList(Preply rvo) {
		return rDAO.selectList(ns+".preply1List", rvo) ;
	}
	
	@Override
	@Transactional
	public int totalRecord(int id) {
		return rDAO.selectOne(ns+".getTotalRecord", id) ;
	}
	
	@Override
	@Transactional
	public int rInsert(int pboard1_id, Preply rvo) {
		rDAO.update(ns+".replyCount_up", pboard1_id);
		return rDAO.insert(ns + ".reply1Insert", rvo);
	}
	@Override
	@Transactional
	public int rUpdate(Preply rvo) {
		return rDAO.update(ns + ".reply1Update", rvo);
	}
	@Override
	@Transactional
	public int rDelete(int pboard1_id, Preply rvo) {
		rDAO.update(ns+".replyCount_down", pboard1_id);
		return rDAO.delete(ns + ".replyDelete", rvo);
	}

	@Override
	@Transactional
	public HashMap<String, Object> rDetail(Preply rvo) {
		return rDAO.selectOne(ns+".replyDetail", rvo) ;
	}

	@Override
	@Transactional
	public int rChoiceUpdate(int pboard1_id) {
		return rDAO.update(ns+".rChoiceUpdate", pboard1_id) ;
	}


	
	
}
