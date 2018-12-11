package com.spring.project.vo;

public class Page {

	private int pageNum; // ���� Page��ȣ (pvo�� �ݵ�� �ʿ������� ����)
	private int pageSize;  // page �� ��� Data ����
	private int totalRecord; // ��ü Record ����
	private int startRow; // ��� �Ϸ��� ù��° rownum
	private int endRow; // ��� �Ϸ��� ������ rownum
	private int board_id;
	private int id;
	private String tag;
	private String searchOption;
	private String keyword;
	
	
	
	public String getSearchOption() {
		return searchOption;
	}
	public void setSearchOption(String searchOption) {
		this.searchOption = searchOption;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	@Override
	public String toString() {
		return "Page [pageNum=" + pageNum + ", pageSize=" + pageSize + ", totalRecord=" + totalRecord + ", startRow="
				+ startRow + ", endRow=" + endRow + ", board_id=" + board_id + ", id=" + id + ", tag=" + tag
				+ ", searchOption=" + searchOption + ", keyword=" + keyword + "]";
	}




}
