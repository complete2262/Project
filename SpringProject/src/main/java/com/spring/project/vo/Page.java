package com.spring.project.vo;

public class Page {

	private int pageNum; // 현재 Page번호 (pvo에 반드시 필요하지는 않음)
	private int pageSize;  // page 당 출력 Data 갯수
	private int totalRecord; // 전체 Record 갯수
	private int startRow; // 출력 하려는 첫번째 rownum
	private int endRow; // 출력 하려는 마지막 rownum
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
