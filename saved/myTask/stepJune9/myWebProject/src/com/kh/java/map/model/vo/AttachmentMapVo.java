package com.kh.java.map.model.vo;

import java.sql.Date;

public class AttachmentMapVo {

	
	 private int fno;
	 private int marNo;
	 private String originName;
	 private String changeName;
	 private String filePath;
	 private Date uploadDate;
	 private int fileLevel;
	 private int downloadCount;
	 
	 public AttachmentMapVo() {
		 
	 }

	
	 
	 

	public AttachmentMapVo(int fno, int marNo, String originName, String changeName, String filePath, Date uploadDate,
			int fileLevel, int downloadCount) {
		super();
		this.fno = fno;
		this.marNo = marNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.downloadCount = downloadCount;
	}



	


	public int getFno() {
		return fno;
	}


	public void setFno(int fno) {
		this.fno = fno;
	}


	public int getMarNo() {
		return marNo;
	}

	public void setMarNo(int marNo) {
		this.marNo = marNo;
	}

	public String getOriginName() {
		return originName;
	}

	public void setOriginName(String originName) {
		this.originName = originName;
	}

	public String getChangeName() {
		return changeName;
	}

	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public int getFileLevel() {
		return fileLevel;
	}

	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	public int getDownloadCount() {
		return downloadCount;
	}

	public void setDownloadCount(int downloadCount) {
		this.downloadCount = downloadCount;
	}





	@Override
	public String toString() {
		return "AttachmentMapVo [fno=" + fno + ", marNo=" + marNo + ", originName=" + originName + ", changeName="
				+ changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate + ", fileLevel=" + fileLevel
				+ ", downloadCount=" + downloadCount + "]";
	}

	
	
	 
	 
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 
}
