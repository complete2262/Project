package com.spring.project.service.imple;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.service.PboardService;
import com.spring.project.vo.Bridge;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;

// alt + shift + t => Extract Interface
@Repository("board")
public class PboardServiceImple implements PboardService {
	
	@Inject
	private SqlSession bDAO;
	
	private static final String ns = "Pboard.Mapper";
	
	
	
	@Override
	@Transactional
	public List<HashMap<String,Object>> getBoardList(Page pvo, Pboard bvo) {
		int pageNum = pvo.getPageNum();
		int pageSize = pvo.getPageSize();
		int startRow = ((pageNum -1 ) * pageSize) +1;
		int endRow = pageNum * pageSize;
		String tag = bvo.getTag();
		
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		pvo.setTag(tag);
		
		
		return bDAO.selectList(ns+".boardList", pvo) ;
	}
	
	@Override
	@Transactional
	public int totalRecord_board(Pboard bvo) {
		return bDAO.selectOne(ns+".getTotalRecord_board",bvo) ;
	}
	
	@Override
	@Transactional
	public int totalRecord_reply(int id) {
		return bDAO.selectOne(ns+".getTotalRecord_reply", id) ;
	}
	
	@Override
	@Transactional
	public int bridgeInsert(Bridge evo, Pboard bvo) { 
		  
		int i= 0;
		try {
		i = bDAO.selectOne(ns+".getBridgeList", evo);}
		catch (Exception e) {
			e.getStackTrace();
		}
		if(i==0) {
			bDAO.insert(ns+".bridgeInsert", evo);
			bDAO.update(ns + ".choiceCount1", bvo);
		}
		
		  
		return i;
	}

	@Override
	@Transactional
	public int bridgeDelete(Bridge evo, Pboard bvo) {
		int i= 0;
		try {
		i = bDAO.selectOne(ns+".getBridgeList", evo);}
		catch (Exception e) {
			e.getStackTrace();
		}
		if(i!=0) {
			bDAO.delete(ns+".bridgeDelete", evo);
			bDAO.update(ns + ".choiceCancel", bvo);
		}
		
		  
		return i;
	}
	@Override
	@Transactional
	public HashMap<String,Object> bDetail (Pboard bvo) {
		return bDAO.selectOne(ns+".boardDetail",bvo) ;
	}
	/*@Override
	public int replyInsert(BoardVO vo) {
		return bDAO.insert(ns + ".replyInsert", vo);
	}*/
	@Override
	@Transactional
	public int bInsert(Pboard bvo) {
		return bDAO.insert(ns + ".boardInsert", bvo);
	}
	@Override
	@Transactional
	public int bUpdate(Pboard bvo) {
		return bDAO.update(ns + ".boardUpdate", bvo);
	}
	@Override
	@Transactional
	public int bDelete(Pboard bvo) {
		return bDAO.delete(ns + ".boardDelete", bvo);
	}

	@Override
	@Transactional
	public int viewCount(Pboard bvo) {
		return bDAO.update(ns+".viewCount", bvo);
	}

	@Override
	@Transactional
	public List<HashMap<String, Object>> getlatestList(Page pvo, Pboard bvo) {
		int startRow = 1;
		int endRow = 5;
		
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		
		return bDAO.selectList(ns+".latestList", pvo) ;
	}

	@Override
	@Transactional
	public List<HashMap<String, Object>> getlikeList(Page pvo, Pboard bvo) {
		int startRow = 1;
		int endRow = 5;
		
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		
		return bDAO.selectList(ns+".likeList", pvo) ;
	}

	@Override
	@Transactional
	public List<Pboard> getSearchList(Page pvo) {
		int pageNum = pvo.getPageNum();
		int pageSize = pvo.getPageSize();
		int startRow = ((pageNum -1 ) * pageSize) +1;
		int endRow = pageNum * pageSize;
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		return bDAO.selectList(ns+".searchList", pvo);
	}

	@Override
	@Transactional
	public int searchRecordCount(Page pvo) {
		return bDAO.selectOne(ns+".searchRecordCount", pvo);
	}

	@Override
	@Transactional
	public int bridgeCheck(Bridge evo) {
		return bDAO.selectOne(ns+".getBridgeList", evo);
	}

	@Override
	@Transactional
	public int bridge2Check(int pboard1_id) {
		return bDAO.selectOne(ns+".getBridge2List", pboard1_id);
	}
	
}
