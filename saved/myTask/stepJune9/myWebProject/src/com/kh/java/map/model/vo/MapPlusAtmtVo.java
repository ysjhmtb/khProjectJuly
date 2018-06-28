package com.kh.java.map.model.vo;

public class MapPlusAtmtVo {
	
	private MapVo map;
	private AttachmentMapVo atmt;
	
	public MapPlusAtmtVo() {
		
	}

	public MapPlusAtmtVo(MapVo map, AttachmentMapVo atmt) {
		super();
		this.map = map;
		this.atmt = atmt;
	}

	
	
	public MapVo getMap() {
		return map;
	}

	public void setMap(MapVo map) {
		this.map = map;
	}

	public AttachmentMapVo getAtmt() {
		return atmt;
	}

	public void setAtmt(AttachmentMapVo atmt) {
		this.atmt = atmt;
	}

	
	
	
	
	
	

}
