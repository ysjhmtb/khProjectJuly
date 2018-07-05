package com.kh.java.review.model.vo;

import java.util.Date;

public class ReviewVo {

	private int no;
	private int marketNo;
	private String title;
	private String content;
	private String writer;
	private String name;
	private int count;
	private Date writeDate;
	private String marketTitle;
	
	public ReviewVo() {	}

	public ReviewVo(int no, String title, String content, String writer, String name, int count, Date writeDate,
			String marketTitle) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.name = name;
		this.count = count;
		this.writeDate = writeDate;
		this.marketTitle = marketTitle;
	}
	

	public ReviewVo(int no, int marketNo, String title, String content, String writer, String name, int count,
			Date writeDate, String marketTitle) {
		super();
		this.no = no;
		this.marketNo = marketNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.name = name;
		this.count = count;
		this.writeDate = writeDate;
		this.marketTitle = marketTitle;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getMarketTitle() {
		return marketTitle;
	}

	public void setMarketTitle(String marketTitle) {
		this.marketTitle = marketTitle;
	}
	
	

	public int getMarketNo() {
		return marketNo;
	}

	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}

	@Override
	public String toString() {
		return "ReviewVo [no=" + no + ", marketNo=" + marketNo + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", name=" + name + ", count=" + count + ", writeDate=" + writeDate
				+ ", marketTitle=" + marketTitle + "]";
	}

	
	
	
	
	
	
}
