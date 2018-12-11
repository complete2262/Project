package com.spring.project.vo;

public class Pimages {
	private int pboard1_id;
	private String o_name;
	private String file_name;
	private long file_size;
	
	
	public int getPboard1_id() {
		return pboard1_id;
	}
	public void setPboard1_id(int pboard1_id) {
		this.pboard1_id = pboard1_id;
	}
	public String getO_name() {
		return o_name;
	}
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public long getFile_size() {
		return file_size;
	}
	public void setFile_size(long file_size) {
		this.file_size = file_size;
	}
	@Override
	public String toString() {
		return "UploadFileVO [pboard1_id=" + pboard1_id + ", o_name=" + o_name + ", file_name=" + file_name
				+ ", file_size=" + file_size + "]";
	}
	
}
