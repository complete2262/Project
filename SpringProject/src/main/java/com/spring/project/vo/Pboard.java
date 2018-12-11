package com.spring.project.vo;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class Pboard {

	private int id;
	private int puser_id;
	private String title;
	private String content;
	private int cnt;
	private Date regdate;
	private String tag;
	private int choice;
	private int replyCount;
	private MultipartFile uploadFile;

	
	public int getChoice() {
		return choice;
	}



	public void setChoice(int choice) {
		this.choice = choice;
	}


	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public int getPuser_id() {
		return puser_id;
	}



	public void setPuser_id(int puser_id) {
		this.puser_id = puser_id;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public int getCnt() {
		return cnt;
	}



	public void setCnt(int cnt) {
		this.cnt = cnt;
	}



	public Date getRegdate() {
		return regdate;
	}



	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}



	public String getTag() {
		return tag;
	}



	public void setTag(String tag) {
		this.tag = tag;
	}


	public int getReplyCount() {
		return replyCount;
	}



	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	




	public MultipartFile getUploadFile() {
		return uploadFile;
	}



	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}



	@Override
	public String toString() {
		return "Pboard [id=" + id + ", puser_id=" + puser_id + ", title=" + title + ", content=" + content + ", cnt="
				+ cnt + ", regdate=" + regdate + ", tag=" + tag + ", choice=" + choice + ", replyCount=" + replyCount
				+ ", uploadFile=" + uploadFile + "]";
	}




	
}
