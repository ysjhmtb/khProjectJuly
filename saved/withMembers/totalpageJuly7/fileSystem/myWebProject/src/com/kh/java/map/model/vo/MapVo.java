package com.kh.java.map.model.vo;

import java.sql.Date;

public class MapVo {

	
	
	private String marketName;
	private int marketNo;
	private double marketLat;
	private double marketLng;
	private String marketExpl;
	private Date startDay;
	private Date endDay;
	private String url;
	
	//달력 관련 데이터
	private String color;
	private String textColor;
	private String start;
	private String end;
	private String title;
	private String fileName;
	
	//리뷰 토탈 카운터
	private int reviewTotalCount;
	
	
	public MapVo() {
		
	}
	
	
	
	

	//캘린더 관련 vo
	public MapVo(String url, String color, String textColor, String start, String end, String title) {
		this.url = url;
		this.color = color;
		this.textColor = textColor;
		this.start = start;
		this.end = end;
		this.title = title;
	}






	public MapVo(String marketName, double marketLat, double marketLng, 
			String marketExpl, Date startDay,
			Date endDay, String url, String color, String colortext) {
		super();
		this.marketName = marketName;
		this.marketLat = marketLat;
		this.marketLng = marketLng;
		this.marketExpl = marketExpl;
		this.startDay = startDay;
		this.endDay = endDay;
		this.url = url;
		this.color = color;
		this.textColor = colortext;
	}


	public MapVo(String marketName, int marketNo, double marketLat, double marketLng, String marketExpl, Date startDay,
			Date endDay, String url, String color, String colortext) {
		super();
		this.marketName = marketName;
		this.marketNo = marketNo;
		this.marketLat = marketLat;
		this.marketLng = marketLng;
		this.marketExpl = marketExpl;
		this.startDay = startDay;
		this.endDay = endDay;
		this.url = url;
		this.color = color;
		this.textColor = colortext;
	}


	public String getMarketName() {
		return marketName;
	}


	public void setMarketName(String marketName) {
		this.marketName = marketName;
	}


	public int getMarketNo() {
		return marketNo;
	}


	public void setMarketNo(int marketNo) {
		this.marketNo = marketNo;
	}


	public double getMarketLat() {
		return marketLat;
	}


	public void setMarketLat(double marketLat) {
		this.marketLat = marketLat;
	}


	public double getMarketLng() {
		return marketLng;
	}


	public void setMarketLng(double marketLng) {
		this.marketLng = marketLng;
	}


	public String getMarketExpl() {
		return marketExpl;
	}


	public void setMarketExpl(String marketExpl) {
		this.marketExpl = marketExpl;
	}


	public Date getStartDay() {
		return startDay;
	}


	public void setStartDay(Date startDay) {
		this.startDay = startDay;
	}


	public Date getEndDay() {
		return endDay;
	}


	public void setEndDay(Date endDay) {
		this.endDay = endDay;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getColortext() {
		return textColor;
	}


	public void setColortext(String colortext) {
		this.textColor = colortext;
	}



	public String getTextColor() {
		return textColor;
	}

	public void setTextColor(String textColor) {
		this.textColor = textColor;
	}

	public String getStart() {
		return start;
	}





	public void setStart(String start) {
		this.start = start;
	}





	public String getEnd() {
		return end;
	}





	public void setEnd(String end) {
		this.end = end;
	}





	public String getTitle() {
		return title;
	}





	public void setTitle(String title) {
		this.title = title;
	}

	



	public String getFileName() {
		return fileName;
	}





	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	



	public int getReviewTotalCount() {
		return reviewTotalCount;
	}





	public void setReviewTotalCount(int reviewTotalCount) {
		this.reviewTotalCount = reviewTotalCount;
	}





	@Override
	public String toString() {
		return "MapVo [color=" + color + ", textColor=" + textColor + ", start=" + start + ", end=" + end + ", title="
				+ title + "]";
	}




	

	



	


	



	


	
	
	





	

	
	
	
	
}
