package com.kh.java.report.model.vo;

import java.util.Date;

public class ReportVo {
	
	private int no;
	private String title;
	private String content;
	private String writer;
	private String name;
	private int count;
	private Date writeDate;
	
	public ReportVo() {
	}

	public ReportVo(int no, String title, String content, String writer, String name, int count, Date writeDate) {
		this.no = no;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.name = name;
		this.count = count;
		this.writeDate = writeDate;
	}

	public ReportVo(String title, String content, String writer) {
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

	@Override
	public String toString() {
		return "ReportVo [no=" + no + ", title=" + title + ", content=" + content + ", writer=" + writer + ", name="
				+ name + ", count=" + count + ", writeDate=" + writeDate + "]";
	}
	
	
	
	
	
	

}
