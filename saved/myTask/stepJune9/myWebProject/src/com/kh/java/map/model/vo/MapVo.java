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
	private String color;
	private String colortext;
	
	
	public MapVo() {
		
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
		this.colortext = colortext;
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
		this.colortext = colortext;
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
		return colortext;
	}


	public void setColortext(String colortext) {
		this.colortext = colortext;
	}


	@Override
	public String toString() {
		return "MapVo [marketName=" + marketName + ", marketNo=" + marketNo + ", marketLat=" + marketLat
				+ ", marketLng=" + marketLng + ", marketExpl=" + marketExpl + ", startDay=" + startDay + ", endDay="
				+ endDay + ", url=" + url + ", color=" + color + ", colortext=" + colortext + "]";
	}
	

	



	


	



	


	
	
	





	

	
	
	
	
}
