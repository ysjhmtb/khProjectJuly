package com.kh.java.product.model.vo;

public class ProductVo {
	private int pno;
	private String name;
	private int price;
	private String img_src;
	private String category;
	private String content;
	private int writerNo;
	private String writerName;
	private String writerAddr;
	private String writerPhone;
	private String writerEmail;
	
	public ProductVo(){
		
	}
	
	public ProductVo(String name, int price, String img_src, String category, String content, int writerNo) {
		super();
		this.name = name;
		this.price = price;
		this.img_src = img_src;
		this.category = category;
		this.content = content;
		this.writerNo = writerNo;
	}
	
	
	
	public String getWriterPhone() {
		return writerPhone;
	}

	public void setWriterPhone(String writerPhone) {
		this.writerPhone = writerPhone;
	}

	public String getWriterEmail() {
		return writerEmail;
	}

	public void setWriterEmail(String writerEmail) {
		this.writerEmail = writerEmail;
	}

	public String getWriterAddr() {
		return writerAddr;
	}

	public void setWriterAddr(String writerAddr) {
		this.writerAddr = writerAddr;
	}

	public String getWriterName() {
		return writerName;
	}

	public void setWriterName(String writerName) {
		this.writerName = writerName;
	}

	public int getWriterNo() {
		return writerNo;
	}

	public void setWriterNo(int writerNo) {
		this.writerNo = writerNo;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getImg_src() {
		return img_src;
	}
	public void setImg_src(String img_src) {
		this.img_src = img_src;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
