package com.kh.java.lecture.model.vo;

public class LectureVo {
	private int num;
	private String title;
	private String content;
	private String name;
	private String place;
	private String period;
	private int payment;
	private int person;
	private String phone;
	private String ckId;
	
	public LectureVo(){}
	
	public LectureVo(int num, String title, String content, String name, String place, String period, int payment,
			int person, String phone, String ckId) {
		super();
		this.num = num;
		this.title = title;
		this.content = content;
		this.name = name;
		this.place = place;
		this.period = period;
		this.payment = payment;
		this.person = person;
		this.phone = phone;
		this.ckId = ckId;
	}

	public LectureVo(String title, String content, String name, String place, String period, int payment, int person,
			String phone, String ckId) {
		super();
		this.title = title;
		this.content = content;
		this.name = name;
		this.place = place;
		this.period = period;
		this.payment = payment;
		this.person = person;
		this.phone = phone;
		this.ckId = ckId;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public int getPayment() {
		return payment;
	}

	public void setPayment(int payment) {
		this.payment = payment;
	}

	public int getPerson() {
		return person;
	}

	public void setPerson(int person) {
		this.person = person;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getckId() {
		return ckId;
	}

	public void setckId(String ckId) {
		this.ckId = ckId;
	}

	@Override
	public String toString() {
		return "LectureVo [num=" + num + ", title=" + title + ", content=" + content + ", name=" + name + ", place="
				+ place + ", period=" + period + ", payment=" + payment + ", person=" + person + ", phone=" + phone
				+ ", ckId=" + ckId + "]";
	}
	
}
