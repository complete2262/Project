package com.spring.project.service;

import java.util.HashMap;
import java.util.List;

import com.spring.project.vo.Login;
import com.spring.project.vo.Page;
import com.spring.project.vo.Pboard;
import com.spring.project.vo.Puser;


public interface PuserService {

	//�����̳� ������ �ƴ�, �ȵƴ� ������ 0 or 1 �� �ޱ⶧���� int ����
	// �α��������� ���������������� �ش� vo ������ �ʿ��ϱ� ������ ��ü����
	
	Login uLogin(Login lvo);

	Puser uDetail(Login lvo);

	int totalRecord_board(Pboard bvo); //���� �� �Խñ� ��
	
	int totalRecord_reply(Pboard bvo); // ���� �� ��� ��
	
	List<HashMap<String,Object>>getWorkList_board(Page pvo, Pboard bvo, Login lvo); //����¡ó�� / ������,�з� / �۾���
	
	List<HashMap<String,Object>>getWorkList_reply(Page pvo, Pboard bvo, Login lvo);
	
	int uInsert(Puser uvo);

	int uUpdate(Puser uvo);

	int uDelete(Puser uvo, Login lvo);
	
	int uIdcheck(Puser uvo);
	
	int uNnamecheck(Puser uvo);
	
}
