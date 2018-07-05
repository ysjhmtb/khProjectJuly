package product.model.vo;

public class CartVo {
	private int cno; //장바구니 테이블 내에 상품들 시퀀스번호
	private int pno; //들어있는 상품의 상품번호
	private int mno; //장바구니 주인 멤버
	private int count; //상품 수량
	private ProductVo pv;
	
	public CartVo(){
		
	}

	public CartVo(int cno, int pno, int mno, int count, ProductVo pv) {
		super();
		this.cno = cno;
		this.pno = pno;
		this.mno = mno;
		this.count = count;
	}

	public ProductVo getPv() {
		return pv;
	}

	public void setPv(ProductVo pv) {
		this.pv = pv;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}
	
	
}
