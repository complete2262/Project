package com.spring.project.vo;

import java.util.Date;

public class Preply {

	private int id;
	private int puser_id;
	private int pboard1_id;
	private String content;
	private Date regdate;
	private int choice;
	private int rchoice;
	
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
	public int getPboard1_id() {
		return pboard1_id;
	}
	public void setPboard1_id(int pboard1_id) {
		this.pboard1_id = pboard1_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getChoice() {
		return choice;
	}
	public void setChoice(int choice) {
		this.choice = choice;
	}
	
	public int getRchoice() {
		return rchoice;
	}
	public void setRchoice(int rchoice) {
		this.rchoice = rchoice;
	}
	@Override
	public String toString() {
		return "Preply [id=" + id + ", puser_id=" + puser_id + ", pboard1_id=" + pboard1_id + ", content=" + content
				+ ", regdate=" + regdate + ", choice=" + choice + ", rchoice=" + rchoice + "]";
	}
		
}
