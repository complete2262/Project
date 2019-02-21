package com.spring.project.service;

import java.util.HashMap;
import java.util.List;

import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;
import com.spring.project.vo.Puser;


public interface PuserService {

	//가입이나 수정등 됐다, 안됐다 구별은 0 or 1 로 받기때문에 int 선언
	// 로그인정보나 유저정보같은경우는 해당 vo 변수가 필요하기 때문에 객체선언
	
	Login uLogin(Login lvo);

	Puser uDetail(Login lvo);

	int totalRecord_board(Pboard bvo); //내가 쓴 게시글 수
	
	int totalRecord_reply(Pboard bvo); // 내가 쓴 댓글 수
	
	List<HashMap<String,Object>>getWorkList_board(Page pvo, Pboard bvo, Login lvo); //페이징처리 / 글제목,분류 / 글쓴이
	
	List<HashMap<String,Object>>getWorkList_reply(Page pvo, Pboard bvo, Login lvo);
	
	int uInsert(Puser uvo);

	int uUpdate(Puser uvo);

	int uDelete(Puser uvo, Login lvo);
	
	int uIdcheck(Puser uvo);
	
	int uNnamecheck(Puser uvo);
	
}
