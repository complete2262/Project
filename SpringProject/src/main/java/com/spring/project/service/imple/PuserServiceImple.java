package com.spring.project.service.imple;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.spring.project.service.PuserService;
import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;
import com.spring.project.vo.Puser;

@Repository("user") //추후 autowired로 controller단에서 호출됨
public class PuserServiceImple implements PuserService{

	@Inject
	private SqlSession uDAO;
	
	private static final String ns="Puser.Mapper";
	
	@Override
	@Transactional
	public Login uLogin(Login lvo) {
		return uDAO.selectOne(ns+".userLogin", lvo);
	}

	@Override
	@Transactional
	public Puser uDetail(Login lvo) {
		return uDAO.selectOne(ns+".userDetail", lvo);
	}

	@Override
	@Transactional
	public int uInsert(Puser uvo) {
		return uDAO.insert(ns+".userInsert", uvo);
	}

	@Override
	@Transactional
	public int uUpdate(Puser uvo) {
		return uDAO.update(ns+".userUpdate", uvo);
	}

	@Override
	@Transactional
	public int uDelete(Puser uvo, Login lvo) {
		System.out.println(uvo);
		uDAO.insert(ns+".userInfo", uvo);
		return uDAO.delete(ns+".userDelete", lvo);
	}

	@Override
	@Transactional
	public int uIdcheck(Puser uvo) {
		return uDAO.selectOne(ns+".userIdcheck",uvo);
	}

	@Override
	@Transactional
	public int uNnamecheck(Puser uvo) {
		return uDAO.selectOne(ns+".userNnamecheck",uvo);
	}
	
	
	@Override
	@Transactional
	public int totalRecord_board(Pboard bvo) {
		return uDAO.selectOne(ns+".getTotalRecord_board",bvo) ;
	}
	
	@Override
	@Transactional
	public int totalRecord_reply(Pboard bvo) {
		return uDAO.selectOne(ns+".getTotalRecord_reply",bvo) ;
	}


	@Override
	@Transactional
	public List<HashMap<String,Object>>getWorkList_board(Page pvo,  Pboard bvo, Login lvo) {
		int pageNum = pvo.getPageNum();
		int pageSize = pvo.getPageSize();
		int startRow = ((pageNum -1 ) * pageSize) +1;
		int endRow = pageNum * pageSize;
		
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		
		return uDAO.selectList(ns+".myWork_board", pvo);
	}

	@Override
	@Transactional
	public List<HashMap<String,Object>>getWorkList_reply(Page pvo,  Pboard bvo, Login lvo) {
		int pageNum = pvo.getPageNum();
		int pageSize = pvo.getPageSize();
		int startRow = ((pageNum -1 ) * pageSize) +1;
		int endRow = pageNum * pageSize;
		
		pvo.setStartRow(startRow);
		pvo.setEndRow(endRow);
		return uDAO.selectList(ns+".myWork_reply", pvo);
	}

}//class
