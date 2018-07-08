package com.kh.java.notice.model.vo;

import java.util.Date;

public class NoticeVo {
	private int no;
	private String title;
	private String content;
	private String writer;
	private int count;
	private Date writeDate;
	private String name;
	
	
	public NoticeVo() {	}


	public NoticeVo(int no, String title, String content, String writer, int count, Date writeDate, String name) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.count = count;
		this.writeDate = writeDate;
		this.name = name;
	}


	public NoticeVo(String title, String content, String writer) {
		this.title = title;
		this.content = content;
		this.writer = writer;
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


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	@Override
	public String toString() {
		return "NoticeVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", count="
				+ count + ", writeDate=" + writeDate + ", name=" + name + "]";
	}
	
	
	
	
	

}
