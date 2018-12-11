package com.spring.project.vo;

public class Bridge {

	private int puser_id;
	private int pboard1_id;
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
	@Override
	public String toString() {
		return "Bridge [puser_id=" + puser_id + ", pboard1_id=" + pboard1_id + "]";
	}
	
	
	
	
}
